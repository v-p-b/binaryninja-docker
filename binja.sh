#!/bin/bash

check_container=`docker image ls | grep '^binja\s' | wc -l`

if [ $check_container -eq 0 ];then
    docker build -t binja .
fi

if [ "$#" -lt 1 ]; then
    echo "Usage: ./binja.sh /path/to/binaryninja [...other docker options...]"
    exit 1
fi

binja_path=`realpath "$1"`

docker run --rm -it --env QT_DEBUG_PLUGINS=1 --env DISPLAY=$DISPLAY --volume /tmp/.X11-unix:/tmp/.X11-unix --volume "$binja_path":/binaryninja --volume $(realpath ./home):/home/binja ${@:2} binja
