export LC_CTYPE='en_NZ.UTF-8'

# Prompt
PS1='\n$PWD\n$ '

## ENVy things

# Homebrew
export HOMEBREW_PREFIX=/opt/homebrew
export HOMEBREW_CELLAR=/opt/homebrew/Cellar
export HOMEBREW_REPOSITORY=/opt/homebrew
export HOMEBREW_SHELLENV_PREFIX=/opt/homebrew

# ENV
PATH="$HOME/bin\
:$HOME/.rbenv/shims\
:$HOME/google-cloud-sdk/bin\
:/usr/local/texlive/2021/bin/universal-darwin\
:/opt/homebrew/bin\
:/opt/homebrew/sbin\
:/bin\
:/sbin\
:/usr/bin\
:/usr/sbin\
:/usr/X11R6/bin\
:/usr/local/bin\
:/usr/local/sbin\
:/usr/games\
"
MANPATH=/opt/homebrew/share/man:
INFOPATH=/opt/homebrew/share/info:

# Export ENV
export PATH MANPATH INFOPATH HOME TERM

export EDITOR=$(whence nvim)

# "normal" line editing. Vi mode auto enabled when $EDITOR ~= vi
set -o emacs

# Private ENV
[ -f ~/.ksh_private ] && . ~/.ksh_private

## Helpery things

# NVM (shell functions)
export NVM_DIR=$HOME/.nvm
[ -s $NVM_DIR/nvm.sh ] && . $NVM_DIR/nvm.sh

node() {
	if ! whence -p node; then
		nvm use node
	fi
	$(whence -p node) "$@"
}

npm() {
	if ! whence -p npm; then
		nvm use node
	fi
	$(whence -p npm) "$@"
}

npx() {
	if ! whence -p npx; then
		nvm use node
	fi
	$(whence -p npx) "$@"
}

alias dir='ls'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias berm='bundle exec rspec $(git ls-files --modified '\''**/*_spec.rb'\'')'
alias devc='bundle exec rails console'
alias prodc='bundle exec rails console --environment=production_au'
alias deploy='bundle exec mina deploy_prod'
