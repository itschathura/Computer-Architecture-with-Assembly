.model small
.stack 100

.data 
msg1 db "Enter the first number: $"
msg2 db 13,10,"Enter the second number: $"
msg3 db 13,10,"Summation is $"
msg4 db 13,10,"Subtraction is $"

t1 db 0
o1 db 0

t2 db 0
o2 db 0

sum db 0
subb db 0

r1 db 0
r2 db 0

.code
main proc

mov ax,@data
mov ds,ax
    
;---------------- FIRST NUMBER ----------------22
mov dx,offset msg1
mov ah,09h
int 21h
        
mov ah,01h
int 21h
sub al,48
mov t1,al
        
mov ah,01h
int 21h
sub al,48
mov o1,al
        
;---------------- SECOND NUMBER ----------------
mov dx,offset msg2
mov ah,09h
int 21h
        
mov ah,01h
int 21h
sub al,48
mov t2,al
        
mov ah,01h
int 21h
sub al,48
mov o2,al
        
;---------------- SUMMATION ----------------
mov dx,offset msg3
mov ah,09h
int 21h
        
mov bl,10       
        
mov al,t1
mul bl
add al,o1
mov sum,al
        
mov al,t2
mul bl
add al,o2
        
add al,sum  
        
mov ah,00
div bl

mov r1,ah       
        
mov dl,al
add dl,48
mov ah,02h
int 21h
        
mov dl,r1
add dl,48
mov ah,02h
int 21h
        
;---------------- SUBTRACTION ----------------
mov dx,offset msg4
mov ah,09h
int 21h
        
mov bl,10

mov al,t1
mul bl
add al,o1
mov subb,al

mov al,t2
mul bl
add al,o2

mov bl,subb
sub bl,al
mov al,bl

mov ah,00
mov bl,10
div bl

mov r2,ah

mov dl,al
add dl,48
mov ah,02h
int 21h

mov dl,r2
add dl,48
mov ah,02h
int 21h
    
mov ax,4c00h
int 21h

main endp
end main