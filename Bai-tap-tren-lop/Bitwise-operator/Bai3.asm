.MODEL SMALL
.STACK 100h
.DATA



.CODE 
   ; Lay du lieu tu DATA vao DS
   MOV AX, @DATA
   MOV DS, AX
   
   ; ==========================================
   
   
     
   MOV BX, 1234h; 0001 0010 0011 0100
   MOV CX, 16
   
PRINT:
    SHL BX, 1
    JNC PRINT_ZERO
    JC PRINBT_ONE 
    
    
PRINT_ZERO:
    MOV AH, 2
    MOV DL, '0'
    INT 21h
    JMP EXIT
    
PRINT_ONE:
    MOV AH, 2
    MOV DL, '1'
    INT 21h
    
EXIT:    
    LOOP PRINT        
     
     
   ; ===========================================
   ; Thoat chuong trinh
   MOV AH, 4Ch
   INT 21h
   
END