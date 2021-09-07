# kdswapd using all of your CPU to swap virtual RAM?
# Tell it to bugger off
# https://serverfault.com/a/696185
# Requires elevation
echo 1 > /proc/sys/vm/drop_caches
