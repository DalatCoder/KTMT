.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 10,13, 'Nhap vao chuoi hexa: $'
    MSG2 DB 10,13, 'Chuoi hexa vua nhap la: $'

.CODE
    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; Xuat thong bao
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    
    XOR BX, BX ; MOV BX, 0
    
INPUT:
    MOV AH, 1
    INT 21h
    
    CMP AL, 13
    JE BREAK
    
    CMP AL, '9'
    JBE XULY_NHOHON_10
    JA XULY_LONHON_10
    
XULY_NHOHON_10:
    AND AL, 0Fh
    JMP CONTINUE
    
XULY_LONHON_10:
    SUB AL, 37h

CONTINUE:
    ; Luu gia tri vua nhap vao thanh ghi BX
    SHL BX, 4
    XOR AH, AH ; MOV AH, 0
    OR BX, AX
    

    JMP INPUT    

BREAK:
    ; xuat thong bao
    MOV AH, 9
    LEA DX, MSG2
    INT 21h 
    
    MOV CX, 4
    MOV AH, 2
    
PRINT:
    MOV DL, BH
    SHR DL, 4
    
    CMP DL, 9
    JBE XUATSO
    JA XUATCHU
    
XUATSO:
    OR DL, 30h
    JMP CONTINUE1
    
XUATCHU:    
    ADD DL, 37h
    
CONTINUE1:
    INT 21h
    ROL BX, 4    
    LOOP PRINT    
    

    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
END
