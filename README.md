# chrome-build
Build script for Chromium OS on SDM845

## Getting Started

### Pre-requisites

* lz4: Install lz4 using `sudo apt-get install liblz4-tool` or copy lz4 binary from this repo to `/usr/bin`.
* dtc: Install dtc with `sudo apt-get install device-tree-compiler`.
* mkimage: Copy mkimage from this repo to `/usr/bin`.
* vbutil: Copy vbutil binary from this repo to `/usr/bin` or copy vbutil from chromiumos source.
* initrd: Sample initrd is given in this repo, but you can replace default one with your own initrd.
          But it should not be compressed. Decompress the initrd as `gunzip initrd.gz`.

### Build and flash upstream kernel with initrd:

1. `git clone https://github.com/saiprakash-ranjan/chrome-build.git`
2. Change the kernel source path in `build_upstream.sh`
3. Run the build script as `sh build_upstream.sh`
4. It will build the kernel and copy vmlinuz to configs folder.
5. Then run vbutil script to flash the kernel to usb as below:
6. Run `sh update_kernel.sh` to flash kernel onto usb.

### Build and flash chrome kernel with initrd:

Follow same steps as for upstream kernel but use `build_chrome.sh` script instead.
