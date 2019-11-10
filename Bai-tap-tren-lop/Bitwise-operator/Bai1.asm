.MODEL SMALL
.STACK 100h
.DATA

    MSG1 DB 10,13, 'Nhap vao so thu nhat >> $'
    MSG2 DB 10,13, 'Nhap vao so thu hai >> $'
    MSG3 DB 10,13, 'Tong cua 2 so vua nhap la: $'
    MSG4 DB 10,13, 'Bam phim bat ki de tiep tuc...$'
    
    NUM1 DB ?
    NUM2 DB ?

.CODE
    ; Lay dia chi vung du lieu dat vao thanh ghi DS
    MOV AX, @DATA
    MOV DS, AX

    ; Xuat thong bao yeu cau nguoi dung nhap so thu nhat
    MOV AH, 9
    LEA DX, MSG1
    INT 21h
    
    ; Nhap ki tu dau tien
    MOV AH, 1
    INT 21H
    
    ; Chuyen ki tu vua nhap thanh so 
    AND AL, 0Fh
    
    ; Luu ket qua vao bien NUM1
    MOV NUM1, AL
    
    ; Xuat thong bao yeu cau nguoi dung nhap so thu hai
    MOV AH, 9
    LEA DX, MSG2
    INT 21h
    
    ; Nhap ki tu tu thu hai
    MOV AH, 1
    INT 21H
    
    ; Chuyen ki tu vua nhap thanh so
    AND AL, 0Fh
    
    ; Luu ket qua vao bien NUM2
    MOV NUM2, AL                 
    
    ; Xuat thong bao tong 2 so ra man hinh
    MOV AH, 9
    LEA DX, MSG3
    INT 21h
    
    ; Tinh toan va xuat tong ra man hinh
    
    ; Tinh tong 2 so
    MOV AL, NUM1
    ADD AL, NUM2
    
    ; Chuyen so sang ki tu de in ra man hinh
    OR AL, 30h
    
    MOV AH, 2
    MOV DL, AL
    INT 21h
                     
    ; ==================================================
    ; Dung chuong trinh de xem ket qua
    MOV AH, 9
    LEA DX, MSG4
    INT 21h
    
    MOV AH, 1
    INT 21h
    
    ; Thoat chuong trinh
    MOV AH, 4CH
    INT 21h
END