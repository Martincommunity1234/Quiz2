section .data
    a dd 5         ; a = 5
    b dd 10        ; b = 10
    c dd 2         ; c = 2 
    d dd 3         ; d = 3
    result dd 0    ; define result variable to store the result

section .text
    global _start

_start:
    ; Load the values of a and b into registers
    mov eax, [a]   ; eax = a
    mov ebx, [b]   ; ebx = b

    ;( a*b)
    imul ebx       ; eax = eax * ebx (a * b)

    ; Store the result temporarily in esi
    mov esi, eax   ; esi = a * b

    ; Load the values of c and d into registers for second half of equation
    mov eax, [c]   ; eax = c
    mov ebx, [d]   ; ebx = d

    ; Perform the second multiplication c * d
    imul ebx       ; eax = eax * ebx (c * d)

    ; Add the results of both multiplcation sides
    add eax, esi   ; eax = (a * b) + (c * d)

    ; Store the result in the result variable (result should be 56)
    mov [result], eax

    ; Exit the program
    mov eax, 1  
    xor ebx, ebx   
    int 0x80       
