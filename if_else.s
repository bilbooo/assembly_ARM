.global _start
_start:
    mov r0, #0
    mov r1, #2
    cmp r0, #0
    bne _else
    add r1, r1, #1
    b _end

_else:
    sub r1, r1, r0

_end:
    mov r2, #67