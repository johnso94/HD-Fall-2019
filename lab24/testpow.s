/* example of coding an ARM assembly function */

/* string constants */
	.section .rodata
	.align	2
prompt:			@ format string for printf
	.asciz "Enter two integers:  "
input:			@ format string for scanf
	.asciz "%d %d"
results:			@ format string for printf
	.asciz "The call pow(%d, %d) returns %d\n"

    .data
    .align 2

pow:
    push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#24

	str r0, [fp, #-8]@initial value
	str r0, [fp,#-12]@value being returned
	str	r1, [fp, #-16]@n
	mov	r2, #2
	str	r2, [fp, #-20]@int i
	b	check
continuemultiplying:
	ldr r0, [fp, #-8]
	ldr r1, [fp, #-12]
	mul	r1, r0, r1
	str	r1, [fp, #-12]
	ldr	r1, [fp, #-20]
	mov	r2, #1
	add	r1, r2, r1
	str	r1, [fp, #-20]
	b	check
check:
	ldr r0, [fp, #-16]
	ldr	r1, [fp, #-20]
	cmp	r1, r0
	ble	continuemultiplying

	ldr	r0, [fp, #-12]
	sub	sp,fp,#4
	pop	{fp, pc}

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

	ldr	r0, inputP	@ read values into x and p
	sub	r1, fp, #8	
	sub	r2, fp, #12	
	bl	__isoc99_scanf

	ldr	r0, [fp, #-8]	@ call pow(x, p)
	ldr	r1, [fp, #-12]	@ call pow(x)
	bl	pow
	str	r0, [fp, #-16]	@ store return value in local variable ret

	ldr	r0, resultsP	@ print results
	ldr	r1, [fp, #-8]
	ldr	r2, [fp, #-12]
	ldr	r2, [fp, #-16]
	bl	printf

	mov	r0, #0		@ load return value
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

/* pointer variables for format strings  */
	.align	2
promptP: 	.word	prompt	
inputP:		.word	input	
resultsP:	.word	results	
