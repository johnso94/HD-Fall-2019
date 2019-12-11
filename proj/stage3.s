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
	.asciz	"Summary:\n  %d characters\n  %d lines\n  %d words\n"
print_byte:
	.asciz	"%c"
count:
	.asciz	"There were %d input characters \n"
	/*here is where we define get_trans*/
	.text
	.align	2
/*setting up a branch to close*/
close:
	ldr	r0, [fp,#-8]
	add r6, r0, r6
	#sub	r6, r6, #1
	sub	sp, fp, #4
	pop	{fp, pc}

translate:
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	str	r0, [fp, #-8]
	mov	r0, #0
	mov	r1, #0
	str	r1, [fp, #-12]
check:
	ldr	r0, buffP@this section checks whether its the end of the line
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov	r1, #0
	cmp	r0,r1
	beq	close

	ldr	r0, buffP@this section checks whether its the end of the line
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov r1, #' '
	cmp r0,r1
	beq check_word

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
check_word:
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	add	r8, r8, #1

	sub	sp, fp, #4
	pop	{fp, pc}
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
	mov	r2, r7
	mov	r3, r8
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
	mov r0, #0
	str	r0, [fp, #-8]
	mov	r6, #0
	mov r7, #0
	mov	r8, #0
garden:
	ldr	r0, buffP
	mov	r1, #100
	bl	get_line
	cmp r0, #1
	ble	exit
	add r7, r7, #1
	ldr	r0, [fp, #-8]
    bl  translate
	ldr	r0, print_summaryP
	ldr	r1, buffP
	bl	printf
	b	garden

	b	exit

exit:
	bl summary
	sub	sp,fp,#4
	pop	{fp, pc}

resultP:	.word	result
inputP:		.word	input
buffP:		.word	buff
print_summaryP:	.word	print_summary
countP:		.word	count
