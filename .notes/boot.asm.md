# First Running Program

# Print 'A'

```asm
ORG 0x7c00
BITS 16

start:
    mov ah, 0eh ; load instruction to register
    mov al, 'A' ; load letter 'A' to register
    mov bx, 0 ; page number
    int 0x10 ; calling the BIOS

    jmp $ ; jump to self, so it doest keep running the below

; labelled message that says hello world, with null terminator at the end
message: db 'Hello World!', 0

times 510-($ - $$) db 0 ; pad at least 510 bytes of data with 0
dw 0xAA55 ; written as AA55 but little endian machines write this flipped, so will be 55AA
```

## Hello World

```asm
ORG 0x7c00
BITS 16

start:
    mov si, message ; move addr of lbl message to register
    call print
    jmp $ ; jump to self, so it doest keep running the below

print:
    mov bx, 0 ; set page number
.loop:  ; sublabel
    lodsb ; load char si reg points to, then increment
    cmp al, 0
    je .done ; je, jump equal (if al == 0)
    call print_char
    jmp .loop
.done: ; sublabel
    ret

print_char:
    mov ah, 0eh ; load instruction to register
    int 0x10 ; calling the BIOS
    ret

; labelled message that says hello world, with null terminator at the end
message: db 'Hello World!', 0


times 510-($ - $$) db 0 ; pad at least 510 bytes of data with 0
dw 0xAA55 ; written as AA55 but little endian machines write this flipped, so will be 55AA
```

```asm
```
