compile-bootloader:
	nasm -f bin ./boot.asm -o ./boot.bin

disassemble-bootloader:
	ndisasm ./boot.bin

run-bootloader:
	qemu-system-x86_64 -hda ./boot.bin
