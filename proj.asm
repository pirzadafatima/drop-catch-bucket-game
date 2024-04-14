;--------------------------------------------------------------Group Members: Tania Waseem (21L-5480) and Fatima Pirzada (21L-5487)
[org 0x0100]

jmp main
message: db 'Please press "ENTER" to Start!', 0

line1: dw 10,5,6,6,2,6,6,3,6,5,8,5,6,2,6,4,10,1,14
line2: dw 0,1,2,3,2,5,2,6,2,1,2,6,2,5,2,5,2,4,2,5,2,4,2,6,2,3,14
line3: dw 0,1,2,3,2,5,2,5,2,3,2,5,4,3,4,5,2,4,2,5,4,3,2,6,2,3,14
line4: dw 0,1,2,3,2,5,2,5,2,3,2,5,2,1,2,1,2,1,2,5,2,4,2,5,2,1,2,2,2,6,2,3,14
line5: dw 0,1,2,3,2,5,2,5,2,3,2,5,2,2,2,2,2,5,2,4,2,5,2,2,2,1,2,6,2,3,14
line6: dw 0,1,2,3,2,5,2,5,10,5,2,2,2,2,2,5,2,4,2,5,2,3,4,6,2,3,14
line7: dw 0,1,2,3,2,5,2,5,2,3,2,5,2,5,2,5,2,4,2,5,2,4,2,6,2,3,14
line8: dw 10,5,6,4,2,3,2,4,6,3,6,5,8,5,6,2,6,4,10,1,14

lineD1: dw 10,5,10,7,8,5,10,5,14
lineD2: dw 0,1,2,3,2,5,2,3,2,5,2,4,2,5,2,3,2,4,14
lineD3: dw 0,1,2,3,2,5,2,3,2,5,2,4,2,5,2,3,2,4,14
lineD4: dw 0,1,2,3,2,5,8,6,2,4,2,5,2,3,2,4,14
lineD5: dw 0,1,2,3,2,5,2,1,2,7,2,4,2,5,8,5,14
lineD6: dw 0,1,2,3,2,5,2,2,2,6,2,4,2,5,2,8,14
lineD7: dw 0,1,2,3,2,5,2,3,2,5,2,4,2,5,2,9,14
lineD8: dw 10,5,6,2,4,5,8,5,6,7,14

lb1: dw 0, 1, 8, 5, 4, 4, 6,3, 6, 1, 12, 3, 8, 2, 6, 3, 6, 1, 12, 1, 10, 2, 14
lb2: dw 2, 4, 2, 3, 2, 2, 2, 4, 2, 5, 2, 3, 2, 3, 2, 2, 2, 4, 2, 2, 2, 5, 2, 3, 2, 3, 2, 2, 2, 3, 2, 1, 14
lb3: dw 2, 7, 2, 4, 2, 3, 4, 3, 4, 3, 2, 6, 2, 4, 2, 2, 2, 5, 2, 3, 2, 6, 2, 3, 2, 1, 14
lb4: dw 2, 7, 12, 3, 2, 1, 2, 1, 2, 1, 2, 3, 8, 3, 2, 4, 2, 3, 2, 3, 2, 4, 8, 3, 8, 2, 14
lb5: dw 2, 3, 4, 2, 2, 4, 2, 3, 2, 2, 2, 2, 2, 3, 2, 6, 2, 4, 2, 3, 2, 3, 2, 4, 2, 6, 2, 1, 2, 3, 14
lb6: dw 2, 4, 2, 2, 2, 4, 2, 3, 2, 2, 2, 2, 2,3, 2, 6, 2, 4, 2, 4, 2, 1, 2, 5, 2, 6, 2, 2, 2, 2, 14
lb7: dw 2, 4, 2, 2, 2, 4, 2, 3, 2, 5, 2, 3, 2, 3, 2, 2, 2, 4, 2, 4, 2, 1, 2, 5, 2, 3, 2, 2, 2, 3, 2, 1, 14
lb8: dw 0, 1, 8, 2, 6, 2, 6, 1, 6, 3, 6, 1, 12, 3, 8, 6, 2, 5, 12, 1, 6, 2, 14

finalScore:     db 'YOUR SCORE: ', 0
liveScore:      db 'LIVE SCORE: ', 0
time:           db 'TIME:    s', 0
b1:             dw 10, 14, 0, 1, 6, 1, 14, 0, 2, 2, 2, 14
g1:             dw 10, 14, 2, 1, 2, 1, 2, 14, 10, 14

tickcount:      dw 0
seconds:        dw 0
minutes:        dw 0
flag:           dw 0
flag1:          dw 0

initialLoc:     dw 3112
oldisr:         dd 0 	

prev:           dw 0
purpPos:        dw 0
bluePos:        dw 0
greenPos:       dw 0
score:          dw 0
gameEnd:        dw 0
random:         dw 0
bPos:           dw 0
temp:           dw 0
dtemp:          dw 0
btemp2:         dw 0
btemp1:         dw 0
dtemp2:         dw 0
dtemp1:         dw 0
ghostCollide:   dw 0
diamondCollide: dw 0
;------------------------------------------------------------------------------------------------------------Start Screen BackGround-----------------------------------------------------------------------------------------------------------------------

clrscr:		
            push es
		    push ax
		    push cx
		    push di

		    mov ax, 0xb800
		    mov es, ax
		    xor di, di
		    mov ax, 0x8020
		    mov cx, 2000

		    cld
		    rep stosw

		    pop di
		    pop cx
		    pop ax
		    pop es

		    ret

delay:		
            push cx
		    push dx
		    push bx

		    mov cx, 5
loop1: 		
            mov dx, 10
loop2: 		
            mov bx, 0x0D00
loop3: 		
            dec bx
		    jnz loop3
		    dec dx
		    jnz loop2
		    dec cx
		    jnz loop1

		    pop bx
		    pop dx
		    pop cx

		    ret

;-------------------------------------------------------------------------------------------------------Printing DIAMOND DROP on Start Screen---------------------------------------------------------------------------------------------------------------

 
StartScreen:

;DIAMOND Printing
		    push es
		    push ax
		    push cx
		    push di
		    push bx
		    push si
		    push dx

		    mov bx, 8
		    mov di, 172

DIAMOND:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0xE020
		    mov cx, 67

		    cld
		    rep stosw

		    add di, 160
		    sub di, 134
		    dec bx
		    jnz DIAMOND

;DROP
		    mov bx, 8
		    mov di, 1800

DROP:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0xE020
		    mov cx, 42

		    cld
		    rep stosw

		    add di, 160
		    sub di, 84
		    dec bx
		    jnz DROP

		    pop dx
		    pop si
		    pop bx
		    pop di
		    pop cx
		    pop ax
		    pop es
		    
            ret

;----------------------------------------------------------------------------------------------------Printing DIAMOND------------------------------------------------------------------------------------------------------------------------------

BLACKScreens:	
            push es
		    push ax
		    push cx
		    push di
		    push si
		    push dx

		    mov di, 172
		    mov si, 0
;line1
B1:		
            add di,[line1 + si]
		    add si,2

Bline1:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [line1 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[line1 + si]
		    cmp dx, 14
		    jne B1

;going to next line
		    mov di, 332
		    mov si, 0

;line2
B2:		
            add di,[line2 + si]
		    add si,2

Bline2:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [line2 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[line2 + si]
		    cmp dx, 14
		    jne B2


;going to next line
		    mov di, 492
		    mov si, 0

;line3
B3:		
            add di,[line3 + si]
		    add si,2

Bline3:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [line3 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[line3 + si]
		    cmp dx, 14
		    jne B3

;going to next line
		    mov di, 652
		    mov si, 0

;line4
B4:		
            add di,[line4 + si]
		    add si,2

Bline4:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [line4 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[line4 + si]
		    cmp dx, 14
		    jne B4

;going to next line
		    mov di, 812
		    mov si, 0

;line5
B5:		
            add di,[line5 + si]
		    add si,2

Bline5:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [line5 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[line5 + si]
		    cmp dx, 14
		    jne B5

;going to next line
		    mov di, 972
		    mov si, 0

;line6
B6:		
            add di,[line6 + si]
		    add si,2

Bline6:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [line6 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[line6 + si]
		    cmp dx, 14
		    jne B6


;going to next line
		    mov di, 1132
		    mov si, 0

;line7
B7:		
            add di,[line7 + si]
		    add si,2

Bline7:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [line7 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[line7 + si]
		    cmp dx, 14
		    jne B7

;going to next line
		    mov di, 1292
		    mov si, 0

;line8
B8:		
            add di,[line8 + si]
		    add si,2

Bline8:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [line8 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[line8 + si]
		    cmp dx, 14
		    jne B8

;-------------------------------------------------------------------------------------------------------------------Printing DROP---------------------------------------------------------------------------------------------------------------------------------------------------------
		    mov di, 1800
		    mov si, 0
;line1
BD1:		
            add di,[lineD1 + si]
		    add si,2

BDline1:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [lineD1 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lineD1 + si]
		    cmp dx, 14
		    jne BD1

;going to next line
		    mov di, 1960
		    mov si, 0

;line2
BD2:		
            add di,[lineD2 + si]
		    add si,2

BDline2:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [lineD2 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lineD2 + si]
		    cmp dx, 14
		    jne BD2


;going to next line
		    mov di, 2120
		    mov si, 0

;line3
BD3:		
            add di,[lineD3 + si]
		    add si,2

BDline3:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [lineD3 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lineD3 + si]
		    cmp dx, 14
		    jne BD3

;going to next line
		    mov di, 2280
		    mov si, 0

;line4
BD4:		
            add di,[lineD4 + si]
		    add si,2

BDline4:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [lineD4 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lineD4 + si]
		    cmp dx, 14
		    jne BD4

;going to next line
		    mov di, 2440
		    mov si, 0

;line5
BD5:		
            add di,[lineD5 + si]
		    add si,2

BDline5:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [lineD5 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lineD5 + si]
		    cmp dx, 14
		    jne BD5

;going to next line
		    mov di, 2600
		    mov si, 0

;line6
BD6:		
            add di,[lineD6 + si]
		    add si,2

BDline6:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [lineD6 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lineD6 + si]
		    cmp dx, 14
		    jne BD6


;going to next line
		    mov di, 2760
		    mov si, 0

;line7
BD7:		
            add di,[lineD7 + si]
		    add si,2

BDline7:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [lineD7 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lineD7 + si]
		    cmp dx, 14
		    jne BD7

;going to next line
		    mov di, 2920
		    mov si, 0

;line8
BD8:		
            add di,[lineD8 + si]
		    add si,2

BDline8:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x0820
		    xor cx, cx
		    mov cx, [lineD8 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lineD8 + si]
		    cmp dx, 14
		    jne BD8


		    pop dx
		    pop si
		    pop di
		    pop cx
		    pop ax
		    pop es

		    ret
;-----------------------------------------------------------------------------------------------END SCREEN---------------------------------------------------------------------------------------------------------------------------------------
EndScreen:	
            push es
		    push ax
		    push cx
		    push di
		    push bx

		    mov bx, 21 
		    mov di, 328

;printing grey popup box on black screen
popUp:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x7720
		    mov cx, 72

		    cld
		    rep stosw

		    add di, 160
		    sub di, 144
		    dec bx
		    jnz popUp

;printing box for letters 
		    mov bx, 8
		    mov di, 816

letters:	
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x4420
		    mov cx, 65

		    cld
		    rep stosw

		    add di, 160
		    sub di, 130
		    dec bx
		    jnz letters


		    pop bx
		    pop di
		    pop cx
		    pop ax
		    pop es

		    ret

printGameOver:	
            push es
		    push ax
		    push cx
		    push di
		    push bx
		    push si
		    push dx

		    mov di, 816
		    mov si, 0

;line1
P1:		
            add di,[lb1 + si]
		    add si,2

Pline1:		
            mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x7720
		    xor cx, cx
		    mov cx, [lb1 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lb1 + si]
		    cmp dx, 14
		    jne P1

;moving onto next line
		    mov di, 976
		    mov si, 0

;line2
P2:
		    add di,[lb2 + si]
		    add si,2

Pline2:
		    mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x7720
		    xor cx, cx
		    mov cx, [lb2 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lb2 + si]
		    cmp dx, 14
		    jne P2

;moving onto next line
		    mov di, 1136
		    mov si, 0

;line3
P3:
		    add di,[lb3 + si]
		    add si,2

Pline3:
		    mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x7720
		    xor cx, cx
		    mov cx, [lb3 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lb3 + si]
		    cmp dx, 14
		    jne P3

;moving onto next line
		    mov di, 1296
		    mov si, 0

;line4
P4:
		    add di,[lb4 + si]
		    add si,2

Pline4:
		    mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x7720
		    xor cx, cx
		    mov cx, [lb4 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lb4 + si]
		    cmp dx, 14
		    jne P4

;moving onto next line
		    mov di, 1456
		    mov si, 0

;line5
P5:
		    add di,[lb5 + si]
		    add si,2

Pline5:
		    mov ax, 0xb800
		    mov es, ax
		    mov ax, 0x7720
		    xor cx, cx
		    mov cx, [lb5 + si]

		    cld
		    rep stosw

		    add si,2
		    mov dx,[lb5 + si]
		    cmp dx, 14
		    jne P5

;moving onto next line
	        mov di, 1616
            mov si, 0

;line6
P6:
    add di,[lb6 + si]
    add si,2

Pline6:
            mov ax, 0xb800
            mov es, ax
            mov ax, 0x7720
            xor cx, cx
            mov cx, [lb6 + si]

            cld
            rep stosw

            add si,2
            mov dx,[lb6 + si]
            cmp dx, 14
            jne P6

    ;moving onto next line
            mov di, 1776
            mov si, 0

    ;line7
P7:
            add di,[lb7 + si]
            add si,2

Pline7:
            mov ax, 0xb800
            mov es, ax
            mov ax, 0x7720
            xor cx, cx
            mov cx, [lb7 + si]

            cld
            rep stosw

            add si,2
            mov dx,[lb7 + si]
            cmp dx, 14
            jne P7

    ;moving onto next line
            mov di, 1936
            mov si, 0

    ;line8
P8:
            add di,[lb8 + si]
            add si,2

Pline8:
            mov ax, 0xb800
            mov es, ax
            mov ax, 0x7720
            xor cx, cx
            mov cx, [lb8 + si]

            cld
            rep stosw

            add si,2
            mov dx,[lb8 + si]
            cmp dx, 14
            jne P8

            pop dx
            pop si
            pop bx
            pop di
            pop cx
            pop ax
            pop es

            ret

;-----------------------------------------------------------------------------------------------Printing Press Enter to Start---------------------------------------------------------------------------------------------------------------------

StartMessage:
printstr: 	
            push bp
		    mov bp, sp
		    push es
		    push ax
		    push cx
		    push si
		    push di

		    push ds
		    pop es 
		    mov di, [bp+4] 
		    mov cx, 0xffff 
		    xor al, al 
		    repne scasb 
		    mov ax, 0xffff 
		    sub ax, cx 
		    dec ax 
		    jz exit 

		    mov cx, ax 
		    mov ax, 0xb800
		    mov es, ax 
		    mov al, 80 
		    mul byte [bp+8] 
		    add ax, [bp+10] 
		    shl ax, 1 
		    mov di,ax 
		    mov si, [bp+4] 
		    mov ah, [bp+6] 
		    cld
 
nextchar: 	
            lodsb 
		    stosw 
		    loop nextchar 
exit: 		
            pop di
		    pop si
		    pop cx
		    pop ax
		    pop es
		    pop bp
		    ret 8

;--------------------------------------------------------------------------------------------------Main Game Background---------------------------------------------------------------------------------------------------------------------------

bcg: 		
            push es
		    push ax
		    push cx
		    push di

		    mov ax, 0xb800
		    mov es, ax
		    xor di, di
		    mov ax, 0xB020
		    mov cx, 2000

		    cld
		    rep stosw

		    pop di
		    pop cx
		    pop ax
		    pop es

		    ret

bground:	
            push es
		    push ax
		    push cx
		    push di

		    mov ax, 0xb800
		    mov es, ax
		    mov di, 3840      ;because we are calculating in bytes so double of words value 

l1: 		
            mov word[es:di], 0x6020 
		    add di, 2
		    cmp di, 4000
		    jne l1

		    pop di
		    pop cx
	        pop ax
		    pop es

		    ret
;------------------------------------------------------------------------------------------------------Timer-------------------------------------------------------------------------------------------------------------------------------------------
; subroutine to print a number at top left of screen
; takes the number to be printed as its parameter
printnum: 		
            push bp
			mov bp, sp	
			push es
			push ax
			push bx
			push cx
			push dx
			push di

			mov ax, 0xb800
			mov es, ax 			; point es to video base
			
;clearing the part where seconds are being printed
			mov di,178			
			mov ax, 0x3020
			mov cx, 2

			cld
			rep stosw
;printing the seconds	
			mov ax, [bp+4] 			; load number in ax
			mov bx, 10 			; use base 10 for division
			mov cx, 0 			; initialize count of digits

nextdigit: 		
            mov dx, 0 			; zero upper half of dividend
			div bx 				; divide by 10
			add dl, 0x30 			; convert digit into ascii value
			push dx 			; save ascii value on stack
			inc cx 				; increment count of values
			cmp ax, 0 			; is the quotient zero
			jnz nextdigit 			; if no divide it again

			mov di, 178 			; point di to 70th column

nextpos: 		
            pop dx 				; remove a digit from the stack
			mov dh, 0x3F 			; use normal attribute
			mov [es:di], dx 		; print char on screen
			add di, 2 			; move to next screen location
			loop nextpos 			; repeat for all digits on stack

			pop di
			pop dx
			pop cx
			pop bx
			pop ax
			pop es
			pop bp
			
			ret 2



; timer interrupt service routine
timer: 			
            push ax
            cmp word[gameEnd], 1
            je ttt
			
			inc word [cs:tickcount]		; increment tick count
			cmp word [cs:tickcount], 18 	; 1 second completed after 18 tick counts
			jne ttt

            mov word[cs:tickcount], 0
            mov ax, [cs:seconds]
			mov word[prev], ax 
			inc word [cs:seconds]
			cmp word [cs:seconds], 120
			jbe ppp

			mov word[flag], 1
			jmp ttt
		      	
ppp:        
            push word [cs:seconds]
			call printnum
		 			
ttt:		
            mov al, 0x20
			out 0x20, al 			; end of interrupt

			pop ax
			iret 				; return from interrupt


;-------------------------------------------------------------------------------------------------Move Objects-----------------------------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------Move Ghost---------------------------------------------------------------------------------------------------------------------------------
moveGhost:
			push ax

			cmp word [bPos], 0
			jne next
			call RANDGEN
			mov ax, [random]
			shl ax, 2
			mov word [bPos], ax
			
next:			
            push word[bPos]
			call clrObj
			add word[bPos], 160
			push word[bPos]
			call ghost
			
			cmp word [bPos], 3112
			jb endd
			
			push word[bPos]
			call clrObj
		   	mov word [bPos], 0

endd:			
            pop ax	
			ret

;--------------------------------------------------------------------------------------------------Move Purple Diamond------------------------------------------------------------------------------------------------------------------------
;30 point object(purple)

movePurple:
			push ax

			cmp word [purpPos], 0
			jne next1
			call RANDGEN
			mov ax, [random]
			shl ax, 3
			mov word [purpPos], ax
			
next1:			
            push word[purpPos]
			call clrObj
			add word[purpPos], 160
			push word[purpPos]
			mov ax, 0x50
			push ax
			call diamond
			cmp word[diamondCollide], 1
            je clear

			cmp word [purpPos], 3112
			jb end1
			
clear:			
            push word[purpPos]
			call clrObj
		   	mov word [purpPos], 0
            mov word[diamondCollide], 0

end1:			
            pop ax	
			ret

;-----------------------------------------------------------------------------------------------------Move Blue Diamond------------------------------------------------------------------------------------------------------------------------
;20 point object(blue)

moveBlue:
			push ax

			cmp word [bluePos], 0
			jne next2
			call RANDGEN
			mov ax, [random]
			shl ax, 4
			mov word [bluePos], ax
			
next2:			
            push word[bluePos]
			call clrObj
			add word[bluePos], 160
			push word[bluePos]
			mov ax, 0x10
			push ax
			call diamond
			cmp word[diamondCollide], 1
            je clear1

			cmp word [bluePos], 3112
			jb end2
			
clear1:			
            push word[bluePos]
			call clrObj
		   	mov word [bluePos], 0
            mov word[diamondCollide], 0

end2:			
            pop ax	
			ret
;------------------------------------------------------------------------------------------------------Move Green Diamond----------------------------------------------------------------------------------------------------------------------
;10 point object(green)

moveGreen:
			push ax

			cmp word [greenPos], 0
			jne next3
			call RANDGEN
			mov ax, [random]
			shl ax, 5
			mov word [greenPos], ax
			
next3:			
            push word[greenPos]
			call clrObj
			add word[greenPos], 160

			push word[greenPos]
			mov ax, 0x20
			push ax
			call diamond
			cmp word[diamondCollide], 1
            je clear2
			cmp word [greenPos], 3112
			jb end3
			
clear2:			
            push word[greenPos]
			call clrObj
		   	mov word [greenPos], 0
            mov word[diamondCollide], 0

end3:			
            pop ax	
			ret
;-----------------------------------------------------------------------------------------------------Main Game Objects--------------------------------------------------------------------------------------------------------------------------------
;--------------------------------------------------------------------------------------------------------Bucket-------------------------------------------------------------------------------------------------------------------------------------
bucket: 
	        push bp
	        mov bp, sp
	        push es
	        push ax
	        push cx
	        push di
	        push dx
	        push bx

	        mov ax, 0xb800
	        mov es, ax
	        mov di, [bp+4]
	        mov cx, 0
	        mov dx, 0

l2: 	
            mov word[es:di], 0x783D
	        add di, 2
	        inc cx 
	        cmp cx, 10    ;10x5
	        jne l2

l3: 	
            add di, 160
	        sub di, 20
	        inc dx
	        mov cx, 0
	        cmp dx, 5
	        jne l2

	        pop bx
	        pop dx
	        pop di
	        pop cx
	        pop ax
	        pop es
	        pop bp
	
            ret 2

clrbucket:
	        push bp
	        mov bp, sp
	        push es
	        push ax
	        push cx
	        push di
	        push dx
	        push bx

	        mov ax, 0xb800
	        mov es, ax
	        mov di, [bp+4]
	        mov cx, 0
	        mov dx, 0

l22: 	
            mov word[es:di], 0xB020
	        add di, 2
	        inc cx 
	        cmp cx, 10    ;8x4
	        jne l22

l33: 	
            add di, 160
	        sub di, 20
	        inc dx
	        mov cx, 0
	        cmp dx, 5
	        jne l22

	        pop bx
	        pop dx
	        pop di
	        pop cx
	        pop ax
	        pop es
	        pop bp
	
            ret 2

;------------------------------------------------------------------------------------------------------Diamonds----------------------------------------------------------------------------------------------------------------------------------
;game scoring object
diamond:     
	        push bp
	        mov bp, sp
	        push es
	        push ax
	        push cx
	        push di
	        push bx
	        push dx
	        push si

	        mov bx, 3
	        mov di, [bp+6]


bb:
	        mov ax, 0xb800
	        mov es, ax
	        mov ah, [bp+4]
	        mov al, 0x20
	        mov cx, 5

	        cld
	        rep stosw

	        add di, 160
	        sub di, 10
	        dec bx
	        jnz bb

	        mov di, [bp+6]
	        mov si, 0
	        mov bx, 0

D1:
	        add di,[b1 + si]
	        add si,2

	        mov ax, 0xb800
	        mov es, ax
	        mov ax, 0xB020
	        xor cx, cx
	        mov cx, [b1 + si]
	        cmp cx, 14
	        je exit1

	        cld
	        rep stosw

	        add si,2
	        mov dx,[b1 + si]
	        cmp dx, 14
	        jne D1

exit1: 	
            inc bx
	        add si, 2
	        add di, 160
	        sub di, 10
	        cmp bx, 3
	        jne D1

;checking collision
            mov ax, word[bp + 6]
            add ax, 324
            mov word[dtemp], ax

;bucket check
            mov ax, word[initialLoc]
            mov word[dtemp1], ax
            mov ax, word[initialLoc]
            add ax, 50
            mov word[dtemp2], ax 

            mov ax,word[dtemp2]
            cmp word[dtemp], ax
            jg continue

            mov ax, word[dtemp1]
            cmp word[dtemp], ax
            jl continue

            mov word[diamondCollide], 1

comparisonColor:
            mov ah, [bp+4]

cmpPurple:  
            cmp ah, 0x50
            jne cmpBlue
            add word[score], 30
            jmp continue

cmpBlue:  
            cmp ah, 0x10
            jne cmpGreen
            add word[score], 20
            jmp continue

cmpGreen:  
            cmp ah, 0x20
            add word[score], 10

continue:
	        pop si
	        pop dx
	        pop bx
	        pop di
	        pop cx
	        pop ax
	        pop es
	        pop bp

	        ret 4

;----------------------------------------------------------------------------------------------------------Ghost-------------------------------------------------------------------------------------------------------------------------------------
ghost:
	        push bp
	        mov bp, sp
	        push es
	        push ax
	        push cx
	        push di
	        push bx
	        push dx
	        push si

	        mov bx, 3
	        mov di, [bp+4]


gg:
	        mov ax, 0xb800
	        mov es, ax
	        mov ax, 0x0020
	        mov cx, 5

	        cld
	        rep stosw

	        add di, 160
	        sub di, 10
	        dec bx
	        jnz gg

	        mov di, [bp+4]
	        mov si, 0
	        mov bx, 0

G1:
	        add di,[g1 + si]
	        add si,2

	        mov ax, 0xb800
	        mov es, ax
	        mov ax, 0x4020
	        xor cx, cx
	        mov cx, [g1 + si]
	        cmp cx, 14
	        je exit2

	        cld
	        rep stosw

	        add si,2
	        mov dx,[g1 + si]
	        cmp dx, 14
	        jne G1

exit2: 	
            inc bx
	        add si, 2
	        add di, 160
	        sub di, 10
	        cmp bx, 3
	        jne G1

	        sub di, 160
	        mov word [es:di], 0xB020
	        add di, 8
	        mov word [es:di], 0xB020

    ;checking collision
            mov ax, word[bp + 4]
            add ax, 324
            mov word[temp], ax

    ;bucket check
            mov ax, word[initialLoc]
            mov word[btemp1], ax
            mov ax, word[initialLoc]
            add ax, 48
            mov word[btemp2], ax

            mov ax,word[btemp2]
            cmp word[temp], ax
            jg continue2

            mov ax, word[btemp1]
            cmp word[temp], ax
            jl continue2

            mov word[ghostCollide], 1

continue2:
	        pop si
	        pop dx
	        pop bx
	        pop di
	        pop cx
	        pop ax
	        pop es
	        pop bp

	        ret 2

printScore: 		
            push bp
			mov bp, sp	
			push es
			push ax
			push bx
			push cx
			push dx
			push di

			mov ax, 0xb800
			mov es, ax 			    ; point es to video base
			
;clearing the part where score is being printed
			mov di,[bp + 6]			
			mov ax, 0x3020
			mov cx, 2

			cld
			rep stosw

			mov ax, [bp+4] 			; load number in ax
			mov bx, 10 			    ; use base 10 for division
			mov cx, 0 			    ; initialize count of digits

nextdigit1: 		
            mov dx, 0 			    ; zero upper half of dividend
			div bx 				    ; divide by 10
			add dl, 0x30 			; convert digit into ascii value
			push dx 			    ; save ascii value on stack
			inc cx 				    ; increment count of values
			cmp ax, 0 			    ; is the quotient zero
			jnz nextdigit1 			; if no divide it again

			mov di, [bp + 6] 			

nextpos1: 		
            pop dx
            mov dh, [bp + 8] 			; use normal attribute
			mov [es:di], dx 		; print char on screen
			add di, 2 			    ; move to next screen location
			loop nextpos1 			; repeat for all digits on stack

			pop di
			pop dx
			pop cx
			pop bx
			pop ax
			pop es
			pop bp
			
			ret 2 	

;---------------------------------------------------------------------------------------Clearing Objects------------------------------------------------------------------------------------------------------------------------
clrObj:
	        push bp
	        mov bp, sp
	        push bx
	        push di
	        push ax
	        push es
	        push ax
	        push cx
	        push bx

	        mov bx, 3
	        mov di, [bp+4]


bb1:
	        mov ax, 0xb800
	        mov es, ax
	        mov ah, 0xB0
	        mov al, 0x20
	        mov cx, 5

	        cld
	        rep stosw

	        add di, 160
	        sub di, 10
	        dec bx
	        jnz bb1

	        pop bx
	        pop cx
	        pop ax
	        pop es
	        pop ax
	        pop di
	        pop bx
	        pop bp
	
            ret 2

;-------------------------------------------------------------------------------------Adding interrupts to use enter----------------------------------------------------------------------------------------------------------------------------------
Penter:  		
	        mov ah, 0            ;service 0-get keystroke
	        int 0x16	     ;call BIOS keyboard services
	        cmp al, 13	     ;is enter key pressed
	        jne Penter
	        jmp start

;-------------------------------------------------------------------------------------Keyboard Interrupt Service Routine--------------------------------------------------------------------------------------------------------------------
kbisr:			
            		push ax
			push es
			push bx
			push dx
			push di

			mov bx, [cs:initialLoc]     ;initial location of bucket
			mov di,bx
			mov ax,0xb800
			mov es,ax
			mov dx, 0x8020   	

			in al, 0x60 		        ; read a char from keyboard port
			
			cmp al, 0x01         	    ; has the esc key pressed.........0100 1011
			jne nextcmp           	    ; no, try next comparison
			
			mov word[flag1],1	        ;if esc is pressed
			jmp nomatch

nextcmp:	        
            		cmp al, 0x4b 		; has the left arrow pressed.........0100 1011
			jne nextcmp1 		; no, try next comparison
			
			sub bx, 2
			jmp moveahead
		
nextcmp1:		
           		cmp al, 0x4d 		; has the right arrow pressed......... 0100 1101
			jne nextcmp2 		; no, try next comparison
			add bx, 2
			jmp moveahead
		
nextcmp2:		
            		cmp al, 0xcb 		; has the left arrow released........1100 1011
			jne nextcmp3 		; no, try next comparison
			jmp moveahead 		; leave interrupt routine 

nextcmp3:		
            		cmp al, 0xcd 		; has the right arrow released..... 1100 1101
			jne nomatch    
			jmp moveahead 		; leave interrupt routine

wallRight:		
            		mov bx, 3180
			jmp neww
wallLeft:		
            		mov bx, 3040
			jmp neww

moveahead:
			cmp bx, 3180
			ja wallRight
			cmp bx, 3040
			jb wallLeft

neww:			
            		push di			;old starting point 
			call clrbucket

			mov [cs:initialLoc], bx	
			mov di,bx		;new starting point 
			push di
			call bucket
			jmp nomatch
			
		
nomatch:		
            		pop di
			pop dx
			pop bx
			pop es
			pop ax
			jmp far [cs:oldisr]	; call the original ISR
			;iret 			; return from interrupt will be called in original routine

;--------------------------------------------------------------------------------------------Random Number Generator---------------------------------------------------------------------------------------------------------------------
RANDGEN:         ; generate a rand no using the system time
RANDSTART:
   	        ;MOV AH, 00h  ; interrupts to get system time        
   	        ;INT 1AH      ; CX:DX now hold number of clock ticks since midnight      
            
            mov dx, word[seconds]
            add dx, dx
            shl dx, 5

   	        mov  ax, dx
	        mov bx, 25174
	        mul bx
	        add ax, 13850
   	        xor  dx, dx
   	        mov  cx, 78 
	        shr ax,5
	        add cx, 1   
   	        div  cx       ; here dx contains the remainder of the division - from 0 to 9

	        mov word[random], dx   
	        mov ah, 2h   ; call interrupt to display a value in DL
  	
            int 21h    
	        ret
;---------------------------------------------------------------------------------------------Main Function---------------------------------------------------------------------------------------------------------------------------------------
main:	
	call clrscr
	mov ax, 26
	push ax 
	mov ax, 21
	push ax 
	mov ax, 0xE7 
	push ax 
	mov ax, message
	push ax 
	call StartMessage 
	call StartScreen
	call BLACKScreens
	call Penter

start:
	xor ax, ax
	mov es, ax 			        ; point es to IVT base
	cli 				        ; disable interrupts
	mov word [es:8*4], timer	; store offset at n*4
	mov [es:8*4+2], cs 		    ; store segment at n*4+2
	sti                         ; enable interrupts
	mov dx, start 			    ; end of resident portion
	add dx, 15 			        ; round up to next para
	mov cl, 4
	shr dx, cl 			        ; number of paras

	xor ax, ax
	mov es, ax					; point es to IVT base
			
	mov ax, [es:9*4]
	mov [oldisr], ax			; save offset of old routine
	mov ax, [es:9*4+2]
	mov [oldisr+2], ax			; save segment of old routine

	cli							; disable interrupts
	mov word [es:9*4], kbisr	; store offset at n*4
	mov [es:9*4+2], cs			; store segment at n*4+2
	sti				
	
	
mainscr:	
	        call bcg
	        call bground
	        mov ax, 3112
	        push ax
	        call bucket	

            mov ax, 61              ;col
	        push ax 
	        mov ax, 1               ;row
	        push ax
	        mov ax, 0x3F
	        push ax
	        mov ax, liveScore
	        push ax
	        call printstr
            
            mov ax, 0x3F
	        push ax
            mov ax, 308
 	        push ax
            mov ax, [score]
 	        push ax
 	        call printScore

	        mov ax, 3               ;col
	        push ax 
	        mov ax, 1               ;row
	        push ax
	        mov ax, 0x3F
	        push ax
	        mov ax, time
	        push ax
	        call printstr
            
            call movePurple
	        call moveBlue
	        call moveGreen
	        call moveGhost

mainLoop:

	        mov ax, [cs:seconds]
	        sub ax, word [prev]
	        cmp ax, 1
	        jne bbbb
	
	        call delay
	        call movePurple
	        call delay
	        call moveBlue
	        call delay
	        call moveGreen
	        call delay
	        call moveGhost

	        mov ax, 61              ;col
	        push ax 
	        mov ax, 1               ;row
	        push ax
	        mov ax, 0x3F
	        push ax
	        mov ax, liveScore
	        push ax
	        call printstr
            
            mov ax, 0x3F
	        push ax
            mov ax, 308
 	        push ax
            mov ax, [score]
 	        push ax
 	        call printScore

	        mov ax, 3               ;col
	        push ax 
	        mov ax, 1               ;row
	        push ax
	        mov ax, 0x3F
	        push ax
	        mov ax, time
	        push ax
	        call printstr

bbbb:		cmp word[ghostCollide], 1    ;check for ghost
            	je ending
            
		cmp word [flag1], 1          ;for escape
	        je ending

           	cmp word [flag], 1           ;for timer
	        jne mainLoop

            
	
ending: 
	        mov word[cs:seconds], 120
            
	
            	mov word[gameEnd], 1
	        call clrscr
	        call EndScreen
	        call printGameOver

	        mov ax, 31
	        push ax 
	        mov ax, 17
	        push ax
	        mov ax, 0x74
	        push ax
	        mov ax, finalScore
	        push ax
	        call printstr

            	mov ax, 0x74
	        push ax
            	mov ax, 2806
 	        push ax
            	mov ax, [score]
 	        push ax
 	        call printScore
		
		mov ax, [oldisr]
		mov bx, [oldisr+2]
		cli							
		mov word [es:9*4], ax	
		mov [es:9*4+2], bx			
		sti	

	        mov dx, main    						;TSR
	        add dx, 15
	        mov cl, 4
	        shr dx, cl

	        mov ax, 0x3100 			; terminate and stay resident
	        int 0x21




    