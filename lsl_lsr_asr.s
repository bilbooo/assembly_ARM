.global _start
_start:
    mov r0, #2                      @ equivale a fare: r2 = r1 + (r0 * 2)
    mov r1, #4
    mov r2, #0
    add r2, r1, r0, lsl #1
    b _end

_end:
    mov r3, #67