%include 'lib.inc'

section .data
    msg         db "Digite seu nome: ", LF, NULL ; Declaração da mensagem "Digite seu nome: " seguida por uma nova linha (LF) e um caractere nulo (NULL) no final.
    size        equ $- msg                       ; Define a constante 'size' como o tamanho da mensagem "msg".

section .bss
    name        resb 1                           ; Reserva 1 byte de espaço para a variável 'name', que será usada para armazenar o nome digitado pelo usuário.

section .text

global _start

_start: ; Rótulo "_start" indica o início do programa.
    MOV         EAX, SYS_WRITE                   ; Move o número da chamada de sistema para exibir texto (SYS_WRITE) para o registrador EAX.
    MOV         EBX, STD_OUT                     ; Move o número do descritor de arquivo para saída padrão (STD_OUT) para o registrador EBX.
    MOV         ECX, msg                         ; Move o endereço da mensagem "msg" para o registrador ECX (mensagem a ser exibida).
    MOV         EDX, size                        ; Move o tamanho da mensagem "msg" para o registrador EDX (tamanho da mensagem).
    INT         SYS_CALL                         ; Chama o sistema operacional para exibir a mensagem na saída padrão.

    MOV         EAX, SYS_READ                    ; Move o número da chamada de sistema para ler entrada (SYS_READ) para o registrador EAX.
    MOV         EBX, STD_IN                      ; Move o número do descritor de arquivo para entrada padrão (STD_IN) para o registrador EBX.
    MOV         ECX, name                        ; Move o endereço da variável 'name' para o registrador ECX (local para armazenar a entrada).
    MOV         EDX, 10                          ; Move o tamanho máximo de caracteres a serem lidos (10) para o registrador EDX.
    INT         SYS_CALL                         ; Chama o sistema operacional para ler a entrada do usuário e armazená-la na variável 'name'.

_exit: ; Rótulo "_exit" para realizar a chamada de sistema e encerrar o programa.
    MOV         EAX, SYS_EXIT                    ; Move o número da chamada de sistema para encerrar o programa (SYS_EXIT) para o registrador EAX.
    MOV         EBX, RET_EXIT                    ; Move o código de retorno para a chamada de sistema SYS_EXIT (RET_EXIT) para o registrador EBX.
    INT         SYS_CALL                         ; Chama o sistema operacional para encerrar o programa.
