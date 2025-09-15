#!/bin/bash
if [ -d /etc/apt ]; then
packages=("x11proto-dev" "xtrans-dev" "libpixman-1-dev" "libxkbcommon-x11-dev" "libxfont-dev" "libxcvt-dev" "libdrm-dev" "libepoxy-dev" "x11proto-present-dev" "x11proto-dev" "libxkbfile-dev" "libudev-dev" "libxshmfence-dev" "libbsd-dev" "x11proto-xf86dri-dev" "libgl1-mesa-dev" "libglu1-mesa-dev" "libglu1-mesa-dev" "libgl-dev" "libdrm-dev" "xutils-dev" "mesa-common-dev" "libxcb-shape0-dev" "libxcb-util-dev" "libxcb-icccm4-dev")
 for package in "${packages[@]}"; do

 dpkg -l | grep -qw "${package}"
   if [ ! "$?" -ne 0 ]; then
     echo "${package} already installed"
     sleep 0.2
     clear
   else
     echo "${package} is not installed, installing ${package}"
     sudo apt install -y ${package}
     sleep 0.2
     clear
   fi
  done
fi
echo "Done installing required packages..."
