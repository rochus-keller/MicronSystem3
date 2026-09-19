#!/bin/bash

set -e

rm -rf ./build
mkdir -p ./build

../bin/micc --target rv32 --abi default -g --base 0 --runtime ../mic/MIC+.mil -o ./build/Main --out-dir ./build ../rv32outer.micpro 

../bin/aosfstool new ./build/disk.img 63
qemu-img resize ./build/disk.img 64M

for FILE in ../rootfs/*; do
    if [ -f "$FILE" ]; then
        ../bin/aosfstool add ./build/disk.img "$FILE"
    fi
done
