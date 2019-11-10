.model small
.stack 100h
.data
    MSG1 DB 10,13, 'Nhap vao 1 so >> $'
    MSG2 DB 10,13, 'Chuoi nhi phan tuong ung >> $'
    MSG3 DB 10,13, 'Bam phim bat ky de tiep tuc...$'
.code

; Lay du lieu
mov ax, @data
mov ds, ax


input:  mov ah, 9
        lea dx, MSG1
        int 21h
        
        mov ah, 1
        int 21h
        
        cmp al, '0'
        jb input
        
        cmp al, '9'
        ja input
        
        and al, 0Fh
        mov bl, al

; thong bao ket qua
mov ah, 9
lea dx, msg2
int 21h

; print result in binary:
mov cx, 8
print: mov ah, 2   ; print function.
       mov dl, '0'
       test bl, 10000000b  ; test first bit.
       jz zero
       mov dl, '1'
       
zero:  int 21h
       shl bl, 1
loop print

; print binary suffix:
mov dl, 'b'
int 21h

; Dung chuong trinh xem ket qua
mov ah, 9
lea dx, msg3
int 21h

mov ah, 1
int 21h

mov ah, 4ch
int 21h

end


