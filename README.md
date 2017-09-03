# Description

Sometimes it happened to me that some legacy project in a VCS comes with files that have characters outside from the ASCII table. Usually on languages other than english.
At some point the VCS get the filenames wrong and those files are not accesible anymore.

The script _fix-filenames-broken-encoding_ fix those filenames converting the special characters into utf-8.

Thanks to user 'geirha' in https://askubuntu.com/questions/113188/character-encoding-problem-with-filenames-find-broken-filenames
