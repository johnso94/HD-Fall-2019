/* example of coding an ARM assembly function */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter three integers:  "
input:			@ format string for scanf
	.asciz "%d %d %d"
results1:			@ format string for printf
	.asciz "The call prodplus(%d,%d,%d) "
results2:			@ format string for printf
	.asciz "returns %d\n"

/* REPLACE THIS BY YOUR DEFINITION OF prodplus() HERE */

	.text
	.align 2
prodplus:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#16
	str	r0, [fp,#-8]
	str	r1, [fp, #-12]
	mul	r0,r0,r1
	add	r0,r0,r2
	sub	sp,fp,#4
	pop	{fp,pc}
	
/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #16	@ ADD INLINE DOCUMENTATION
	@ ADD FULL LINE DOCUMENTATION HERE

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read values into x, y, and z
	sub	r1, fp, #8	
	sub	r2, fp, #12	
	sub	r3, fp, #16	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call prodplus(x, y, z)
	ldr	r1, [fp, #-12]
	ldr	r2, [fp, #-16]
	bl	prodplus
	str	r0, [fp, #-20]	@ store return value in local variable ret

	ldr	r0, results1P	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r3, [fp, #-16]
	bl	printf
	ldr	r0, results2P
	ldr	r1, [fp, #-20]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
results1P:	.word	results1	
results2P:	.word	results2	
