.MODEL SMALL
.STACK 100h
.DATA

    MSG1 DB 10,13, 'Nhap chuoi hexa: $'
    MSG2 DB 10,13, 'Chuoi vua nhap la: $'
    MSG3 DB 10,13, 'Bam phim bat ki de tiep tuc...$'

.CODE

    MOV AX, @DATA
    MOV DS, AX
    
           
    MOV AH, 9
    LEA DX, MSG1
    INT 21h           
           
    XOR BX, BX
    

INPUT:
    MOV AH, 1    
    INT 21h
    
    CMP AL, 13
    JE EXIT
    
    CMP AL, '9'
    JBE NHOHON_10
    JA LONHON_10
    
    NHOHON_10:
        AND AL, 0Fh
        JMP LUU
        
    LONHON_10:
        SUB AL, 37h
        JMP LUU
        
    LUU:
        SHL BX, 4
        XOR AH, AH
        OR BX, AX
    
    JMP INPUT
    
EXIT:
    
    MOV AH, 9
    LEA DX, MSG2
    INT 21h
    
    MOV CX, 4
    
PRINT_HEX:
    MOV DL, BH
    SHR DL, 4
    CMP DL, 9
    
    JG PRINT_LETTER
    
    OR DL, 30h
    MOV AH, 2
    INT 21h
    JMP CONTINUE
 
PRINT_LETTER:
    ADD DL, 37h
    MOV AH, 2
    INT 21h
  
CONTINUE:
    ROL BX, 4
    LOOP PRINT_HEX
    
    
    ; THOAT CHUONG TRINH
    MOV AH, 9
    LEA DX, MSG3
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    MOV AH, 4Ch
    INT 21h
END
                                                           