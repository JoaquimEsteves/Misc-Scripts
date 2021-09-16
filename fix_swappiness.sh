# One time fix for when your Desktop's RAM is going fucking bananas
# Requires elevation
# See tutorial: https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04#tweak-your-swap-settings
sysctl vm.swappiness=30
sysctl vm.vfs_cache_pressure=50
