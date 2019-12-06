	.data
	.align	2
prompt:
	.asciz	"Enter a digit  "
scanf_fmt:
	.asciz "%d"
result:
    .asciz  "isdigit(%d) returned %d"

/* main program */
	.text
	.align	2
	.global	main
main:
	push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 2 local variables

    ldr	r0, promptP	@ print prompt
	bl	printf
	ldr	r0, scanf_fmtP  @ read value of x
    sub r1, fp, #8
	bl	__isoc99_scanf

    ldr r0, [fp,#-8]
    bl  isdigit
    str r0, [fp, #-12]

    ldr r0, resultP
    ldr r1, [fp, #-8]
    ldr r2, [fp, #-12]
    bl printf
    sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}
isdigit:
    push	{fp, lr}	@ setup stack frame
	add	fp, sp, #4
	sub	sp, sp, #8	@ #8 for 2 local variables

    str r0, [fp, #-8]
    mov r1, #48
    cmp r0, r1
    blt not
    ldr r0, [fp,#-8]
    mov r1, #57
    cmp r0, r1
    bgt not
    
    mov r0, #1
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}
not:
    mov r0, #0
	sub	sp, fp, #4	@ tear down stack frame
	pop	{fp, pc}

	.align	2
promptP:
	.word	prompt
scanf_fmtP:
	.word	scanf_fmt	
resultP:
	.word	result