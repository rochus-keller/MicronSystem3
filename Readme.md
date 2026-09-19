A variant of the [Oberon System 3](https://github.com/rochus-keller/oberonsystem3native/) is being developed here,
migrated to the [Micron programming language](https://github.com/rochus-keller/micron/),
and running natively on RISC-V (and later also x86 and ARMv7).

It is a consequence of the successful migration of the [Project Oberon System to Micron](https://github.com/rochus-keller/OberonSystem/tree/micron-rv32)
and uses the same virtual machine (extended by a color frame buffer).

This is work in progress. Check back later.


### Status on Sept. 11, 2026

RV32 inner core works; the (empty) drive is found and mounted. The console shows:

```
./build/Main: entry 00055FB0, data 00058000, heap origin 0006F1E0, memory limit 00CE6FF0
SDDisks: no Aos partition, using the whole card
SDDisks: SD0 registered
OFSDiskVolumes: SD0#0
OFSAosFiles: Scanning SD0#0... marking     0 files
Micron Oberon System 3
```

Common modules were transpiled from Oberon 90 with [o2m](https://github.com/rochus-keller/activeoberon/) and manually fixed/improved.
Kernel and SDDisk assume the same machine as the [Micron System](https://github.com/rochus-keller/OberonSystem/tree/micron-rv32).

### Status on Sept. 19, 2026

RV32 outer core works; display uses the new top-down linear frame buffer which the rv32vm installs with the `--fb <w>x<h>x<bpp>` option.
The console shows the following output when the rootfs files from the oberonsystem3native repository are used: 

```
./build/Main: entry 0009C504, data 000A2000, heap origin 000BBC00, memory limit 00CE6FF0
SDDisks: no Aos partition, using the whole card
SDDisks: SD0 registered
OFSDiskVolumes: SD0#0
OFSAosFiles: Scanning SD0#0... marking...   417 files
DisplayLinear: 1024x768x32 at   CE7000
Micron Oberon System 3
```

Here is the screen output:

![Micron System 3 Screenshot](http://software.rochus-keller.ch/micronsystem3_outer.png)
