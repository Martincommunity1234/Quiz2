section .data
    result dq 0           ; Define Result variable

section .text
    global _start      

_start:
    ; Assign values to x, y, and z
    mov rdi, 10           ; x = 10, first argument in rdi
    mov rsi, 20           ; y = 20, second argument in rsi
    mov rdx, 30           ; z = 30, third argument in rdx
    lea rcx, [result]     ; Load the address of the result variable into rcx (fourth argument)

    ; Call the function
    call add_three        ; call the function

    ; Exit the program
    mov rax, 60       
    xor rdi, rdi        
    syscall           

; Function to add three integers and store the result in the result variable
add_three:
    ; Arguments are passed in rdi, rsi, rdx, rcx
    ; rdi = x
    ; rsi = y
    ; rdx = z
    ; rcx = address of result

    mov rax, rdi          ; move x (rdi) into rax
    add rax, rsi          ; add y (rsi) to rax
    add rax, rdx          ; add z (rdx) to rax
    mov [rcx], rax        ; store the sum in the result variable (address in rcx)

    ret                   ; return from the function
