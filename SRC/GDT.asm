[org 0x7c00]

mov [Boot_disk], dl

CODE_SEG equ code_descriptor - GDT_Start
DATA_SEG equ data_descriptor - GDT_Start

cli

lgdt [GDT_descriptor]
mov eax, cr0        ; last bit of cr0 = 1
or eax, 1
mov cr0, eax
jmp CODE_SEG:start_PM
jmp $

GDT_Start:
    null_descriptor:
        dd 0x0 ; four times 00000000
        dd 0x0 ; four times 00000000
    code_descriptor:
        dw 0xffff
        dw 0x0 ; 16 bit +
        db 0x0 ; 8 bits = 24 bits 
        db 0b10011010
        ;  pre
        ;   priv
        ;    type flags
        db 0b11001111
        db 0x0
    data_descriptor:
        dw 0xffff
        dw 0x0 ; 16 bit +
        db 0x0 ; 8 bits = 24 bits 
        db 0b10010010
        ;    pre
        ;     priv
        ;      type flags
        db 0b11001111
        db 0
        
GDT_end:

GDT_descriptor:
    dw GDT_end-GDT_Start-1
    dd GDT_Start

[bits 32]

start_PM:
    ; Assume EDI is the video memory pointer, ESI is the string pointer
    mov edi, 0xB8500      ; Start of video memory
    mov esi, my_string    ; Source string address
    mov ah, 0x0b          ; White text on black background
    mov ecx, 11            ; Loop 5 times (for "Hello")
    
    print_loop:
        mov al, [esi]     ; Load character from string
        mov [edi], ax     ; Store character + attribute in video memory
        add esi, 1        ; Move to next char in source string
        add edi, 2        ; Move to next screen position (2 bytes per char)
        loop print_loop   ; Decrement ECX and repeat if > 0
    
    my_string db "Radhe Radhe"

    
Boot_disk: db 0
    
times 510-($-$$) db 0
dw 0xAA55

        
        