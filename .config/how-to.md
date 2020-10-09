# Linux

* `nice`: change scheduling priority

# Age of the installation

* `# ls -actl /root`: display the change time of the files in the `/root` directory
* `# tune2fs -l /dev/sdx | grep created`: where `sdx` is the `/` partition,
	display the date of creation of the partition (only works for `ext2` or
	`ext4`)

# Size of files/directory

`du -sch <dir/file>`

# Git

* `git ls-files <directory/filename>`: display the files tracked by git in `directory`;
* `git reset HEAD~`: undo last unpushed commit without removeing the last changes;
* merge:
	* `git checkout <receiving-branch>`
	* `git pull`
	* `git merge`

# tmux

* prefix: key typed before any command `<c-space>`;
* `tmux list-sessions`: list the existing sessions;
* `tmux new-session -s hello`: create a new session named hello;
* `tmux kill-session -t hello`: kill session hello;
* `tmux kill-server`: kill tmux server;
* `tmux attach-session <session_name>`
* horizontal split: `<prefix>"` or `:split-window`
* vertical split: `<prefix>%`
* quit pane: `exit` or `<prefix><c-d>`
* command prompt: `<prefix>:`
* `set`:
	* `-g`: global, every session, window and pane;
	* `-w`: window specific;

# Qt display issues

`export QT_SCALE_FACTOR=1.0`

# diff/comm

* `diff -r A B`: list the files which are only in A or B ainsi que les fichiers
	qui sont différents;
* `comm -23 file1 file2`: find lines only in file1;
* `comm -13 file1 file2`: find lines only in file2;
* `comm -12 file1 file2`: find lines common to both files.

# pacman

* `pacman -Qqe`: list installed packages;
* `sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort packages.txt))`:
	install packages.

# C++

If a very weird error occurs, check for uninitialized members.

* cppcheck: `cppcheck src --output-file=check.txt --inconclusive --enable=warning --includes-file=include...`
* valgrind: `valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --verbose --log-file=valgrind.out.log <path_to_binary>`
* clang-tidy: `clang-tidy src/graph.cpp -- -Iinclude `` --std=c++17`
* pck-config: `pkg-config --cflags Qt5Widgets`
* get the most recent core dump for the bar executable: `coredumpctl -o bar.coredump dump path/to/bar`
* get the most recent core dump file: `coredumpctl dump -1 -o bin.coredump`
* see the kernel core configuration: `# cat /proc/sys/kernel/core_pattern`
* set unlimited number of core files: `ulimit -c unlimited`
* get the assembly code: `obdump -d <binary>`

# gdb

## Core files

* run gdb using core file: `gdb <path_to_executable> <path_to_core_file>`
* `bt`: display the backtrace before crash

# Artix

## Runit

### sv

* `status|s`: display the status of the service
* `up|u`: starts the service, restarts it if it fails
* `down|d`: kill the service (or start ./finish if it exists)
* `once|o`: starts the service but do not reattempt if it fails

**Options:**

* `-v`: wait 7 sec before `up/down/term/once/cont/exit`
* `-w sec`: wait *sec* sec before `up/down/term/once/cont/exit`

**Return:**
* `0`: ok
* `1-99`: number of *service* from the list of *services* which failed

### chpst

Runs a program with a changed environment defined by the arguments (see `man chpst`)

### runsv

Starts and monitor service

### Actions

* `# unlink /run/runit/service/`

# Users

* `awk -F '{ print $1 }' /etc/passwd`: list all users on the computer
* `useradd -m <name>`: create user `<name>` with home directory
* `addgroup <name>`: create groupe `<name>`
* `usermod -a -G <groupe> <user>`: adds `<user>` to `<group>`
* `(chown -R <name>|chgrp -R :<group>) <directory>`: recursively changes the owner and group of the files and directories inside `<directory>`
* `setfacl -m g:<group>:rx -R <directory>`: recursively modify the priviledges of `<directory>` (can also be used with `u:<name>:...` for users)
* `find . -type d -exec chmod 755 {} \;`: find directories permissions;
* `find . -type f -exec chmod 644 {} \;`: find directories permissions;

# Temperature

* `sensors`: display temperature information

# Ext4 extern drives

* `# fdisk /dev/sdx1`: make partition table for `sdx` device;
* `# mkfs.ext4 /dev/sdx1`: use `ext4` format;
* `# mount /dev/sdx1 /mnt`: mount the drive;
* `# chown guillaume: /mnt`: give all the files permissions for user `guillaume`.

# Fzf

* `history | fzf`: look for recent commands;
* `nvim -O **`: choose files using `TAB` and open them in neovim;

## Zsh integration

* `ctrl+t`: run fzf on all the files;
* `alt+c`: run fzf on all the directories;
* `ctrl+r`: search in command history;
* pressing `ctrl-r` again will sort the commands;

# Zsh

## Prompts

* [](https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/)

`PROMPT` (equivalent to `PS1`): defines the prompt on the left?
* `%m`: hostname;
* `%d` ou `%/`: full path to current directory;
* `%d`: path to current directory relative to user's home;
* `%F{blue}text%f`: change the color (possible colors: black, red, green,
	yellow, blue, magenta, cyan and white)
* `%F{n}`: choose the `n`-th color from 256-color pallet;
* `%(?.√.?%?)`: ternary conditional: displays the first part if successful,
	otherwise the second part;
* `%?`: display the exit code;
* `%(!.#.>)`: choose the character on the user privilege;

## Zstyle

This function allows to customize the behavior of Zsh using patterns.

Usage: `zstyle context style value`

* `:completion:func:completer:cmd:arg:tag`: context;
