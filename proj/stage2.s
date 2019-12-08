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
result:
	.asciz	"Summary:\n  %d characters\n"
print_byte:
	.asciz	"%c"
count:
	.asciz	"There were %d input characters \n"
	/*here is where we define get_trans*/
	.text
	.align	2
/*setting up a branch to close*/
close:
	ldr	r6, [fp,#-8]
	sub	sp, fp, #4
	pop	{fp, pc}

translate:
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	str	r0, [fp, #-8]
check:
	ldr	r0, buffP@this section checks whether its the end of the line
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov	r1, #0
	cmp	r0,r1
	beq	close

	ldr r0, buffP
	ldr	r1, [fp, #-8]
	bl	get_byte
	cmp	r0, r4
	beq	change

	ldr	r1, [fp, #-8]
	mov	r2, #1
	add r1, r1, r2
	str	r1, [fp, #-8]
	b check
change:
	@ ldr r0, resultP
	@ ldr r1, [fp, #-8]
	@ bl printf
	ldr r0, buffP
	ldr r1, [fp, #-8]
	mov r2, r5
	bl 	put_byte
	ldr	r1, [fp, #-8]
	mov	r2, #1
	add r1, r1, r2
	str	r1, [fp, #-8]
	b check
get_trans:
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	@ ldr	r0, buffP
	@ mov	r1, #0
	@ bl	get_byte
	@ mov	r1, #0
	@ cmp	r0, r1
	@ beq	wrongFormat


	ldr	r0, buffP
	mov	r1, #1
	bl	get_byte
	mov	r1, #' '
	cmp	r0, r1
	bne	wrongFormat

	@ ldr	r0, buffP
	@ mov	r1, #2
	@ bl	get_byte
	@ mov	r1, #0
	@ cmp	r0, r1
	@ bne	wrongFormat

	ldr	r0, buffP
	mov	r1, #3
	bl	get_byte
	mov	r1, #'\n'
	cmp	r0, r1
	bne	wrongFormat

	@ ldr	r0, buffP
	@ mov	r1, #4
	@ bl	get_byte
	@ mov	r1, #0
	@ cmp	r0, r1
	@ bne	wrongFormat

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

summary:
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	ldr	r0, resultP
	mov	r1, r6
	sub	r1, #1
	bl	printf

	b	close
	.text
	.align 2
	.global main
/*here is where we define main*/
main:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#24

	ldr	r0, buffP
	mov	r1, #100
	bl	get_line
	bl	get_trans
	mov r1, #0
	cmp r0,r1
	beq	exit
	ldr	r0, buffP
	mov	r1, #100
	bl	get_line
	mov r0, #0
	str	r0, [fp, #-8]
    bl  translate

	ldr	r0, print_summaryP
	ldr	r1, buffP
	bl	printf

	bl summary

	b	exit

exit:
	sub	sp,fp,#4
	pop	{fp, pc}

resultP:	.word	result
inputP:		.word	input
buffP:		.word	buff
print_summaryP:	.word	print_summary
countP:		.word	count
