          global    _start

          section   .text
_start:   

          mov       [str],word 98
          mov       [str+1],word 98
          mov       [str+2],word 99
          mov       [str+3],word 10
          mov       [str+4],word 0
          call      pts
          
          mov       rax, 60                 ; system call for exit
          xor       rdi, rdi                ; exit code 0
          syscall                           ; invoke operating system to exit

ptc:      
          mov       [ptc_tmp], rdi
          mov       rax, 1
          mov       rdi, 1
          mov       rsi, str
          mov       rdx, 1
          syscall
          ret
gtc:
          mov       rax, 0
          mov       rdi, 0
          mov       rsi, str
          mov       rdx, 1
          syscall
          mov       rax,[gtc_tmp]
          ret
pts:    ;print str unitl str[i]==0
          mov       r10, 0
pts_L1:   cmp       [str+r10],word 0                 
          jz        pts_L2
          mov       rdi, [str+r10]
          call      ptc
          inc       r10
          jmp       pts_L1
pts_L2:   ret

          section   .data
          
          section   .bss
str:      resb      64      
ptc_tmp:  resb      64
gtc_tmp:  resb      64
