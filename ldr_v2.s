.global _start
_start:
    ldr r1, =v
	ldr r0, [r1], #4
	ldr r2, [r1], #4
	add r0, r0, r2
	ldr r2, [r1], #4
	add r0, r0, r2
	ldr r2, [r1]
	add r0, r0, r2

	.data
v: .word 18, 30, 24, 26