#!/bin/bash
# boosts a video sound by 10x
# $1 is the input video file
# $2 is the output video file
ffmpeg -i "$1" -vol 2560 -vcodec copy "$2" 
# from dwad
# my_command OPTIONS1 "$1" OPTIONS2 "$2" OPTIONS3 "$3"
