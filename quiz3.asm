section .data
    ; Calculating factorial variables
    number db 5 ; the factorial number is 5
    result dd 0 ; result stored here

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
    ; Multiply ebx (result) by eax (current #)
    imul ebx, eax
    
    ; Decrement eax
    dec eax
    
    ; As long as eax isn't 0, the loop is repeated
    cmp eax, 1
    ja factorial_loop

done:
    ; Store the result
    mov [result], ebx

    ; Exit the program
    mov eax, 1      
    xor ebx, ebx      
    int 0x80
