#!/usr/bin/env sh

/usr/bin/rsync $HOME/.bashrc $HOME/.vimrc $HOME/.ssh/config $HOME/development/dotfiles/

echo "backed up at $(date)" >>$HOME/Desktop/backup.log
