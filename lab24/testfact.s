/* example of coding an ARM assembly function */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter an integer:  "
input:			@ format string for scanf
	.asciz "%d"
results:			@ format string for printf
	.asciz "The call fact(%d) returns %d\n"

/* REPLACE THIS BY YOUR DEFINITION OF fact() HERE */
	.text
	.align 2
fact:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8

	str r0, [fp, #-8]@stores the value of n
	mov	r1, #1
	cmp	r0, r1
	ble	true
	ldr r0, [fp, #-8]@stores the value of n
	mov	r1, #1
	sub r0, r0, r1
	bl fact
	ldr r1, [fp, #-8]
	mul r0, r0, r1
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}


true:
	mov r0, #1
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}
	


/* main program */
	.text
	.align	2
	.global main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ ADD INLINE DOCUMENTATION
	@ ADD FULL LINE DOCUMENTATION HERE

	ldr	r0, promptP	@ print prompt
	bl	printf

	ldr	r0, inputP	@ read value into x
	sub	r1, fp, #8	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call fact(x)
	bl	fact
	str	r0, [fp, #-12]	@ store return value in local variable ret

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
resultsP:	.word	results	
