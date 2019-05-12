# System profiles
include /etc/firejail/disable-common.inc
include /etc/firejail/disable-programs.inc

netfilter

# Excluded from blacklists
#noblacklist /opt/google/chrome

# Rea-only mounts
#read-only /opt/.games
read-only ${HOME}/.local/share/applications/mimeapps.list

# Directly disabled 
blacklist /mnt
blacklist /media
blacklist /aliens

# Exclusively enabled
whitelist /opt/viber
whitelist ~/.ViberPC/
whitelist ${DOWNLOADS}
whitelist ${HOME}/Documents/ViberDownloads
