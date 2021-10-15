# Requires elevation
# By default on some distros not all sysrq keys are enabled.
# You can check it by catting the file, if the answer is not 438/1
# Then you're limited in what you can do through the all mighty sysrq.
# This script will remedy that.
# Read more: https://linuxconfig.org/how-to-enable-all-sysrq-functions-on-linux
echo "1" > /proc/sys/kernel/sysrq
