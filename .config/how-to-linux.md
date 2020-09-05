# Age of the installation

* `l -actl /root`: display the change time of the files in the `/root` directory
* `tune2fs -l /dev/sdx | grep created`: where `sdx` is the `/` partition, display the date of creation of the partition (only works for `ext2` or `ext4`)

# Git

* `git ls-files <directory/filename>`: display the files tracked by git in `directory`

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
	* ` -g`: global, every session, window and pane;
	* ` -w`: window specific;
