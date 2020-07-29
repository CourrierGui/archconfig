Laptop configuration files

# Setting up

## Initialisation

```
# Create a bare git repository in ~/.cfg folder:
git init --bare $HOME/.cfg
# Create an alias config:
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
# Hide untracked file:
config config --local status.showUntrackedFiles no
```

## Restore configuration

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
git clone --bare git@github.com:CourrierGui/archconfig.git $HOME/.cfg
config checkout -f
config config --local status.showUntrackedFiles no
```
