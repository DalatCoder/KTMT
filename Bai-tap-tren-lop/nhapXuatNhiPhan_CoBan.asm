.MODEL SMALL
.STACK 100h
.DATA
    MSG1 DB 10,13, 'Nhap vao chuoi nhi phan: $'
    MSG2 DB 10,13, 'Chuoi nhi phan vua nhap la: $'

.CODE
    ; Lay dia chi tu DATA vao thanh ghi DS
    MOV AX, @DATA
    MOV DS, AX
    
    ; Xuat thong bao yeu cau nguoi dung nhap chuoi nhi phan
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    
    XOR BX, BX ; MOV BL, 0
      
INPUT:
            
    MOV AH, 1
    INT 21h
    
    CMP AL, 13
    JE BREAK  
    
    AND AL, 0Fh
    SHL BX, 1
    OR BL, AL
    
    JMP INPUT

BREAK:

    ; Xuat thong bao ket qua
    MOV AH, 9
    LEA DX, MSG2
    INT 21h
    
    MOV CX, 16
    
PRINT:

    SHL BX, 1
    JNC PRINT_0 ; In bit so 0 (JNC nhay khi CF=0)
    JC PRINT_1 ; In bit so 1 (JC nhay khi CF=1)
    
PRINT_0:
    MOV AH, 2
    MOV DL, '0'
    INT 21h
    JMP CONTINUE
    
PRINT_1:    
    MOV AH, 2
    MOV DL, '1'
    INT 21h
    
CONTINUE:   
    LOOP PRINT    

    ; Thoat chuong trinh
    MOV AH, 4Ch
    INT 21h
END