title to display string
.model small
.stack
.data
msg db "Enter any string",'$'
strlen db 22
strn db 00
str db 20 dup('$')

.code
main proc far
mov ax, @data
mov ds, ax

; print string message
lea dx, msg
mov ah, 09h 
int 21h

; take string input in str
mov ah, 0ah
lea dx, strlen
int 21h ; str <-- input


; set video mode
mov ah, 00h
mov al, 03h
int 10h


; display the string in str
mov cl,strn

lea si, str
dis : 
mov al,[si]
inc si
mov bh,00h
mov bl,16h

mov ah, 09h
int 10h
loop dis


; terminate the program
mov ax, 4c00h
int 21h
main endp

end main
