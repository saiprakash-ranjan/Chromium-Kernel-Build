#!/bin/sh

SD_CARD=/dev/sdb2
vbutil_kernel --pack /tmp/new_kern.bin \
    --keyblock configs/kernel.keyblock \
    --signprivate configs/kernel_data_key.vbprivk \
    --version 1 \
    --config configs/config.txt \
    --bootloader configs/bootloader.bin \
    --vmlinuz "configs/vmlinuz" \
    --arch "arm" \
&& \
sudo dd if=/tmp/new_kern.bin conv=nocreat of=${SD_CARD}
