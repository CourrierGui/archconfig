# Age of the installation

* `l -actl /root`: display the change time of the files in the `/root` directory
* `tune2fs -l /dev/sdx | grep created`: where `sdx` is the `/` partition, display the date of creation of the partition (only works for `ext2` or `ext4`)

# Git

* `git ls-files <directory/filename>`: display the files tracked by git in `directory`
