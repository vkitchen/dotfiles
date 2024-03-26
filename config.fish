set -U fish_greeting

set -x JAVA_HOME /usr/lib/jvm/default-jdk

set -x MANPATH $MANPATH /usr/lib/jvm/default-jdk/man

fish_add_path ~/bin
fish_add_path /usr/lib/jvm/default-jdk/bin

if status is-interactive
    # Commands to run in interactive sessions can go here
end

mise activate fish | source
