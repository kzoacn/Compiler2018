          global    _start

          section   .text
_start:   mov       rax, 0                  ; system call for write
          mov       rdi, 0                  ; file handle 1 is stdout
          mov       rsi, str            ; address of string to output
          mov       rdx, 2                 ; number of bytes
          syscall                           ; invoke operating system to do the write
          
          mov       rax, 1
          mov       rdi, 1
          mov       rsi, str
          mov       rdx, 2
          syscall
          
          mov       rax, 60                 ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit

          section   .data

          section   .bss
str:      resb      64        
