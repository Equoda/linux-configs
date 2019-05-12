# System profiles
include /etc/firejail/google-chrome.profile

# Excluded from blacklists
#noblacklist /opt/google/chrome

# Rea-only mounts
#read-only /opt/.games

# Directly disabled
blacklist /mnt
blacklist /media
blacklist /aliens

# Exclusively enabled
whitelist /opt/google/chrome
whitelist /opt/.games/.swf
