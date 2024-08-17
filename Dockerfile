# Based on:
# https://www.baeldung.com/linux/docker-container-gui-applications

FROM    ubuntu 
# Update packages in the earliest layer
RUN     apt-get update 

# Dependencies
RUN     apt-get install -y x11-apps sudo libdbus-1-3 libegl1 libxkbcommon0 libglx0 libopengl0 libxcb-icccm4 libxcb-cursor0 libxcb-keysyms1 libxcb-shape0 libxcb-xkb1 libxkbcommon-x11-0 xterm

# Environment
USER    ubuntu
ENV     HOME /binaryninja

# Start - we use xterm so Binary Ninja can be restarted to finish upgrades
ENTRYPOINT     ["xterm","-e","/binaryninja/binaryninja"]
