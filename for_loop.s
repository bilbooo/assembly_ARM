.global _start
_start:
    mov r0, #0
    mov r1, #0
    ldr r2, =v
    mov r3, #4

_loop:
    cmp r1, r3
    beq _end
    ldr r4, [r2, r1, lsl #2]
    add r0, r0, r4
    add r1, r1, #1
    b _loop

_end:


    .data
v: .word 18, 30, 24, 26