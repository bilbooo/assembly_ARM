@ codice assembly ARMv7 generato dal cross compiler con l'opzione -S


	.arch armv7-a
	.fpu vfpv3-d16
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"fattoriale.c"
	.text
	.align	1
	.global	fattoriale
	.syntax unified
	.thumb
	.thumb_func
	.type	fattoriale, %function
fattoriale:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #1
	bne	.L2
	movs	r3, #1
	b	.L3
.L2:
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	mov	r0, r3
	bl	fattoriale(PLT)
	mov	r2, r0
	ldr	r3, [r7, #4]
	mul	r3, r2, r3
.L3:
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	fattoriale, .-fattoriale
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Numeri negativi non sono accettati\000"
	.align	2
.LC1:
	.ascii	"%d! = %zu\012\000"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [r7]
	adds	r3, r3, #4
	ldr	r3, [r3]
	mov	r0, r3
	bl	atoi(PLT)
	str	r0, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bge	.L5
	ldr	r3, .L7
.LPIC0:
	add	r3, pc
	mov	r0, r3
	bl	puts(PLT)
	movs	r3, #1
	b	.L6
.L5:
	ldr	r0, [r7, #12]
	bl	fattoriale(PLT)
	str	r0, [r7, #8]
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #12]
	ldr	r3, .L7+4
.LPIC1:
	add	r3, pc
	mov	r0, r3
	bl	printf(PLT)
	movs	r3, #0
.L6:
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L8:
	.align	2
.L7:
	.word	.LC0-(.LPIC0+4)
	.word	.LC1-(.LPIC1+4)
	.size	main, .-main
	.ident	"GCC: (Ubuntu 15.3.0-4ubuntu1) 15.3.0"
	.section	.note.GNU-stack,"",%progbits
