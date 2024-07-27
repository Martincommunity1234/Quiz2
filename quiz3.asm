section .data
    ; Define the number for which we want to calculate the factorial
    number db 5
    result dd 1 ; We will store the result here (initialized to 1)

section .bss
    ; Uninitialized data section (we won't use it here)

section .text
    global _start

_start:
    ; Load the number into a register
    mov eax, [number]
    
    ; If the number is 0 or 1, the factorial is 1
    cmp eax, 1
    jbe done
    
    ; Initialize the result register
    mov ebx, 1

factorial_loop:
    ; Multiply ebx (result) by eax (current number)
    imul ebx, eax
    
    ; Decrement eax
    dec eax
    
    ; If eax is not zero, repeat the loop
    cmp eax, 1
    ja factorial_loop

done:
    ; Store the result
    mov [result], ebx

    ; Exit the program
    mov eax, 1          ; sys_exit system call
    xor ebx, ebx        ; Return code 0
    int 0x80
