# Age of the installation

* `# ls -actl /root`: display the change time of the files in the `/root` directory
* `# tune2fs -l /dev/sdx | grep created`: where `sdx` is the `/` partition, display the date of creation of the partition (only works for `ext2` or `ext4`)

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

* `diff -r A B`: list the files which are only in A or B ainsi que les fichiers qui sont différents;
* `comm -23 file1 file2`: find lines only in file1;
* `comm -13 file1 file2`: find lines only in file2;
* `comm -12 file1 file2`: find lines common to both files.

# pacman

* `pacman -Qqe`: list installed packages;
* `sudo pacman -S --needed $(comm -12 <(pacman -Slq | sort) <(sort packages.txt))`: install packages.

# C++

If a very weird error occurs, check for uninitialized members.

* cppcheck: `cppcheck src --output-file=check.txt --inconclusive --enable=warning --includes-file=include...`
* valgrind: `valgrind --tool=memcheck --leak-check=full --show-leak-kinds=all --verbose --log-file=valgrind.out.log <path_to_binary>`
* clang-tidy: `clang-tidy src/graph.cpp -- -Iinclude `` --std=c++17`
* pck-config: `pkg-config --cflags Qt5Widgets`
* get the most recent core dump for the bar executable: `coredumpctl -o bar.coredump dump path/to/bar`
* get the most recent core dump file: `coredumpctl dump -1 -o bin.coredump`
* see the kernel core configuration: `# cat /proc/sys/kernel/core_pattern`
* set ulimited core file: `ulimit -c unlimited`

# gdb

## Core files

* run gdb using core file: `gdb <path_to_executable> <path_to_core_file>`
* `bt`: display the backtrace before crash

# Users

* `awk -F '{ print $1 }' /etc/passwd`: list all users on the computer
