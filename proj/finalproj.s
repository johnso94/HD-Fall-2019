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

	.text
	.align	2
/*setting up a branch to close*/
close:
	ldr	r0, [fp,#-8]
	add r6, r0, r6
	#sub	r6, r6, #1
	sub	sp, fp, #4
	pop	{fp, pc}
/*setting up a branch to just tear down the stack frame */
simple_quit: 
	sub	sp, fp, #4
	pop	{fp, pc}
/*the translate function, sets up a loop to go through the line and translate it */
translate:
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

@[fp,#-8] here describes the index we're currently checking
	str	r0, [fp, #-8]
	mov	r0, #0
	mov	r1, #0
@[fp,#-12] is our marker to see if there has been a word since the last space
	str	r1, [fp, #-12]
check:
	ldr	r0, buffP@this section checks whether its the end of the line
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov	r1, #0
	cmp	r0,r1
	beq	close

	ldr	r0, [fp, #-12]@this section checks if our marker is zero and add 1 to word count if the current byte is a letter
	mov	r1, #0
	cmp r0, r1
	bne	next
	ldr	r0, buffP@this section checks if the current byte is greater than a
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
	bl	update_check@returns zero then goes to line after this
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
change:@this section makes the changes to buffP to translate it
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
update_check:@this is used to return a zero
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
checkz:@you go here after checking if its >= a
	ldr	r0, buffP@this section checks if <= z
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov r1, #'z'
	cmp	r0,r1
	ble	add_word

	ldr r0, buffP@this section checks if >= A
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov	r1, #'A'
	cmp r0, r1
	bge	checkZ
	b next
checkZ:@ you go here after checking if >= A
	ldr	r0, buffP@this section checks if <= Z
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov r1, #'Z'
	cmp	r0,r1
	ble	add_word
	b next

get_trans:@ this fucntion checks if our first line has the right format
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	ldr	r0, buffP@checks first character
	mov	r1, #0
	bl	get_byte
	mov	r1, #0
	cmp	r0, r1
	beq	wrongFormat


	ldr	r0, buffP@checks second character
	mov	r1, #1
	bl	get_byte
	mov	r1, #' '
	cmp	r0, r1
	bne	wrongFormat

	ldr	r0, buffP@checks third character
	mov	r1, #2
	bl	get_byte
	mov	r1, #0
	cmp	r0, r1
	beq	wrongFormat

	ldr	r0, buffP@checks fourth character
	mov	r1, #3
	bl	get_byte
	mov	r1, #'\n'
	cmp	r0, r1
	bne	wrongFormat

	ldr	r0, buffP@this section is setting r4 to be the first character
	mov	r1, #0
	bl	get_byte
	mov	r4, r0

	ldr	r0, buffP@this section is setting r5 to be the next character
	mov	r1, #2
	bl	get_byte
	mov	r5, r0

	mov	r0, #1@returns one so the main function knows that all of the checks passed
	
	b	close

wrongFormat:@returns zero if the function has the wrong format
	mov	r0, #0
	sub	sp,fp,#4
	pop	{fp,pc}

summary:@this section is used to print out the summary at the end
	push	{fp,lr}
	add	fp, sp, #4
	sub	sp, sp, #8

	ldr	r0, resultP@prints the first part of the summary
	mov	r1, r6
	mov	r2, r7
	sub r3, r1, r2
	bl	printf

	#add r12, r12, r9
	ldr	r0, result2P@prints the second part of the summary
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

	ldr	r0, buffP@collects the first line and then checks if it has the right format
	mov	r1, #100
	bl	get_line
	bl	get_trans

	mov r1, #0
	cmp r0,r1
	beq	exit@exits if the first line failed the check in get_trans

	mov r0, #0
	str	r0, [fp, #-8]
	mov	r6, #0@this register is for the number of characters
	mov r7, #0@this register is for the number of lines
	mov	r8, #0@this register is for the number of words
	mov	r9, #0@this register is for the number of translations
	#mov r12, #0
garden:@ this is the section which you loop through to get a new line and tanslate it
@its called garden for some reason I can't remember but thought was funny at the time
	ldr	r0, buffP@gets a new line checks if its empty exits if it is
	mov	r1, #100
	bl	get_line
	cmp r0, #1
	ble	exit

	add r7, r7, #1@adds one to the number of lines
	ldr	r0, [fp, #-8]
    bl  translate
	ldr	r0, print_summaryP@prints out the translated line
	ldr	r1, buffP
	bl	printf
	b	garden

	b	exit

exit:@when no line is given garden goes to this to run summary then quit
	bl summary
	sub	sp,fp,#4
	pop	{fp, pc}

resultP:	.word	result
result2P:	.word	result2
inputP:		.word	input
buffP:		.word	buff
print_summaryP:	.word	print_summary
countP:		.word	count
