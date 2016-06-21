is_ubuntu || return 1

# Virtual environments home
export WORKON_HOME=~/.virtualenvs

# Run Virtualenvwrapper script
if [ -f "$HOME/.local/bin/virtualenvwrapper.sh" ]
then
    source "$HOME/.local/bin/virtualenvwrapper.sh"
fi

# Add packages path
export PATH="$PATH:$HOME/.local/lib/python2.7/site-packages"
