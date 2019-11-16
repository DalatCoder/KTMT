.MODEL SMALL
.STACK 100h
.DATA

   MSG DB 10,13, 'Nhap chuoi nhi phan: $'
   NEWLINE DB 10, 13, 'Chuoi nhi phan vua nhap: $'

.CODE
    MOV AX, @DATA
    MOV DS, AX
    
           
    MOV AH, 9
    LEA DX, MSG
    INT 21h
    
    XOR BX, BX

INPUT:        
    MOV AH, 1
    INT 21h 
    
    CMP AL, 13
    JE EXIT
    
    AND AL, 0Fh
    SHL BX, 1
    OR BL, AL
             
    JNE INPUT

EXIT:       
    ; PRINT NEW LINE
    MOV AH, 9
    LEA DX, NEWLINE
    INT 21h  

    MOV CX, 16
    MOV AH, 2
          
PRINT:     
    SHL BX, 1
    JNC PRINT_0
    JC PRINT_1
    
    
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
              
    ; THOAT CHUONHG TRNIH

FINISH:    
    MOV AH, 4Ch
    INT 21h


END