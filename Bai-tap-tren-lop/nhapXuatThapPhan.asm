.MODEL SMALL
.DATA
    MSG1 DB 10,13,'Nhap vao so thap phan: $'
    MSG2 DB 10,13,'So thap phan vua nhap la:$'
    MSG3 DB 10,13,'Bam phim bat ki de tiep tuc...$'
    
    NUM DB ?
    SUM DB ?

.CODE

    ; Lay du lieu tu DATA vao DS
    MOV AX, @DATA
    MOV DS, AX
    
    
    ; Xuat thong bao
    LEA DX,MSG1
    MOV AH,9
    INT 21H
    
    XOR BX, BX
    
INPUT:
    MOV AH, 1
    INT 21h
    
    CMP AL, 13
    JE BREAK
    
    AND AL, 0Fh
    XOR AH, AH
    
    MOV CX, AX
    
    MOV AX, 10
    MUL BX
    MOV BX, AX
    ADD BX, CX
    
    JMP INPUT
    
BREAK:

    ; Xuat thong bao ket qua  
    MOV AH, 9
    LEA DX, MSG2
    INT 21h
    
    MOV AX, BX
    ; Lay cac ki so thap phan trong XX luu vao stack
    XOR CX, CX
    MOV BX, 10  
    
@REPEAT1:
    XOR DX, DX
    DIV BX
    PUSH DX
    INC CX
    OR AX, AX
    JNZ @REPEAT1
    
    ; Xuat CX da luu vao stack
    MOV AH, 2
@FOR:
    POP DX
    OR DL, 30h
    INT 21h
    LOOP @FOR
    
    ;===============================
    ; Dung chuong trinh
    MOV AH, 9
    LEA DX, MSG3
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h

END
                      