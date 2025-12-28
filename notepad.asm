default rel
global main

extern CreateProcessW
extern ExitProcess
extern FindWindowW
extern FindWindowExW
extern SendMessageW
extern Sleep

section .data
appname: dw 'C',':','\','W','i','n','d','o','w','s','\','S','y','s','t','e','m','3','2','\','n','o','t','e','p','a','d','.','e','x','e',0

notepadClass: dw 'N','o','t','e','p','a','d',0
editClass:    dw 'E','d','i','t',0

text: dw 'H','e','l','l','o',' ','f','r','o','m',' ','r','a','w',' ','A','S','M',0

WM_SETTEXT equ 0Ch

startupinfo:
    dd 104
    times 100 db 0

processinfo:
    times 4 dq 0

section .text
main:
    sub rsp, 68h
    lea rcx, [appname]
    xor rdx, rdx
    xor r8, r8
    xor r9, r9

    mov qword [rsp+32], 0
    mov qword [rsp+40], 0
    mov qword [rsp+48], 0
    mov qword [rsp+56], 0
    lea rax, [startupinfo]
    mov qword [rsp+64], rax
    lea rax, [processinfo]
    mov qword [rsp+72], rax

    call CreateProcessW

    mov rcx, 300
    call Sleep

    lea rcx, [notepadClass]
    xor rdx, rdx
    call FindWindowW
    test rax, rax
    jz failed

    mov rcx, rax
    xor rdx, rdx
    lea r8, [editClass]
    xor r9, r9
    call FindWindowExW
    test rax, rax
    jz failed

    mov rcx, rax
    mov rdx, WM_SETTEXT
    xor r8, r8
    lea r9, [text]
    call SendMessageW

    add rsp, 70h

    xor rcx, rcx
    call ExitProcess

failed:
    mov rcx, 1
    call ExitProcess
