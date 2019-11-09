.MODEL SMALL
.STACK
.DATA
    PROMPT DB 10,13, 'Chon bai tap de thuc hien tu 1 den 5 (0 de thoat): $'
    ERROR_MSG DB 10,13, 'Lua chon khong hop le!$'
    GOODBYE DB 10,13, 'Bam phim bat ki de tiep tuc...$'         
         
    ; Bai 1
    MSG1 DB 10,13, 'Hello World!$'
    MSG2 DB 10,13, 'Hello, solar system!$'
    MSG3 DB 10,13, 'Hello, universe!$'
    
    ; Bai 2
    PROMPT1 DB 10,13, 'Hay nhap mot ky tu: $'
    CHAR DB ?
    RESULT_MSG1 DB 10,13, 'Ky tu da nhap: $' 
    
    ; Bai 3
    RESULT_MSG2 DB 10,13, 'Ky tu dung truoc: $'
    RESULT_MSG3 DB 10,13, 'Ky tu dung sau: $' 
    
    ; Bai 4
    RESULT_MSG4 DB ', da nhap: $'
    RESULT_MSG5 DB ', dung sau: $' 
    
    ; Bai 5
    PROMPT2 DB 10,13, 'Nhap ky tu thu nhat: $'
    PROMPT3 DB 10,13, 'Nhap ky tu thu hai: $'
    RESULT_MSG6 DB 10,13, 'Ky tu tong: $'
    CHAR1 DB ?
    CHAR2 DB ?
    
.CODE

; Lay dia chi vung du lieu dat vao thanh ghi DS
mov ax, @DATA
mov ds, ax

; ===============================
MAIN:
    ; Xuat thong bao yeu cau nguoi dung lua chon
    mov ah, 9
    lea dx, PROMPT
    int 21h
    
    ; Nhap ki tu tu ban phim
    mov ah, 1
    int 21h
    mov CHAR, al

    ; Kiem tra dieu kien lap    
    CMP CHAR, '0'
    JE FINISH
    
    ; Thuc thi lenh tuong ung
    CMP CHAR, '1'
    JE BAI_1
    
    CMP CHAR, '2'
    JE BAI_2
    
    CMP CHAR, '3'
    JE BAI_3
    
    CMP CHAR, '4'
    JE BAI_4
    
    CMP CHAR, '5'
    JE BAI_5 
    
    ; Thong bao lua chon khong hop le
    JMP INVALID_CHOICE
    
    

; ================================

INVALID_CHOICE:
    mov ah, 9
    lea dx, ERROR_MSG
    int 21h
    JMP MAIN

BAI_1:
    ; Xuat chuoi 1
    mov ah, 9
    lea dx, MSG1
    int 21h

    ; Xuat chuoi 2
    mov ah, 9
    lea dx, MSG2
    int 21h

    ; Xuat chuoi 3
    mov ah, 9
    lea dx, MSG3
    int 21h
    
    ; Ve ham main
    JMP MAIN

BAI_2:
    ; Xuat thong bao yeu cau nhap 1 ki tu
    mov ah, 9
    lea dx, PROMPT1
    int 21h
  
    ; Read character from standard input, result is stored in AL
    mov ah, 1
    int 21h
  
    ; Luu gia tri vua nhap vao CHAR
    mov CHAR, al
    
    ; Xuat thong bao ket qua
    mov ah, 9
    lea dx, RESULT_MSG1
    int 21h
  
    ; Write character to standard output
    mov ah, 6
    mov dl, CHAR
    int 21h
    
    ; Ve ham main
    JMP MAIN
                                                                   
BAI_3:
    ; Xuat thong bao yeu cau nhap ki tu
    mov ah, 9
    lea dx, PROMPT1
    int 21h
    
    ; Read character from standard input
    mov ah, 1
    int 21h
    
    ; Luu gia tri vua nhap vao CHAR
    mov CHAR, al
    
    ; Xuat thong bao ky tu dung truoc
    mov ah, 9
    lea dx, RESULT_MSG2
    int 21h
    
    ; Gan CHAR vao al
    mov al, CHAR
    
    ; Giam gia tri tai al de lay ky tu phia truoc
    dec al
    
    ; Write character to standard output
    mov ah, 6
    mov dl, al
    int 21h
    
    ; Xuat thong bao ky tu dung sau
    mov ah, 9
    lea dx, RESULT_MSG3
    int 21h
    
    ; Gan CHAR vao al
    mov al, CHAR
    
    ; Tang gia tri tai al de lay ky tu phia sau
    inc al
    
    ; Xuat ky tu ra man hinh
    mov ah, 6
    mov dl, al
    int 21h   
    
    ; Ve ham main
    JMP MAIN

BAI_4:
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
    
    ; Ve ham main
    JMP MAIN
    
BAI_5:
    ; Xuat thong bao yeu cau nhap ki tu thu nhat
    mov ah, 9
    lea dx, PROMPT2
    int 21h
    
    ; Nhap ki tu thu nhat
    mov ah, 1
    int 21h
    mov CHAR1, al
    
    ; Xuat thong bao yeu cau nhap ki tu thu hai
    mov ah, 9
    lea dx, PROMPT3
    int 21h
    
    ; Nhap ki tu thu hai
    mov ah, 1
    int 21h
    mov CHAR2, al
    
    ; Xuat thong bao tong
    mov ah, 9
    lea dx, RESULT_MSG6
    int 21h
    
    ; Tinh tong
    mov al, CHAR1
    add al, CHAR2
    
    ; Xuat tong ra man hinh
    mov ah, 2
    mov dl, al
    int 21h 
    
    ; Ve ham main
    JMP MAIN
    
; ===============================

; Xuat thong bao ket thuc chuong trinh
FINISH:
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