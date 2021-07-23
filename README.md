This repo contains binary builds of various tools for Switch decompilation projects.

* hactool c2c907430e674614223959f0377f5e71f9e44a4a: https://github.com/SciresM/hactool
* nx2elf 3daf7dfb10ed1dda000c61b8039744e7111321af: https://github.com/leoetlino/nx2elf
    * macOS build currently missing. This will be fixed soon.
* binutils 2.37 (objdump only): https://www.gnu.org/software/binutils/
    * Configure options: `--target=aarch64-none-elf --disable-nls --disable-gprof --disable-gdb --disable-sim --enable-follow-debug-links=no`
