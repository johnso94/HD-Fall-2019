/* example of guard in assembly */

/* format strings for I/O */	
	.section 	.rodata
	.align	2
prompt:	.asciz "Enter two integers x and y: "
	.align	2
scanf_fmt:
	.asciz "%d %d"
	.align	2
wrong_msg:	.asciz "that is wrong\n"
	.align	2
right_msg:	.asciz "that is right\n"

/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 2 local variables
	@ [fp, #-8] is x, first integer variable
	@ [fp, #-12] is y, second integer variable

	ldr	r0, promptP	@ print prompt
	bl	printf
	ldr	r0, scanf_fmtP  @ read values of x and y
	sub	r1, fp, #8
	sub	r2, fp, #12
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]
	ldr r1, [fp, #-12]
	add	r0, r0, r1
	cmp	r0, #7	
	ble	wrong
	ldr r0, [fp, #-8]
	cmp r0, #0
	bgt	wrong
	ldr	r0, right_msgP	@ print less-than/equal-to message
	bl	printf
	b	next

wrong:
	ldr	r0, wrong_msgP	@ otherwise print greater-than message
	ldr	r1, [fp, #-8]	
	ldr	r2, [fp, #-12]	
	bl	printf

next:
	mov	r0, #0		@ assign 0 as return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings */
	.align	2
promptP:
	.word	prompt
scanf_fmtP:
	.word	scanf_fmt	
wrong_msgP:
	.word	wrong_msg
right_msgP:
	.word	right_msg
