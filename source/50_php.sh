# PHPSpec Command

alias phpspec='vendor/bin/phpspec'



# PHPSpec Shortcuts

alias spec='vendor/bin/phpspec'
alias specr='vendor/bin/phpspec run'
alias specd='vendor/bin/phpspec describe'



# Laravel

alias artisan='php artisan'



# Homestead path

export PATH="$PATH:$HOME/.composer/vendor/bin"


# Xdebug export for PHPStorm
alias xdebug='export XDEBUG_CONFIG="remote_enable=1 remote_mode=req remote_port=9000 remote_host=127.0.0.1 remote_connect_back=0"'

[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
