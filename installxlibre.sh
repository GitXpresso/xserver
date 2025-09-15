#!/bin/bash
if [ -d /etc/apt ]; then
packages=("git" "meson" "x11proto-dev" "xtrans-dev" "libpixman-1-dev" "libxkbcommon-x11-dev" "libxfont-dev" "libxcvt-dev" "libdrm-dev" "libepoxy-dev" "x11proto-present-dev" "x11proto-dev" "libxkbfile-dev" "libudev-dev" "libxshmfence-dev" "libbsd-dev" "x11proto-xf86dri-dev" "libgl1-mesa-dev" "libglu1-mesa-dev" "libglu1-mesa-dev" "libgl-dev" "libdrm-dev" "xutils-dev" "mesa-common-dev" "libxcb-shape0-dev" "libxcb-util-dev" "libxcb-icccm4-dev")
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
sleep 0.2
clear
echo "checking if repository is already cloned..."
if [ -f $(pwd)/xserver ]; then
  echo "Repository already cloned, Compiling from Source..."
  sleep 0.2 && clear
  echo "outputing meson options..."
  #curl -fsSL https://github.com/X11Libre/xserver/blob/master/meson_options.txt # I do not fully understand this yet :/
  #meson setup <prefix> build --buildtype debugoptimized <meson_options> # I do not fully understand enough to make this an automatic script only.
  sudo ninja -C build install
else
  echo "Repository not found, cloning repository..."
  git clone https://github.com/gitxpresso/xserver $(pwd)
  sleep 0.2
  clear
  echo "Compiling from Source..."
  sleep 0.2 && clear
  echo "outputing meson options..."
  #curl -fsSL https://github.com/X11Libre/xserver/blob/master/meson_options.txt # I do not fully understand this yet :/
  meson setup --prefix="$(pwd)/test" build --buildtype debugoptimized xorg # I do not fully understand enough to make this an automatic script only.
  sudo ninja -C build install
fi
  
