	.data
	.align	2
buff:	.skip	100

	.section	.rodata
	.align	2
prompt:
	.asciz	"Enter an integer   "
input:
	.asciz	"%s"
print_summary:
	.asciz	"%s"
count:
	.asciz	"There were %d input characters \n"
	/*here is where we define get_trans*/
	.text
	.align	2
/*setting up a branch to close*/
close:
	sub	sp, fp, #4
	pop	{fp, pc}
translate:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#24

	ldr	r0, buffP
	mov	r1, #100
	bl	get_line
	str	r0, [fp, #-8]

	bl	get_trans
	bl	print_dec

	ldr	r0, buffP
	mov	r1, #100
	bl	get_line
	str	r0, [fp, #-8]
	
	ldr	r0, countP
	ldr	r1, [fp, #-8]
	bl	printf
	
	ldr	r0, buffP
	mov	r1, #0
	mov	r2, #'*'
	bl	put_byte

	sub	sp,fp,#4
	pop	{fp, pc}

get_trans:
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	ldr	r0, buffP
	mov	r1, #1
	bl	get_byte
	mov	r1, #' '
	cmp	r0, r1
	bne	wrongFormat

	ldr	r0, buffP
	mov	r1, #3
	bl	get_byte
	mov	r1, #'\n'
	cmp	r0, r1
	bne	wrongFormat

	ldr	r0, buffP
	mov	r1, #4
	bl	get_byte
	mov	r1, #0
	cmp	r0, r1
	bne	wrongFormat

	ldr	r0, buffP
	mov	r1, #0
	bl	get_byte
	mov	r4, r0

	ldr	r0, buffP
	mov	r1, #2
	bl	get_byte
	mov	r5, r0

	mov	r0, #1
	
	b	close

wrongFormat:
	mov	r0, #0
	sub	sp,fp,#4
	pop	{fp,pc}

	.text
	.align 2
	.global main
/*here is where we define main*/
main:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#24

    bl  translate

	ldr	r0, print_summaryP
	ldr	r1, buffP
	bl	printf

	sub	sp,fp,#4
	pop	{fp, pc}


print_summaryP:	.word	print_summary
buffP:		.word	buff
countP:		.word	count
