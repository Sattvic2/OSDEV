Bits 16
org 0x7C00
jmp Main

;In= si = string, ah = 0eh, al = char , Out= character screen
Print:
lodsb
cmp al, 0
je Done
mov ah, 0eh
int 10h
jmp Print

Done:
ret

Main:
mov si, msg
call Print

cli
hlt

msg db	"Hello World!",0

times 510 - ($-$$)	db 	0

dw 0xAA55