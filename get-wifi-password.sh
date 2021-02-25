cat /etc/NetworkManager/system-connections/"$(iwgetid -r).nmconnection" \
	| grep psk=    \
	| awk '{ print substr($1,5) }'
