# kdswapd using all of your CPU to swap virtual RAM?
# Tell it to bugger off
# https://serverfault.com/a/696185
# Requires elevation
echo "SETTING DROP_CACHES TO 1"
echo 1 > /proc/sys/vm/drop_caches
