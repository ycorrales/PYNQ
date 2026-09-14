# Copyright (C) 2022 Xilinx, Inc
# SPDX-License-Identifier: BSD-3-Clause

ARCH_Zedboard := arm
BSP_Zedboard :=
BITSTREAM_Zedboard := base/Zedboard.bit
FPGA_MANAGER_Zedboard := 1

STAGE4_PACKAGES_Zedboard := xrt pynq base ethernet pynq_peripherals sdcardshrink precached_metadata
