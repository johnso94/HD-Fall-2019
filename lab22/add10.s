	.section	.rodata
	.align 2

prompt:
	.asciz "Enter an integer:  "
input:
	.asciz "%d"
results:
	.asciz "Ten times %d is %d\n"

	.text
	.align 2
	.global main
main:
	push	{fp, lr}
	add 	fp, sp, #4
	sub	sp,sp, #12

	ldr	r0, promptP
	bl	printf

	ldr	r0, inputP
	sub	r1, fp, #8
	bl	__isoc99_scanf

	ldr	r2, [fp, #-8]
	mov	r3, #10
	mul	r1, r2, r3
	str	r1, [fp, #-12]

	ldr	r0, resultsP
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf

	mov	r0, #0
	sub	sp, fp, #4
	pop	{fp, pc}

/* pointer variables for format string */
	.align 2
promptP:		.word	prompt
inputP:		.word	input
resultsP:		.word	results
