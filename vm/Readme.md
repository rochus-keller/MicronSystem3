This is the emulator of a machine (VM) very similar to the one described by Wirth in his
[Project Oberon Book](http://www.inf.ethz.ch/personal/wirth/ProjectOberon/PO.Computer.pdf);
it is essentially identical with the 
[machine used to implement the RISC-V version of the Project Oberon System](https://github.com/rochus-keller/OberonSystem/tree/op2-rv32/vm),
but extended by a second display device next to Wirth's monochrome screen, 
a linear frame buffer with 1, 2, 3 or 4 bytes per pixel (i.e. capable of displaying colors). 
The additional device is enabled using the `--fb <w>x<h>x<bpp>` option, e.g.

    rv32vm --elf --fb 1024x768x32 Main
    
Without this option, the screen corresponds to Wirth's, unchanged.
The option raises `--ram` by itself if the given RAM cannot hold the frame buffer.

The frame buffer sits directly below Wirth's screen, which stays where it is:

    displayBase = ramWanted - DISPLAY_GAP
    fbBase      = (displayBase - fbLen) rounded down to 4 KB

Five words below `IO_START`, so the Wirth I/O map is untouched:

    IO_FBCTRL = 0xFFFFFFA0   read: 1 if the machine has a linear frame buffer
    IO_FBADR  = 0xFFFFFFA4   its base address
    IO_FBDIM  = 0xFFFFFFA8   width in bits 0..15, height in bits 16..31
    IO_FBFMT  = 0xFFFFFFAC   bytes per pixel in bits 0..7, pitch in bits 8..31
    IO_FBPAL  = 0xFFFFFFB0   write: index in bits 24..31, RGB in bits 0..23

The operating system thus can determine the address of the frame buffer and
the configuration of the display automatically.

