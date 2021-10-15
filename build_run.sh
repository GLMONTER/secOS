nasm -f bin -o loader.bin loader.asm

# generate a 1.44MB floppy disk img
dd if=/dev/zero of=myos.img bs=512 count=2880

# write the .bin into the img
dd if=loader.bin of=myos.img seek=0 count=1 conv=notrunc

# execute
qemu-system-x86_64 -fda myos.img
