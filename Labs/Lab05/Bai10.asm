.MODEL SMALL
.STACK 100h
.DATA
    END1 DB 10,13,10, 'Bam 1 phim bat ki de thoat chuong trinh ...$'

    MSG1 DB 10,13, 'CHUONG TRINH TINH CHU VI VA DIEN TICH HINH CHU NHAT$'
    MSG2 DB 10,13, 'Nhap vao chieu dai >> $'    
    MSG3 DB 10,13, 'Nhap vao chieu rong >> $'
    RES1 DB 10,13, 'Chu vi hinh chu nhat la: $'
    RES2 DB 10,13, 'Dien tich hinh chu nhat la: $'
    
    CHIEUDAI DB ?
    CHIEURONG DB ?
    CHUVI DW ?
    DIENTICH DW ?
    
.CODE
    ; KHOI TAO CHUONG TRINH
    CALL KHOI_TAO_CHUONG_TRINH
    
    ; Xuat thong bao ten chuong trinh
    MOV DX, OFFSET MSG1
    CALL XUAT_CHUOI
    
    ; Xuat thong bao nhap chieu dai
    MOV DX, OFFSET MSG2
    CALL XUAT_CHUOI
    
    CALL NHAP_SO
    MOV CHIEUDAI, BL
    
    ; Xuat thong bao nhap chieu rong
    MOV DX, OFFSET MSG3
    CALL XUAT_CHUOI
    
    CALL NHAP_SO
    MOV CHIEURONG, BL
    
    ; Xuat thong bao tinh chu vi HCN
    MOV DX, OFFSET RES1
    CALL XUAT_CHUOI
    
    MOV BH, CHIEUDAI
    MOV BL, CHIEURONG
    CALL TINH_CHU_VI
    MOV CHUVI, AX
    
    ; Xuat gia tri chu vi
    MOV AX, CHUVI
    CALL XUAT_THAP_PHAN
    
    ; Xuat thong bao tinh dien tich HCN
    MOV DX, OFFSET RES2
    CALL XUAT_CHUOI
    
    MOV BH, CHIEUDAI
    MOV BL, CHIEURONG
    CALL TINH_DIEN_TICH
    MOV DIENTICH, AX
    
    ; Xuat gia tri dien tich
    MOV AX, DIENTICH
    CALL XUAT_THAP_PHAN
                           
    ; Thoat chuong trinh
    CALL THOAT_CHUONG_TRINH
               
    
              
               
    ; ===========================================================
    ; PHAN KHAI BAO THU TUC
    ; ===========================================================
    
    ; THU TUC HAM XUAT 1 CHUOI RA MAN HINH
    ; Input: 
    ;       - DS: Dia chi cua chuoi can xuat
    ; Output: khong
    XUAT_CHUOI PROC
        MOV AH, 9
        INT 21h
        RET
    XUAT_CHUOI ENDP
    
    ; THU TUC KHOI TAO CHUONG TRINH
    KHOI_TAO_CHUONG_TRINH PROC
        MOV AX, @DATA
        MOV DS, AX
        
        XOR AX, AX
        XOR BX, BX
        XOR CX, CX
        XOR DX, DX
        RET
    KHOI_TAO_CHUONG_TRINH ENDP
    
    ; THU TUC NHAP 1 SO TU BAN PHIM
    ; Input: khong
    ; Output:
    ;       - BL: so nhap tu ban phim
    NHAP_SO PROC
        INPUT1:
            MOV AH, 1
            INT 21h
            
            CMP AL, '0'
            JB INPUT1
            
            CMP AL, '9'
            JA INPUT1
            
            AND AL, 0Fh
            MOV BL, AL
        RET
    NHAP_SO ENDP
    
    ; THU TUC TINH CHU VI
    ; Input:
    ;       - BH: Chieu dai hinh chu nhat
    ;       - BL: Chieu rong hinh chu nhat
    ; Output:
    ;       - AX: CHU VI HINH CHU NHAT
    TINH_CHU_VI PROC
        PUSH BX
        
        ADD BH, BL
        MOV AL, 2
        MUL BH
        
        POP BX
        RET
    TINH_CHU_VI ENDP
    
    ; THU TUC TINH DIEN TICH
    ; Input:
    ;       - BH: Chieu dai hinh chu nhat
    ;       - BL: Chieu rong hinh chu nhat
    ; Output:
    ;       - AX: DIEN TICH HINH CHU NHAT
    TINH_DIEN_TICH PROC
        PUSH BX
        
        MOV AL, BH
        MUL BL
        
        POP BX
        RET
    TINH_DIEN_TICH ENDP
    
    ; THU TUC XUAT 1 SO THAP PHAN
    ; Input:
    ;       - AX: So thap phan can xuat
    XUAT_THAP_PHAN PROC
        MOV BX, 10
        XOR CX, CX
        
        XULY_STACK:
            XOR DX, DX
            DIV BX
            PUSH DX
            INC CX
            
            CMP AX, 0
            JA XULY_STACK
            
        PRINT:
            POP DX
            OR DX, 30h
            MOV AH, 2
            INT 21h
            LOOP PRINT            
        RET
    XUAT_THAP_PHAN ENDP

    
    ; THU TUC DUNG VA THOAT CHUONG TRINH
    THOAT_CHUONG_TRINH PROC
        MOV AH, 9
        LEA DX, END1
        INT 21h
        
        MOV AH, 7
        INT 21h
        
        MOV AH, 4Ch
        INT 21h
        RET
    THOAT_CHUONG_TRINH ENDP
END
