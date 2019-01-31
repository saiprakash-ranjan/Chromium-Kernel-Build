# Chromium-Kernel-Build
Build script for Chromium OS kernel with initrd on SDM845.

## Getting Started

### Pre-requisites

* Revert the commit a40c0124da7a (CHROMIUM: scripts: Account for clang in the kernel config scripts)
  which forces us to use chroot based build and force clang as a compiler :(
* lz4: Install lz4 using `sudo apt-get install liblz4-tool` or copy lz4 binary from this repo to `/usr/bin`.
* dtc: Install dtc with `sudo apt-get install device-tree-compiler`.
* mkimage: Copy mkimage from this repo to `/usr/bin`.
* vbutil: Copy vbutil binary from this repo to `/usr/bin` or copy vbutil from chromiumos source.
* initrd: Sample initrd is given in this repo, but you can replace default one with your own initrd.
          But it should not be compressed. Decompress the initrd as `gunzip initrd.gz`.

### Build and flash upstream kernel with initrd:

1. `git clone https://github.com/saiprakash-ranjan/Chromium-Kernel-Build.git`
2. Change the kernel source path in `build_upstream.sh`
3. Run the build script as `sh build_upstream.sh`
4. It will build the kernel and copy vmlinuz to configs folder.
5. You can use netboot by just loading this vmlinuz file over tftp or
6. Run vbutil script to flash the kernel onto usb as below:
7. Run `sh update_kernel.sh` to flash kernel onto usb.

### Build and flash chromium kernel with initrd:

Follow same steps as for upstream kernel but use `build_chrome.sh` script instead.
