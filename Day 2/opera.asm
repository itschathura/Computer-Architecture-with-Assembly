.model small
.stack 100h

.data
n1 db 4
n2 db 2

msg1 db "Addition n1$ is : $"
msg2 db 13,10,"Subtraction is : $"
msg3 db 13,10,"Multiplication is : $"
msg4 db 13,10,"Division is : $"

.code
start:
    mov ax, @data
    mov ds, ax

; -------- Addition --------
    mov ah, 09h
    lea dx, msg1
    int 21h

    mov al, n1
    add al, n2
    add al, 48
    mov dl, al
    mov ah, 02h
    int 21h

; -------- Subtraction --------
    mov ah, 09h
    lea dx, msg2
    int 21h

    mov al, n1
    sub al, n2
    add al, 48
    mov dl, al
    mov ah, 02h
    int 21h

; -------- Multiplication --------
    mov ah, 09h
    lea dx, msg3
    int 21h

    mov al, n1
    mov bl, n2
    mul bl
    add al, 48
    mov dl, al
    mov ah, 02h
    int 21h

; -------- Division --------
    mov ah, 09h
    lea dx, msg4
    int 21h

    mov al, n1
    cbw
    mov bl, n2
    div bl
    add al, 48
    mov dl, al
    mov ah, 02h
    int 21h

; Exit
    mov ah, 4Ch
    int 21h

end start