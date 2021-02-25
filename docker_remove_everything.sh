#!/usr/bin/env bash

set -e

# Does what it says on the tin
# 	This function will forcefully remove __all__ images and containers
# 	I might have lying around in Docker
# 	(This includes volumes)

list_containers="docker ps --all"
list_images="docker images --all"

echo 'REMOVING THE FOLLOWING IMAGES'
echo
echo $($list_containers)
echo
echo $($list_images)
echo

read -ep $'Are you sure? [y]\n' -N 1 -r
echo 

if [[ ! $REPLY =~ ^[Yy]$ ]]
then
	echo 'Ok bye 👋'
	# handle exits from shell or function but don't exit interactive shell
	[[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1 
fi


docker rm --volumes --force $($list_containers --quiet)
docker rmi --force $($list_images --quiet)
docker system prune
