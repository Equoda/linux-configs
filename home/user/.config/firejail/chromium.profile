# System profiles
include /etc/firejail/chromium.profile

# Excluded from blacklists
#noblacklist /opt/google/chrome

# Rea-only mounts
#read-only /opt/.games

# Directly disabled
blacklist /mnt
blacklist /media
blacklist /aliens

# Exclusively enabled
whitelist /opt/.games/.swf
