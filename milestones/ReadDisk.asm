[org 0x7c00]

diskNum: db 

call DiskRead

DiskRead:
    mov ah, 2  ; means which disk head basically c of 7c00 which with 2 will become 7e00
    mov al, 1  ; no. of sectors we want to read [1 sector == 512 bytes]
    
    
