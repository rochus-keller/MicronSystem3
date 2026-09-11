#!/bin/bash

../vm/build/rv32vm --elf --ram 16 --fb 1024x768x32 --disk ./build/disk.img ./build/Main
