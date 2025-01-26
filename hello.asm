; macOS x86 (32-bit) Hello World
; Build with: nasm -f macho hello.asm
; Link with: ld -macosx_version_min 10.7.0 -o hello hello.o

global start
section .data
    msg db 'Hello, World!',0xa  ; Message with Unix newline
    len equ $ - msg             ; Calculate message length

section .text
start:
    push    dword len          ; Length of message
    push    dword msg          ; Address of message
    push    dword 1            ; File descriptor (stdout)
    mov     eax, 4            ; System call number (BSD write)
    sub     esp, 4            ; Align stack
    int     0x80              ; Invoke syscall
    add     esp, 16           ; Clean up stack

    push    dword 0            ; Exit status 0
    mov     eax, 1            ; System call number (BSD exit)
    sub     esp, 4            ; Align stack
    int     0x80              ; Invoke syscall
