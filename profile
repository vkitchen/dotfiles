# $OpenBSD: dot.profile,v 1.5 2018/02/02 02:29:54 yasuoka Exp $
# oksh initialization

# Homebrew
export HOMEBREW_PREFIX=/opt/homebrew
export HOMEBREW_CELLAR=/opt/homebrew/Cellar
export HOMEBREW_REPOSITORY=/opt/homebrew
export HOMEBREW_SHELLENV_PREFIX=/opt/homebrew

# NVM (shell functions)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# ENV
PATH=$HOME/bin:$HOME/.rbenv/shims:$HOME/google-cloud-sdk/bin:/usr/local/texlive/2021/bin/universal-darwin:/opt/homebrew/bin:/opt/homebrew/sbin:/bin:/sbin:/usr/bin:/usr/sbin:/usr/X11R6/bin:/usr/local/bin:/usr/local/sbin:/usr/games
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

# Fix for Rails. Remove when version 7 is default
export DISABLE_SPRING=true

# Execute .kshrc
export ENV=$HOME/.kshrc
