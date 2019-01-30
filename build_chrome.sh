#!/bin/sh

KERNEL= linux-kernel # Specify your kernel source path
if [ ! -d "$KERNEL" ]; then
  echo "Specify the kernel src path"
  exit 1
fi

OUTPUT_DIR=${KERNEL}/../output # Specify the output path to store vmlinuz
if [ ! -d "$OUTPUT_DIR" ]; then
  mkdir -p "$OUTPUT_DIR"
fi

ITS_SCRIPT="${KERNEL}/its_script"
KERNEL_BIN="${OUTPUT_DIR}/vmlinuz"
IMAGE="${KERNEL}/arch/arm64/boot/Image"

cp "${PWD}/its_script" ${KERNEL}
cp "${PWD}/initrd-chrome.img" ${KERNEL}

compress_kernel() {
    local image_name=$1

    lz4 -20 -z -f "${image_name}" \
        "${image_name}.lz4" || exit 1
    echo "${image_name}.lz4"
}

cd $KERNEL
export ARCH=arm64
export CROSS_COMPILE=aarch64-linux-gnu-
make olddefconfig
./chromeos/scripts/prepareconfig chromiumos-qualcomm
./chromeos/scripts/kernelconfig olddefconfig
make Image.gz -j16
make dtbs -j16

compress_kernel "${IMAGE}"

mkimage -D "-I dts -O dtb -p 2048" -f "${ITS_SCRIPT}" "${KERNEL_BIN}" || exit 1

cp ${KERNEL_BIN} "${OLDPWD}/configs"

rm -rf "${KERNEL}/initrd-chrome.img"
rm -rf "${KERNEL}/its_script"

exit 0
