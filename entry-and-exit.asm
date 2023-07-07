%include 'lib.inc'

section .data
    msg         db "Digite seu nome: ", LF, NULL
    size        equ $- msg

section .bss
    name        resb 1

section .text

global _start

_start:
    MOV         EAX, SYS_WRITE
    MOV         EBX, STD_OUT
    MOV         ECX, msg
    MOV         EDX, size
    INT         SYS_CALL

    MOV         EAX, SYS_READ
    MOV         EBX, STD_IN
    MOV         ECX, name
    MOV         EDX, 10
    INT         SYS_CALL

_exit:
    MOV         EAX, SYS_EXIT
    MOV         EBX, RET_EXIT
    INT         SYS_CALL
