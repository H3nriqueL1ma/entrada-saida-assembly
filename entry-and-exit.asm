%include 'lib.inc'

section .data
    msg         db "Digite seu nome: ", LF, NULL
    size        equ $- msg

section .bss
    name        resb 1

section .text

global _start

_start:
    mov         EAX, SYS_WRITE
    mov         EBX, STD_OUT
    mov         ECX, msg
    mov         EDX, size
    int         SYS_CALL

    mov         EAX, SYS_READ
    mov         EBX, STD_IN
    mov         ECX, name
    mov         EDX, 10
    int         SYS_CALL

_exit:
    mov         EAX, SYS_EXIT
    mov         EBX, RET_EXIT
    int         SYS_CALL
