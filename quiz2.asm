section .data
    a dd 5         ; define variable a with value 5
    b dd 10        ; define variable b with value 10
    c dd 2         ; define variable c with value 2
    d dd 3         ; define variable d with value 3
    result dd 0    ; define result variable to store the result

section .text
    global _start

_start:
    ; Load the values of a and b into registers
    mov eax, [a]   ; eax = a
    mov ebx, [b]   ; ebx = b

    ; Perform the first multiplication a * b
    imul ebx       ; eax = eax * ebx (a * b)

    ; Store the result temporarily in a register
    mov esi, eax   ; esi = a * b

    ; Load the values of c and d into registers
    mov eax, [c]   ; eax = c
    mov ebx, [d]   ; ebx = d

    ; Perform the second multiplication c * d
    imul ebx       ; eax = eax * ebx (c * d)

    ; Add the results of the two multiplications
    add eax, esi   ; eax = (a * b) + (c * d)

    ; Store the result in the result variable
    mov [result], eax

    ; Exit the program
    mov eax, 1     ; syscall number for sys_exit
    xor ebx, ebx   ; exit code 0
    int 0x80       ; call kernel
