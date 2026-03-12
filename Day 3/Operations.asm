.model small
.stack 100h

.data
msg1 db "Enter first number (0-9): $"
msg2 db 13,10,"Enter operator (+,-,*,/): $"
msg3 db 13,10,"Enter second number (0-9): $"
msg4 db 13,10,"Result is: $"

n1 db ?
n2 db ?
op db ?

.code
start:
    mov ax,@data
    mov ds,ax

; -------- Input First Number --------
    mov ah,09h
    lea dx,msg1
    int 21h

    mov ah,01h
    int 21h
    sub al,48
    mov n1,al

; -------- Input Operator --------
    mov ah,09h
    lea dx,msg2
    int 21h

    mov ah,01h
    int 21h
    mov op,al

; -------- Input Second Number --------
    mov ah,09h
    lea dx,msg3
    int 21h

    mov ah,01h
    int 21h
    sub al,48
    mov n2,al

; -------- Print Result Message --------
    mov ah,09h
    lea dx,msg4
    int 21h

; -------- Check Operator --------
    mov al,op

    cmp al,'+'
    je ADDITION

    cmp al,'-'
    je SUBTRACTION

    cmp al,'*'
    je MULTIPLICATION

    cmp al,'/'
    je DIVISION

; -------- Addition --------
ADDITION:
    mov al,n1
    add al,n2
    jmp PRINT

; -------- Subtraction --------
SUBTRACTION:
    mov al,n1
    sub al,n2
    jmp PRINT

; -------- Multiplication --------
MULTIPLICATION:
    mov al,n1
    mov bl,n2
    mul bl
    jmp PRINT

; -------- Division --------
DIVISION:
    mov al,n1
    mov ah,0
    mov bl,n2
    div bl
    jmp PRINT

; -------- Print Result --------
PRINT:
    add al,48
    mov dl,al
    mov ah,02h
    int 21h

; -------- Exit --------
    mov ah,4Ch
    int 21h

end start