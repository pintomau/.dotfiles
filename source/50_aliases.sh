# Always enable colored `grep` output and case insensitive search
alias grep="grep --color=auto -i"
alias fgrep="fgrep --color=auto -i"
alias egrep="egrep --color=auto -i"

# Networking
alias portopen="nc -vz" # portopen google.com 443
##  IP addresses
alias wanip="dig +short myip.opendns.com @resolver1.opendns.com"
alias whois="whois -h whois-servers.net"
##  Flush Directory Service cache
alias flush="dscacheutil -flushcache"
## View HTTP traffic
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""
