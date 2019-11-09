.MODEL SMALL

.DATA
    NUM DW 1234H, 0F234H
    SUM DW 2 DUP(0)
    
.CODE
START:
    MOV AX, @DATA
    MOV DS, AX
    MOV AX, NUM
    MOV BX, 0H
    ADD AX, NUM+2
    
    JNC DOWN
    
    INC BX
    
    DOWN:
        MOV SUM,AX
        MOV SUM+2, BX
        
    MOV AH, 4CH
    INT 21H
END START
END        
    
