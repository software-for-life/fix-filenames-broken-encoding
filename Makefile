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

path_bin = $(DESTDIR)/usr/local/bin/

default:
	@echo "use 'make install' to install"

.PHONY: install
install:
	mkdir -p $(path_bin)
	install -m 0655 src/fix-filenames-broken-encoding.sh "$(path_bin)"
	ln -s /usr/local/bin/fix-filenames-broken-encoding.sh "$(path_bin)"/fix-filenames-broken-encoding

.PHONY: remove
remove:
	rm "$(path_bin)"/fix-filenames-broken-encoding
	rm "$(path_bin)"/fix-filenames-broken-encoding.sh