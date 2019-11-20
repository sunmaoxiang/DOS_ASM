assume cs:code, ss:stack, ds:data

stack segment
	dw 0,0,0,0,0,0,0,0
stack ends

data segment
	db '1. display      '
	db '2. brows        '
	db '3. replace      '
	db '4. modify       '
data ends

code segment
	start:	
		; 00100000

		mov ax, data
		mov ds, ax

		mov ax, stack
		mov ss, ax
		mov sp, 16

		mov cx, 4
		mov bx, 0
		
		s:
			push cx
			mov cx, 4
			mov si, 3

			s0:
				mov al, [bx + si]
				and al, 11011111B
				mov [bx + si], al
				inc si
			loop s0

			pop cx
			add bx, 16
		loop s

		mov ax, 4c00h
		int 21h
code ends

end start
