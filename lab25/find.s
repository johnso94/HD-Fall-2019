	.data
	.align	2
buff1:	.skip	100

buff2:	.skip	100
	.section	.rodata
	.align	2
prompt1:
	.asciz	"Enter a character:  "
prompt2:
	.asciz	"Enter a line of input:   "
prompt3:
	.asciz	"Indices of the character %s \n"
input:
	.asciz	"%s"
result:
	.asciz	"%d "

	.text
	.align	2
	.global	main
main:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#24

	ldr r0, prompt1P
	bl printf

	ldr	r0, buff1P
	mov	r1,#100
	bl	get_line

	ldr r0, buff1P
	mov r1, #0
	bl	get_byte
	str r0, [fp, #-12]
	
	ldr r0, prompt2P
	bl	printf

	ldr	r0, buff2P
	mov	r1, #100
	bl get_line

	ldr	r0, prompt3P
	ldr	r1, buff1P
	bl printf

	mov r0, #0
	str	r0, [fp, #-8]
	bl	getbytes

	sub	sp,fp,#4
	pop	{fp, pc}

getbytes:
	ldr	r0, buff2P
	ldr	r1, [fp, #-8]
	bl	get_byte
	ldr r1, [fp, #-12]
	cmp	r0,r1
	beq	print
	ldr	r0, buff2P
	ldr	r1, [fp, #-8]
	bl	get_byte
	mov	r1, #0
	cmp	r0,r1
	beq	end
	ldr	r1, [fp, #-8]
	mov	r2, #1
	add r1, r1, r2
	str	r1, [fp, #-8]
	b getbytes
print:
	ldr r0, resultP
	ldr r1, [fp,#-8]
	bl printf
	ldr	r1, [fp, #-8]
	mov	r2, #1
	add r1, r1, r2
	str	r1, [fp, #-8]
	bl getbytes
end:
	sub	sp,fp,#4
	pop	{fp, pc}


prompt1P:	.word	prompt1
prompt2P:	.word	prompt2
prompt3P:	.word	prompt3
resultP:	.word	result
buff1P:		.word	buff1
buff2P:		.word	buff2
