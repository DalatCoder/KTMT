.MODEL SMALL
.STACK
.DATA

    GOODBYE DB 10,13, 'Bam phim bat ki de tiep tuc...$'
    
    ; Bai 1
    MSG1 DB 'Hello World!$'
    MSG2 DB 10,13, 'Hello, solar system!$'
    MSG3 DB 10,13, 'Hello, universe!$'
    
    ; Bai 2
    PROMPT1 DB 'Hay nhap mot ky tu: $'
    CHAR DB ?
    RESULT_MSG1 DB 10,13, 'Ky tu da nhap: $' 
    
    ; Bai 3
    RESULT_MSG2 DB 10,13, 'Ky tu dung truoc: $'
    RESULT_MSG3 DB 10,13, 'Ky tu dung sau: $' 
    
    ; Bai 4
    RESULT_MSG4 DB ', da nhap: $'
    RESULT_MSG5 DB ', dung sau: $'    
    
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
;  mov ah, 9
;  lea dx, PROMPT1
;  int 21h
  
  ; Read character from standard input, result is stored in AL
;  mov ah, 1
;  int 21h
  
  ; Luu gia tri vua nhap vao CHAR
;  mov CHAR, al
  
;  mov ah, 9
;  lea dx, RESULT_MSG1
;  int 21h
  
  ; Write character to standard output
;  mov ah, 6
;  mov dl, CHAR
;  int 21h
                                                                   
; ===============================

; ===============================
; BAI 3

;    mov ah, 9
;    lea dx, PROMPT1
;    int 21h
    
    ; Read character from standard input
;    mov ah, 1
;    int 21h
    
    ; Luu gia tri vua nhap vao CHAR
;    mov CHAR, al
    
    ; Xuat thong bao ky tu dung truoc
;    mov ah, 9
;    lea dx, RESULT_MSG2
;    int 21h
    
    ; Gan CHAR vao al
;    mov al, CHAR
    
    ; Giam gia tri tai al de lay ky tu phia truoc
;    dec al
    
    ; Write character to standard output
;    mov ah, 6
;    mov dl, al
;    int 21h
    
    ; Xuat thong bao ky tu dung sau
;    mov ah, 9
;    lea dx, RESULT_MSG3
;    int 21h
    
    ; Gan CHAR vao al
;    mov al, CHAR
    
    ; Tang gia tri tai al de lay ky tu phia sau
;    inc al
    
    ; Xuat ky tu ra man hinh
;    mov ah, 6
;    mov dl, al
;    int 21h

; ===============================

; ===============================
; BAI 4
    ; Xuat thong bao yeu cau nhap ki tu
    mov ah, 9
    lea dx, PROMPT1
    int 21h
    
    ; Nhap ki tu tu ban phim
    mov ah, 1
    int 21h
    
    ; Gan ki tu vua nhap vao CHAR
    mov CHAR, al
    
    ; Xuat thong bao ky tu dung truoc
    mov ah, 9
    lea dx, RESULT_MSG2
    int 21h
    
    ; Xuat ki tu dung truoc
    mov al, CHAR
    dec al
    
    mov ah, 2
    mov dl, al
    int 21h
    
    ; Xuat thong bao ki tu da nhap
    mov ah, 9
    lea dx, RESULT_MSG4
    int 21h
    
    ; Xuat ki tu da nhap
    mov ah, 2
    mov dl, CHAR
    int 21h
    
    ; Xuat thong bao ki tu dung sau
    mov ah, 9
    lea dx, RESULT_MSG5
    int 21h
    
    ; Xuat ki tu dung sau
    mov al, CHAR
    inc al
    
    mov ah, 2
    mov dl, al
    int 21h
    

; ===============================

; Xuat thong bao ket thuc chuong trinh
mov ah, 9
lea dx, GOODBYE
int 21h

; Dung chuong trinh xem ket qua
mov ah, 1
int 21h

; Tra quyen dieu hanh cho DOS
mov ah, 4ch                              
int 21h

END