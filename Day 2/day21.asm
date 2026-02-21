.model small
.stack 100h

.data
  n1 db 4
  n2 db 2

.code
start:
  mov ax, @data
  mov ds, ax
  
  ;add
  mov al, n1
  add al, n2
  add al, 48        ; convert to ASCII

  mov dl, al
  mov ah, 02h
  int 21h

  ; print new line
  mov dl, 13
  mov ah, 02h
  int 21h
  mov dl, 10
  mov ah, 02h
  int 21h

  ; sub
  mov al, n1
  sub al, n2
  add al, 48        ; convert to ASCII

  mov dl, al
  mov ah, 02h
  int 21h

  ; print new line
  mov dl, 13
  mov ah, 02h
  int 21h
  mov dl, 10
  mov ah, 02h
  int 21h

  ; multi
  mov al, n1
  mov bl, n2
  mul bl            ;
  ; AX now has result, for single-digit we use AL
  add al, 48        ; convert to ASCII

  mov dl, al
  mov ah, 02h
  int 21h

  ; print new line
  mov dl, 13
  mov ah, 02h
  int 21h
  mov dl, 10
  mov ah, 02h
  int 21h

; divition
  mov al, n1
  cbw               ; extend AL to AX for division
  mov bl, n2
  div bl             
  add al, 48         

  mov dl, al
  mov ah, 02h
  int 21h

  ; print new line
  mov dl, 13
  mov ah, 02h
  int 21h
  mov dl, 10
  mov ah, 02h
  int 21h
  

  ;exit
  mov ah, 4Ch
  int 21h

end start
