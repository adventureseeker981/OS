; NR = x8
; return = x0
; arg0 = x0
; arg1 = x1
; arg2 = x2
; arg3 = x3
; arg4 = x4
; arg5 = x5


.global _main

_main:
    mov x16, 4
    mov x0, 1
    adr x1, HelloWorld
    mov x2, 12
    svc 0

    mov x16, 1
    mov x0, 0
    svc 0


HelloWorld: .ascii "Radhe Radhe\n"
