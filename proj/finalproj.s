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
	.asciz	"Summary:\n  %d characters\n  %d lines\n  %d non-line characters\n"
result2:
	.asciz	"  %d words\n  %d translations\n"
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
simple_quit:
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

	ldr	r0, [fp, #-12]
	mov	r1, #0
	cmp r0, r1
	bne	next
	ldr	r0, buffP
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov r1, #'a'
	cmp r0, r1
	bge	checkz

next:
	ldr	r0, buffP@this section changes our check to 0 if its a space
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov r1, #' '
	cmp r0, r1
	bne continue
	bl	update_check
	str r0, [fp,#-12]
continue:
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
	add	r9, r9, #1
	ldr	r1, [fp, #-8]
	mov	r2, #1
	add r1, r1, r2
	str	r1, [fp, #-8]
	b check
update_check:
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	mov r0, #0

	b	simple_quit
add_word:@adds one to our count of word
	add	r8, r8, #1
	mov r0, #1
	str r0, [fp, #-12]
	b	continue
checkz:@checks if its less than z
	ldr	r0, buffP
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov r1, #'z'
	cmp	r0,r1
	ble	add_word
	ldr r0, buffP
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov	r1, #'A'
	cmp r0, r1
	bge	checkZ
	b next
checkZ:
	ldr	r0, buffP
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov r1, #'Z'
	cmp	r0,r1
	ble	add_word
	b next

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
	sub r3, r1, r2
	bl	printf
	#add r12, r12, r9
	ldr	r0, result2P
	mov	r1, r8
	mov	r2, r9
	#mov	r1, r12
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
	mov	r9, #0
	#mov r12, #0
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
result2P:	.word	result2
inputP:		.word	input
buffP:		.word	buff
print_summaryP:	.word	print_summary
countP:		.word	count
