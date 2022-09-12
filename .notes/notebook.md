# Introduction

## Steps to bootload a system

`BIOS -> Bootloader -> Operating System`

- BIOS is flashed into and executed directly from ROM
- BIOS loads the bootloader in to address `0x7C00`
- Bootloader loads the kernel
- Kernel would load all other parts of the operating system

### What is a bootloader?

Small program responsible for loading the kernel of an operating system. They are tiny programs.

## When a computer boots

- Is in 'real mode' with only 1 megabyte of memory and can only run 16 bit code.
- Bootloader is responsible for putting us in to 'protected mode' which gives access to 4 gigabytes of address space and allows 32 bit code.
- The BIOS uses functions in the BIOS to assist itself.

# The BIOS

- CPU executes instructions directly from the BIOS.
- Generally loads itself in to RAM and continues executing from there.
- Responsible for initialising essential hardware.
- Looks for bootloader by searching all storage mediums for the boot signature `0x55AA`.
    - The 511th and 512th byte should contain the boot signature `0x55AA`.
    - If found, will load that sector in to address `0x7C00`
    - Will then execute the instructions from that address - the bootloader.
- The BIOS is almost like a kernel itself, it contains routines to assist the bootloader in booting the kernel.
- It is only 16 bit code, which means that only 16 bit code can execute it properly.
- BIOS routines are generic and standard.
- Can only be executed when the CPU is in 'real mode'.

# Ralf Brown's interrupt list

- http://ctyme.com/rbrown.htm
- http://ctyme.com/intr/int.htm

```
ORG 0x7c00
BITS 16

start:
    mov ah, 0eh ; load instruction to register
    mov al, 'A' ; load letter 'A' to register
    int 0x10 ; calling the BIOS
```

Instruction `0x10`: http://www.ctyme.com/intr/int-10.htm, specifically `0eh` loaded in to `ah`: http://www.ctyme.com/intr/rb-0106.htm

# OSDev Wiki

https://wiki.osdev.org/
