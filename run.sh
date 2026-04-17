rm Build/boot.img
nasm -f bin SRC/GDT.asm -o Build/boot.img
qemu-system-x86_64 Build/boot.img