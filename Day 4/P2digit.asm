    .model small
.stack 100h

.data
msg1 db "Enter the number: $"
t db 0
o db 0
dig db 0
r db 0

.code
main proc

    mov ax,@data
    mov ds,ax

    ;print message
    mov dx,offset msg1
    mov ah,09h
    int 21h
        
    ;read first digit
    mov ah,01h
    int 21h
    sub al,48
    mov t,al
        
    ;read second digit
    mov ah,01h
    int 21h
    sub al,48
    mov o,al
        
    ;new line
    mov dl,13
    mov ah,02h
    int 21h

    mov dl,10
    mov ah,02h
    int 21h
        
    ;convert digits to number
    mov bl,10
        
    mov al,t
    mul bl
    add al,o
        
    mov dig,al
        
    ;split digits again
    mov al,dig
    mov ah,00
    div bl
        
    mov r,ah
        
    ;print tens
    mov dl,al
    add dl,48
    mov ah,02h
    int 21h
        
    ;print ones
    mov dl,r
    add dl,48
    mov ah,02h
    int 21h
        
    mov ax,4c00h
    int 21h

main endp
end main