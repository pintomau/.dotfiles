is_ubuntu || return 1

# Remove old kernel
alias rok='sudo apt-get purge $( dpkg --list | grep -P -o "linux-image-\d\S+" | grep -v $(uname -r | grep -P -o ".+\d") )'
alias ubuntu_release='lsb_release -s -c'
