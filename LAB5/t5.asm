;db：byte  只能存储单字节
;dw: word  双字节

assume cs:code

a segment
	db 1,2,3,4,5,6,7,8
a ends

b segment
	db 1,2,3,4,5,6,7,8
b ends

c segment
	db 0,0,0,0,0,0,0,0
c ends


code segment

start:	mov ax, a
		mov es, ax
		mov ax, c
		mov ds, ax
		mov cx, 8
		mov bx, 0
		s0:	mov ax, es:[bx]
			mov ds:[bx], al
			inc bx
			loop s0
		
		mov bx, b
		mov es, bx
		mov cx, 8
		mov bx, 0
		
		s1: mov ax, es:[bx]
			add [bx], al
			inc bx
			loop s1

		mov ax, 4c00h
		int 21h
code ends

end start