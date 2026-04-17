org 0x7c00

mov bx, 0

jmp start

digits: db "123456789", 0

start:
    push ax
    mov ah, 0x0e
    mov al, [digits+bx]
    int 0x10
    inc bx
    cmp al, 0
    je loop_out
    jmp start
    
loop_out:
    push ax
    mov al, 10
    int 0x10
    pop ax
    push ax
    mov al, 13
    int 0x10
    pop ax
    jmp loop
    
loop:
    pop ax
    int 0x10
    cmp al,0
    jne loop

jmp $
times 510-($-$$) db 0
db 0x55, 0xaa
