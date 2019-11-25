	.data
	.align	2
buff:	.skip	100

	.section	.rodata
	.align	2
prompt:
	.asciz	"Enter an integer   "
input:
	.asciz	"%s"
result:
	.asciz	"%s"

	.text
	.align 2
	.global main
main:
	push	{fp,lr}
	add	fp,sp,#4
	sub	sp,sp,#24

	ldr	r0, buffP
	mov	r1, #100
	bl	get_line

	ldr	r0, buffP
	mov	r1, #1
	mov	r2, #'X'
	bl	put_byte

	ldr	r0, resultP
	ldr	r1, buffP
	bl	printf

	sub	sp,fp,#4
	pop	{fp, pc}


resultP:	.word	result
buffP:		.word	buff
