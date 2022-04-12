. ~/.ksh_private

alias dir='ls'
alias be='bundle exec'
alias ber='bundle exec rspec'
alias berc='bundle exec rspec $(git ls-files --modified '\''**/*_spec.rb'\'')'
alias devc='bundle exec rails console'
alias prodc='bundle exec rails console --environment=production_au'
