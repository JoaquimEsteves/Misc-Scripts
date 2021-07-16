#!/bin/bash

ffmpeg -i $1 -codec:v libtheora -qscale:v 7 -codec:a libvorbis -qscale:a 5 output.ogg
