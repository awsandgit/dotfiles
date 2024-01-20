#!/usr/bin/env sh

set -x

/usr/bin/rsync "$HOME"/.bashrc "$HOME"/.vimrc "$HOME"/.ssh/config "$HOME"/.config/doom/ "$HOME"/development/dotfiles/

cd "$HOME"/development/dotfiles/ || exit

/usr/bin/git add .
/usr/bin/git commit -m "Daily backup $(date)."
/usr/bin/git push origin master


echo "backed up at $(date)" >> "$HOME"/Desktop/backup.log
