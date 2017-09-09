#!/bin/bash

# This file is part of 'fix-filenames-broken-encoding'.
#
# Copyright 2017 Sergio Lindo <sergiolindo.empresa@gmail.com>
#
# 'fix-filenames-broken-encoding' is free software: you can redistribute it and/or
# modify it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at your
# option) any later version.
#
# 'fix-filenames-broken-encoding' is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
# Public License for more details.
# You should have received a copy of the GNU General Public License along with
# 'fix-filenames-broken-encoding'. If not, see <http://www.gnu.org/licenses/>.

# list of encodings to try. (max 10)
enc=( latin1 windows-1252 )

while IFS= read -rd '' file <&3; do
    base=${file##*/} dir=${file%/*}

    # if converting from utf8 to utf8 succeeds, we'll assume the filename is ok.
    iconv -f utf8 <<< "$base" >/dev/null 2>&1 && continue

    # display the filename converted from each enc to utf8
    printf 'In %s:\n' "$dir/"
    for i in "${!enc[@]}"; do
        name=$(iconv -f "${enc[i]}" <<< "$base")
        printf '%2d - %-12s: %s\n' "$i" "${enc[i]}" "$name"
    done
    printf ' s - Skip\n'

    while true; do
        read -p "? " -n1 ans
        printf '\n'
        if [[ $ans = [0-9] && ${enc[ans]} ]]; then
            name=$(iconv -f "${enc[ans]}" <<< "$base")
            mv -iv "$file" "$dir/$name"
            break
        elif [[ $ans = [Ss] ]]; then
            break
        fi
    done
done 3< <(LC_ALL=C find . -depth -name "*[![:print:][:space:]]*" -print0)
