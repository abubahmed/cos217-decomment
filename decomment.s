	.arch armv8-a
	.file	"decomment.c"
	.text
	.global	typeToAccept
	.section	.rodata
	.align	3
	.type	typeToAccept, %object
	.size	typeToAccept, 32
typeToAccept:
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	0
	.word	1
	.word	1
	.global	lastCommentStartLine
	.data
	.align	2
	.type	lastCommentStartLine, %object
	.size	lastCommentStartLine, 4
lastCommentStartLine:
	.word	-1
	.global	currentLine
	.align	2
	.type	currentLine, %object
	.size	currentLine, 4
currentLine:
	.word	1
	.text
	.align	2
	.global	handleNormalState
	.type	handleNormalState, %function
handleNormalState:
.LFB0:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	wzr, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L2
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L3
.L2:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L4
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L3
.L4:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L5
	mov	w0, 5
	str	w0, [sp, 44]
	b	.L3
.L5:
	ldr	w0, [sp, 28]
	bl	putchar
.L3:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE0:
	.size	handleNormalState, .-handleNormalState
	.align	2
	.global	handleInStringState
	.type	handleInStringState, %function
handleInStringState:
.LFB1:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 1
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L8
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
	b	.L9
.L8:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L10
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 3
	str	w0, [sp, 44]
	b	.L9
.L10:
	ldr	w0, [sp, 28]
	bl	putchar
.L9:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1:
	.size	handleInStringState, .-handleInStringState
	.align	2
	.global	handleInCharState
	.type	handleInCharState, %function
handleInCharState:
.LFB2:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 2
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L13
	ldr	w0, [sp, 28]
	bl	putchar
	str	wzr, [sp, 44]
	b	.L14
.L13:
	ldr	w0, [sp, 28]
	cmp	w0, 92
	bne	.L15
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 4
	str	w0, [sp, 44]
	b	.L14
.L15:
	ldr	w0, [sp, 28]
	bl	putchar
.L14:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2:
	.size	handleInCharState, .-handleInCharState
	.align	2
	.global	handleInEscapeStringState
	.type	handleInEscapeStringState, %function
handleInEscapeStringState:
.LFB3:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 1
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE3:
	.size	handleInEscapeStringState, .-handleInEscapeStringState
	.align	2
	.global	handleInEscapeCharState
	.type	handleInEscapeCharState, %function
handleInEscapeCharState:
.LFB4:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 2
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE4:
	.size	handleInEscapeCharState, .-handleInEscapeCharState
	.align	2
	.global	handleMaybeCommentState
	.type	handleMaybeCommentState, %function
handleMaybeCommentState:
.LFB5:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	str	wzr, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L22
	mov	w0, 32
	bl	putchar
	adrp	x0, currentLine
	add	x0, x0, :lo12:currentLine
	ldr	w1, [x0]
	adrp	x0, lastCommentStartLine
	add	x0, x0, :lo12:lastCommentStartLine
	str	w1, [x0]
	mov	w0, 6
	str	w0, [sp, 44]
	b	.L23
.L22:
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L24
	mov	w0, 47
	bl	putchar
	mov	w0, 5
	str	w0, [sp, 44]
	b	.L23
.L24:
	ldr	w0, [sp, 28]
	cmp	w0, 34
	bne	.L25
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L23
.L25:
	ldr	w0, [sp, 28]
	cmp	w0, 39
	bne	.L26
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
	mov	w0, 2
	str	w0, [sp, 44]
	b	.L23
.L26:
	mov	w0, 47
	bl	putchar
	ldr	w0, [sp, 28]
	bl	putchar
.L23:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE5:
	.size	handleMaybeCommentState, .-handleMaybeCommentState
	.align	2
	.global	handleInCommentState
	.type	handleInCommentState, %function
handleInCommentState:
.LFB6:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 6
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L29
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L30
.L29:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L30
	mov	w0, 10
	bl	putchar
.L30:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE6:
	.size	handleInCommentState, .-handleInCommentState
	.align	2
	.global	handleMaybeEndCommentState
	.type	handleMaybeEndCommentState, %function
handleMaybeEndCommentState:
.LFB7:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	mov	w0, 6
	str	w0, [sp, 44]
	ldr	w0, [sp, 28]
	cmp	w0, 47
	bne	.L33
	str	wzr, [sp, 44]
	b	.L34
.L33:
	ldr	w0, [sp, 28]
	cmp	w0, 42
	bne	.L35
	mov	w0, 7
	str	w0, [sp, 44]
	b	.L34
.L35:
	ldr	w0, [sp, 28]
	cmp	w0, 10
	bne	.L36
	mov	w0, 10
	bl	putchar
	b	.L34
.L36:
	mov	w0, 6
	str	w0, [sp, 44]
.L34:
	ldr	w0, [sp, 44]
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE7:
	.size	handleMaybeEndCommentState, .-handleMaybeEndCommentState
	.section	.rodata
	.align	3
.LC0:
	.string	"Error: line %d: unterminated comment\n"
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB8:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	wzr, [sp, 28]
	b	.L39
.L49:
	ldr	w0, [sp, 24]
	cmp	w0, 10
	bne	.L40
	adrp	x0, currentLine
	add	x0, x0, :lo12:currentLine
	ldr	w0, [x0]
	add	w1, w0, 1
	adrp	x0, currentLine
	add	x0, x0, :lo12:currentLine
	str	w1, [x0]
.L40:
	ldr	w0, [sp, 28]
	cmp	w0, 7
	beq	.L41
	ldr	w0, [sp, 28]
	cmp	w0, 7
	bhi	.L39
	ldr	w0, [sp, 28]
	cmp	w0, 6
	beq	.L42
	ldr	w0, [sp, 28]
	cmp	w0, 6
	bhi	.L39
	ldr	w0, [sp, 28]
	cmp	w0, 5
	beq	.L43
	ldr	w0, [sp, 28]
	cmp	w0, 5
	bhi	.L39
	ldr	w0, [sp, 28]
	cmp	w0, 4
	beq	.L44
	ldr	w0, [sp, 28]
	cmp	w0, 4
	bhi	.L39
	ldr	w0, [sp, 28]
	cmp	w0, 3
	beq	.L45
	ldr	w0, [sp, 28]
	cmp	w0, 3
	bhi	.L39
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L46
	ldr	w0, [sp, 28]
	cmp	w0, 2
	bhi	.L39
	ldr	w0, [sp, 28]
	cmp	w0, 0
	beq	.L47
	ldr	w0, [sp, 28]
	cmp	w0, 1
	beq	.L48
	b	.L39
.L47:
	ldr	w0, [sp, 24]
	bl	handleNormalState
	str	w0, [sp, 28]
	b	.L39
.L48:
	ldr	w0, [sp, 24]
	bl	handleInStringState
	str	w0, [sp, 28]
	b	.L39
.L46:
	ldr	w0, [sp, 24]
	bl	handleInCharState
	str	w0, [sp, 28]
	b	.L39
.L45:
	ldr	w0, [sp, 24]
	bl	handleInEscapeStringState
	str	w0, [sp, 28]
	b	.L39
.L44:
	ldr	w0, [sp, 24]
	bl	handleInEscapeCharState
	str	w0, [sp, 28]
	b	.L39
.L43:
	ldr	w0, [sp, 24]
	bl	handleMaybeCommentState
	str	w0, [sp, 28]
	b	.L39
.L42:
	ldr	w0, [sp, 24]
	bl	handleInCommentState
	str	w0, [sp, 28]
	b	.L39
.L41:
	ldr	w0, [sp, 24]
	bl	handleMaybeEndCommentState
	str	w0, [sp, 28]
	nop
.L39:
	bl	getchar
	str	w0, [sp, 24]
	ldr	w0, [sp, 24]
	cmn	w0, #1
	bne	.L49
	ldr	w0, [sp, 28]
	cmp	w0, 5
	bne	.L50
	mov	w0, 47
	bl	putchar
.L50:
	adrp	x0, typeToAccept
	add	x0, x0, :lo12:typeToAccept
	ldr	w1, [sp, 28]
	ldr	w0, [x0, x1, lsl 2]
	cmp	w0, 0
	beq	.L51
	cmp	w0, 1
	beq	.L52
	b	.L57
.L51:
	mov	w0, 0
	b	.L54
.L52:
	ldr	w0, [sp, 28]
	cmp	w0, 6
	beq	.L55
	ldr	w0, [sp, 28]
	cmp	w0, 7
	bne	.L56
.L55:
	adrp	x0, stderr
	add	x0, x0, :lo12:stderr
	ldr	x3, [x0]
	adrp	x0, lastCommentStartLine
	add	x0, x0, :lo12:lastCommentStartLine
	ldr	w0, [x0]
	mov	w2, w0
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	mov	x0, x3
	bl	fprintf
.L56:
	mov	w0, 1
	b	.L54
.L57:
	mov	w0, 1
.L54:
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE8:
	.size	main, .-main
	.ident	"GCC: (GNU) 11.5.0 20240719 (Red Hat 11.5.0-5)"
	.section	.note.GNU-stack,"",@progbits
