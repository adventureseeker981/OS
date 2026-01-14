[org 0x7c00]

mov bx, 0
char:
	times 256 db 0 
input:
	mov ah, 0x00
	int 0x16
	mov ah, 0x0e
	cmp al, 13
	je out1
	int 0x10
	mov [char + bx], al
	inc bx
	jmp input

out1:
	mov ah, 0x0e
	mov bx, 0
	jmp loop0
String:
	db 10,13,"Hello, Welcome to my bootloader!",0
loop0:
	mov al, [String+bx]
	int 0x10
	inc bx
	cmp al, 0
	je print_input
	jmp loop0

print_input:
	mov ah, 0x0e
	mov bx, 0
loop1:
	mov al, [char+bx]
	int 0x10
	inc bx
	cmp al, 0
	je String1
	jmp loop1

String1:
	mov ah, 0x0e
	mov bx, 0
	jmp loop2
Stringl:
	
	db "Sir",0
loop2:
	mov al, [Stringl+bx]
	int 0x10
	inc bx
	cmp al, 0
	je end
	jmp loop2

end:
	jmp $
	times 510-($-$$) db 0
	db 0x55, 0xaa