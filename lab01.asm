.MODEL SMALL
.STACK
.DATA
    ; Bai 1
    MSG1 DB 'Hello World!$'
    MSG2 DB 10,13, 'Hello, solar system!$'
    MSG3 DB 10,13, 'Hello, universe!$'
    
    ; Bai 2
    PROMPT1 DB 'Hay nhap mot ky tu: $'
    CHAR DB ?
    RESULT_MSG1 DB 10,13, 'Ky tu da nhap: $'
    
.CODE

; Lay dia chi vung du lieu dat vao thanh ghi DS
mov ax, @DATA
mov ds, ax

; ===============================
; BAI 1
; Xuat chuoi 1
; mov ah, 9
; lea dx, MSG1
; int 21h

; Xuat chuoi 2
; mov ah, 9
; lea dx, MSG2
; int 21h

; Xuat chuoi 3
; mov ah, 9
; lea dx, MSG3
; int 21h

; ===============================

; ===============================
; BAI 2
  mov ah, 9
  lea dx, PROMPT1
  int 21h
  
  ; Read character from standard input, result is stored in AL
  mov ah, 1
  int 21h
  
  ; Luu gia tri vua nhap vao CHAR
  mov CHAR, al
  
  mov ah, 9
  lea dx, RESULT_MSG1
  int 21h
  
  ; Write character to standard output
  mov ah, 6
  mov dl, CHAR
  int 21h
                                                                   
; ===============================

; Tra quyen dieu hanh cho DOS
mov ah, 4ch                              
int 21h

END