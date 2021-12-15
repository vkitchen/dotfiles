# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
# oksh initialization

alias dir=ls

# Homebrew
export HOMEBREW_PREFIX=/opt/homebrew
export HOMEBREW_CELLAR=/opt/homebrew/Cellar
export HOMEBREW_REPOSITORY=/opt/homebrew
export HOMEBREW_SHELLENV_PREFIX=/opt/homebrew

# NVM (shell functions)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ENV
PATH=$HOME/bin:$HOME/.rbenv/shims:$HOME/google-cloud-sdk/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
MANPATH=/opt/homebrew/share/man:
INFOPATH=/opt/homebrew/share/info:

# Export ENV
export PATH MANPATH INFOPATH HOME TERM

export LC_CTYPE='en_NZ.UTF-8'

# Prompt
PS1='$PWD $ '

export EDITOR=$(whence nvim)
# "normal" line editing mode
set -o emacs

# Execute .kshrc
export ENV=$HOME/.kshrc
