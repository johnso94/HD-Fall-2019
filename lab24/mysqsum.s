	.data
	.align 2
prompt:
	.asciz	"Enter an integer   "
input:
	.asciz	"%d"
response:
	.asciz	"The sum of the first %d squares is %d"

	.text
	.align	2

square:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#16

	str	r0, [fp,#-8]
	ldr r1, [fp,#-8]
	mul r0, r0, r1

	sub	sp,fp,#4
	pop	{fp, pc}

	.text
	.align 2
	.global main
main:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#16

    ldr	r0, promptP
	bl	printf
	ldr	r0, inputP
	sub	r1, fp, #8@storing n as [fp, #-8]
	bl	__isoc99_scanf
	mov	r1, #0
	str	r1, [fp, #-12]@storing i as [fp,#-12]
	mov	r2, #0
	str	r2, [fp, #-16]@storing result as [fp,#-16]

	b	check
continueadding:
	ldr r0, [fp, #-12]
	bl	square
	ldr	r1, [fp, #-16]
	add	r1, r0, r1
	str	r1, [fp,#-16]
	mov	r2, #1
	ldr r0, [fp, #-12]
	add	r0, r0, r2
	str	r0, [fp, #-12]
check:
	ldr r0, [fp, #-12]
	ldr	r1, [fp, #-8]
	cmp	r0, r1
	ble	continueadding

	ldr	r0, responseP
	ldr	r1, [fp,#-8]
	ldr	r2, [fp, #-16]
	bl	printf

	sub	sp,fp,#4
	pop	{fp, pc}

promptP:	.word	prompt
inputP:	.word	input
responseP:	.word	response