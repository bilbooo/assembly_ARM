.global _start
_start:
    ldr r0, =s
	mov r1, #72
	strb r1, [r0]

    .data
s: .string "hello world"