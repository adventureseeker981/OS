rm Build/binaries/*
x86_64-elf-gcc -ffreestanding -m32 -g -c SRC/kernel.c -o Build/kernel.o
nasm SRC/kernel_entry.asm -f elf -o Build/kernel_entry.o
x86_64-elf-ld -m elf_i386 -o Build/binaries/kernel.bin -Ttext 0x1000 Build/kernel_entry.o Build/kernel.o --oformat binary
nasm SRC/boot.asm -f bin -o Build/binaries/boot.bin
cat Build/binaries/boot.bin Build/binaries/kernel.bin > Build/binaries/rawOSfile.bin
cat Build/binaries/rawOSfile.bin Build/zero.bin > Build/binaries/withZeroes.bin
qemu-system-x86_64 -drive format=raw,file="Build/binaries/withZeroes.bin",index=0,if=floppy, -m 128M