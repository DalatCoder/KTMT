; =========================================
; NGUYEN TRONG HIEU - 1812756 - CTK42   
; =========================================

.MODEL SMALL
.STACK 100h
.DATA

    MSG1 DB 10,13, 'Nhap vao 1 so thap phan: $'
    MSG2 DB 10,13, 'So thap phan vua nhap la: $'
    ERR1 DB 10,13, 'Nhap sai! Nhap lai toan bo di, ahihi$'
 
    END1 DB 10,13, 'Bam phim bat ki de thoat chuong trinh...$'
    
    KYTU DW ? ; => Luu ky tu so vua nhap

.CODE
    ; LAY DU LIEU TU DATA VAO DS
    MOV AX, @DATA
    MOV DS, AX    
    ; =========================================
    
    RESET:         
        ; Hien thi thong bao nhap 1 so thap phan
        MOV AH, 9
        LEA DX, MSG1
        INT 21h
        
        ; Khoi tao gia tri
        XOR BX, BX
        
    INPUT:
        MOV AH, 1
        INT 21h
        
        CMP AL, 0Dh
        JE BREAK
        
        CMP AL, '0'
        JB XULY_LOI
        CMP AL, '9'
        JA XULY_LOI
        
        JMP XULY_OK ; Nguoi dung nhap dung
        
        XULY_LOI:
            MOV AH, 9
            LEA DX, ERR1
            INT 21h
            
            JMP RESET
            
        XULY_OK:
            AND AL, 0Fh
            XOR AH, AH
            MOV KYTU, AX ; Luu ky tu so vua nhap vao KYTU
            
            MOV AX, BX ; Tong = Tong * 10
            MOV CX, 10
            MUL CX ; AX = AX * 10            
            
            ADD AX, KYTU ; AX = AX + KYTU
            
            MOV BX, AX
            
            JMP INPUT
    
    BREAK:
        ; Xuat thong bao ket qua
        MOV AH, 9
        LEA DX, MSG2
        INT 21h
    
    XOR CX, CX    
    MOV AX, BX ; Thuc hien phep chia DIV, AX = AX / 10
    MOV BX, 10
    
    XULY_STACK:
        XOR DX, DX ; Xoa phan du (remainder) hien tai
        DIV BX
        PUSH DX
        INC CX     ; Dem so phan tu da PUSH vao stack 
        
        CMP AX, 0  ; Thuong lon hon 0 thi tiep tuc chia
        JA XULY_STACK
    
    PRINT:
        POP DX
        OR DX, 30h
        MOV AH, 2
        INT 21h
        LOOP PRINT
    
    
    
            
    ; =========================================
    ; DUNG MAN HINH, XEM KET QUA
    MOV AH, 9
    LEA DX, END1
    INT 21h
    
    MOV AH, 7
    INT 21h
    
    ; THOAT CHUONG TRINH
    MOV AH, 4Ch
    INT 21h
    
END