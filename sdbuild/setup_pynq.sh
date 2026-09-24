#! /bin/bash

usage() {
  echo "usage: $0 [ZedBoard | ZC706 | ZCU102]"
}

# 1. Read the first argument, default to ZedBoard if empty
BOARD_INPUT=${1:-Zedboard}

# 2. Shift the argument away so PetaLinux / other sourced scripts don't see it
shift $(($# > 0 ? 1 : 0))

source /home/maps/Xilinx/Vivado/2024.1/settings64.sh
source /home/maps/Xilinx/Vitis/2024.1/settings64.sh
source /home/maps/Xilinx/petalinux/settings.sh

PATH="$(cd -P "$(dirname "$(find /home/maps/Xilinx/Vitis -name 'arm-linux-gnueabihf-gcc')")" && pwd)":$PATH
export PATH

THIS_SCRIPT_PATH=$(cd "$(dirname "${BASH_SOURCE[0]:-0}")" &>/dev/null && pwd -P)

# if ZCU102 check bsp is downloaded

if [[ "$BOARD_INPUT" == "ZCU102" ]]; then
  # Expand the glob into an array safely
  bsp_files=("$THIS_SCRIPT_PATH/../boards/ZCU102/"*.bsp)

  # Check if the first element of the array actually exists as a file
  if [[ -f "${bsp_files[0]}" ]]; then
    echo "ZCU102 BSP found: ${bsp_files[0]}"
    # Your code when file exists goes here
  else
    echo "ZCU102 BSP missing! Downloading..."
    echo "Download BSP file from: https://www.xilinx.com/member/forms/download/xef.html?filename=xilinx-zcu102-v2022.1-04191534.bsp"
    # Your download logic goes here (e.g., wget or curl)
  fi
fi

sudo make clean
make BOARDS="$BOARD_INPUT"
