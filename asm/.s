	.global	__stack_chk_fail
__stack_chk_fail:
	callr r0
	ret
	.global	__divsi3
__divsi3:
	div r2, r4, r5
	ret
	.global	__modsi3
__modsi3:
	div r2, r4, r5
	mul	r2, r5, r2
	sub	r2, r4, r2
	ret
	.global	reverse
reverse:
	addi	r2, r5, 3
	srli	r2, r2, 2
	movhi	r3, %hiadj(__stack_chk_guard)
	ldw	r3, %lo(__stack_chk_guard)(r3)
	slli	r2, r2, 2
	addi	r27, r27, -12
	stw	r28, 4(r27)
	addi	r28, r27, 4
	stw	ra, 8(r27)
	stw	r3, -4(r28)
	sub	r27, r27, r2
	mov	r8, r27
	addi	r2, r5, -1
	bge	zero, r5, L6
	mov	r3, r4
	mov	r6, r27
	add	r7, r5, r4
L7:
	ldbu	r5, 0(r3)
	addi	r3, r3, 1
	addi	r6, r6, 1
	stb	r5, -1(r6)
	bne	r3, r7, L7
L6:
	blt	r2, zero, L5
L9:
	add	r3, r8, r2
	ldbu	r5, 0(r3)
	add	r3, r4, r2
	addi	r2, r2, -1
	stb	r5, 0(r3)
	cmpnei	r3, r2, -1
	bne	r3, zero, L9
L5:
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r3, -4(r28)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	bne	r3, r2, L14
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
L14:
	call	__stack_chk_fail
	.global	writeString
writeString:
	ldbu	r2, 0(r4)
	andi	r3, r2, 255
	xori	r3, r3, 128
	addi	r3, r3, -128
	beq	r3, zero, L15
L17:
	stb r2, 0x864(r0)
	stb	r2, 0(r4)
	ldbu	r2, 1(r4)
	addi	r4, r4, 1
	andi	r3, r2, 255
	xori	r3, r3, 128
	addi	r3, r3, -128
	bne	r3, zero, L17
L15:
	ret
	.global	fib
fib:
	mov	r2, r4
	beq	r4, zero, L83
	cmpeqi	r3, r4, 1
	bne	r3, zero, L83
	addi	r27, r27, -108
	addi	r3, r4, -2
	stw	r3, 4(r27)
	ldw	r4, 4(r27)
	stw	ra, 104(r27)
	stw	r28, 100(r27)
	stw	r21, 96(r27)
	stw	r20, 92(r27)
	stw	r19, 88(r27)
	stw	r18, 84(r27)
	stw	r17, 80(r27)
	stw	r16, 76(r27)
	stw	zero, 0(r27)
	cmpeqi	r3, r2, 2
	mov	r5, r4
	bne	r3, zero, L26
L93:
	cmpeqi	r3, r4, 1
	addi	r4, r2, -1
	stw	r4, 16(r27)
	bne	r3, zero, L27
	addi	r15, r2, -4
	mov	r14, zero
	mov	r13, r14
	cmpeqi	r2, r5, 2
	mov	r14, r15
	mov	r6, r14
	bne	r2, zero, L31
L92:
	addi	r3, r5, -1
	cmpeqi	r2, r14, 1
	stw	r3, 12(r27)
	bne	r2, zero, L32
	addi	r15, r5, -4
	stw	r13, 20(r27)
	stw	r14, 24(r27)
	cmpeqi	r2, r6, 2
	mov	r5, zero
	mov	r7, r15
	bne	r2, zero, L36
L90:
	addi	r3, r6, -1
	cmpeqi	r2, r15, 1
	stw	r3, 8(r27)
	bne	r2, zero, L37
	addi	r9, r6, -4
	mov	r20, r9
	mov	r6, zero
	stw	r15, 28(r27)
	stw	r5, 32(r27)
	cmpeqi	r2, r7, 2
	mov	r19, r6
	mov	r21, r20
	bne	r2, zero, L41
L88:
	cmpeqi	r2, r20, 1
	addi	r10, r7, -1
	bne	r2, zero, L42
	addi	r8, r7, -4
	mov	r7, zero
	stw	r19, 36(r27)
	mov	r18, r7
	stw	r10, 40(r27)
	stw	r20, 44(r27)
	mov	r19, r8
L43:
	cmpeqi	r2, r21, 2
	mov	r16, r19
	bne	r2, zero, L46
	cmpeqi	r2, r19, 1
	addi	r10, r21, -1
	bne	r2, zero, L47
	addi	r28, r21, -4
	mov	r20, zero
	mov	r7, r18
	mov	r6, r20
	mov	r5, r28
	mov	r8, r19
L48:
	cmpeqi	r3, r16, 2
	mov	r2, r5
	bne	r3, zero, L51
	cmpeqi	r3, r5, 1
	addi	r9, r16, -1
	bne	r3, zero, L52
	addi	r17, r16, -4
	cmpeqi	r3, r2, 2
	mov	r16, zero
	mov	r28, r17
	bne	r3, zero, L56
L94:
	cmpeqi	r3, r17, 1
	addi	r11, r2, -1
	bne	r3, zero, L57
	addi	r19, r2, -4
	cmpeqi	r2, r28, 2
	mov	r18, zero
	mov	r21, r19
	bne	r2, zero, L61
L96:
	cmpeqi	r2, r19, 1
	addi	r28, r28, -1
	bne	r2, zero, L62
	mov	r20, zero
L63:
	addi	r4, r21, -2
	stw	r8, 72(r27)
	stw	r10, 68(r27)
	stw	r9, 64(r27)
	stw	r11, 60(r27)
	stw	r5, 56(r27)
	stw	r6, 52(r27)
	stw	r7, 48(r27)
	addi	r21, r21, -1
	call	fib
	ldw	r7, 48(r27)
	ldw	r6, 52(r27)
	ldw	r5, 56(r27)
	ldw	r11, 60(r27)
	ldw	r9, 64(r27)
	ldw	r10, 68(r27)
	ldw	r8, 72(r27)
	cmpnei	r3, r21, 1
	add	r20, r20, r2
	beq	r21, zero, L64
	bne	r3, zero, L63
	addi	r20, r20, 1
L64:
	add	r18, r18, r20
	bne	r28, zero, L66
L60:
	add	r16, r16, r18
	bne	r11, zero, L67
	add	r6, r6, r16
	bne	r9, zero, L68
L95:
	mov	r18, r7
	mov	r20, r6
	mov	r19, r8
L50:
	add	r18, r18, r20
	bne	r10, zero, L69
	ldw	r19, 36(r27)
	ldw	r10, 40(r27)
	mov	r7, r18
	ldw	r20, 44(r27)
	add	r19, r19, r7
	beq	r10, zero, L87
L70:
	cmpnei	r2, r10, 1
	beq	r2, zero, L41
L39:
	mov	r7, r10
	addi	r20, r20, -1
	cmpeqi	r2, r7, 2
	mov	r21, r20
	beq	r2, zero, L88
L41:
	ldw	r5, 32(r27)
	ldw	r2, 8(r27)
	addi	r6, r19, 1
	ldw	r15, 28(r27)
	add	r5, r5, r6
	beq	r2, zero, L89
L71:
	ldw	r2, 8(r27)
	cmpnei	r2, r2, 1
	beq	r2, zero, L36
L34:
	ldw	r6, 8(r27)
	addi	r15, r15, -1
	mov	r7, r15
	cmpeqi	r2, r6, 2
	beq	r2, zero, L90
L36:
	ldw	r13, 20(r27)
	ldw	r2, 12(r27)
	addi	r5, r5, 1
	ldw	r14, 24(r27)
	add	r13, r13, r5
	beq	r2, zero, L91
L72:
	ldw	r2, 12(r27)
	cmpnei	r2, r2, 1
	beq	r2, zero, L31
L29:
	ldw	r5, 12(r27)
	addi	r14, r14, -1
	mov	r6, r14
	cmpeqi	r2, r5, 2
	beq	r2, zero, L92
L31:
	addi	r14, r13, 1
L30:
	ldw	r2, 0(r27)
	ldw	r3, 16(r27)
	add	r2, r2, r14
	beq	r3, zero, L76
	ldw	r3, 16(r27)
	cmpnei	r3, r3, 1
	beq	r3, zero, L86
L25:
	stw	r2, 0(r27)
	ldw	r2, 4(r27)
	addi	r2, r2, -1
	stw	r2, 4(r27)
	ldw	r2, 16(r27)
	ldw	r4, 4(r27)
	cmpeqi	r3, r2, 2
	mov	r5, r4
	beq	r3, zero, L93
L26:
	ldw	r2, 0(r27)
L86:
	addi	r2, r2, 1
L76:
	ldw	ra, 104(r27)
	ldw	r28, 100(r27)
	ldw	r21, 96(r27)
	ldw	r20, 92(r27)
	ldw	r19, 88(r27)
	ldw	r18, 84(r27)
	ldw	r17, 80(r27)
	ldw	r16, 76(r27)
	addi	r27, r27, 108
	ret
L57:
	addi	r16, r16, 1
L54:
	mov	r2, r11
	addi	r17, r17, -1
	cmpeqi	r3, r2, 2
	mov	r28, r17
	beq	r3, zero, L94
L56:
	addi	r16, r16, 1
L97:
	add	r6, r6, r16
	beq	r9, zero, L95
L68:
	cmpnei	r2, r9, 1
	bne	r2, zero, L49
L51:
	mov	r18, r7
	mov	r19, r8
	addi	r20, r6, 1
	br	L50
L52:
	addi	r6, r6, 1
L49:
	addi	r5, r5, -1
	mov	r16, r9
	br	L48
L69:
	cmpnei	r2, r10, 1
	bne	r2, zero, L44
L46:
	ldw	r19, 36(r27)
	ldw	r10, 40(r27)
	addi	r7, r18, 1
	ldw	r20, 44(r27)
	add	r19, r19, r7
	bne	r10, zero, L70
L87:
	ldw	r5, 32(r27)
	ldw	r2, 8(r27)
	mov	r6, r19
	ldw	r15, 28(r27)
	add	r5, r5, r6
	bne	r2, zero, L71
L89:
	ldw	r13, 20(r27)
	ldw	r2, 12(r27)
	ldw	r14, 24(r27)
	add	r13, r13, r5
	bne	r2, zero, L72
L91:
	mov	r14, r13
	br	L30
L62:
	addi	r18, r18, 1
L59:
	addi	r19, r19, -1
	cmpeqi	r2, r28, 2
	mov	r21, r19
	beq	r2, zero, L96
L61:
	addi	r18, r18, 1
	br	L60
L47:
	addi	r18, r18, 1
L44:
	addi	r19, r19, -1
	mov	r21, r10
	br	L43
L42:
	addi	r19, r19, 1
	br	L39
L37:
	addi	r5, r5, 1
	br	L34
L32:
	addi	r13, r13, 1
	br	L29
L67:
	cmpnei	r2, r11, 1
	bne	r2, zero, L54
	addi	r16, r16, 1
	br	L97
L66:
	cmpnei	r2, r28, 1
	bne	r2, zero, L59
	addi	r18, r18, 1
	br	L60
L27:
	ldw	r2, 0(r27)
	addi	r2, r2, 1
	br	L25
L83:
	ret
	.global	__modsi3
	.global	isPrime
isPrime:
	cmpgei	r2, r4, 2
	beq	r2, zero, L110
	addi	r27, r27, -12
	stw	r17, 4(r27)
	stw	r16, 0(r27)
	stw	ra, 8(r27)
	mov	r17, r4
	movi	r16, 2
	br	L99
L102:
	call	__modsi3
	beq	r2, zero, L101
	addi	r16, r16, 1
L99:
	mov	r4, r17
	call	sqrt
	mov	r5, r16
	mov	r4, r17
	blt	r16, r2, L102
	movi	r2, 1
L98:
	ldw	ra, 8(r27)
	ldw	r17, 4(r27)
	ldw	r16, 0(r27)
	addi	r27, r27, 12
	ret
L101:
	mov	r2, zero
	br	L98
L110:
	mov	r2, zero
	ret
	.global	__umodsi3
	.global	main
main:
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r9, %lo(__stack_chk_guard)(r2)
	movhi	r2, 11565
	addi	r27, r27, -68
	addi	r2, r2, 11565
	stw	r2, 32(r27)
	stw	r2, 36(r27)
	stw	r2, 40(r27)
	movi	r2, 72
	stb	r2, 15(r27)
	movi	r2, 101
	stb	r2, 16(r27)
	movi	r2, 87
	stb	r2, 21(r27)
	movi	r2, 114
	stb	r2, 23(r27)
	movi	r2, 100
	movhi	r6, 11565
	movhi	r5, 10
	movhi	r3, 2628
	stb	r2, 25(r27)
	movi	r2, 33
	movi	r4, 108
	movi	r8, 111
	movi	r7, 32
	addi	r3, r3, 20037
	addi	r6, r6, 11530
	addi	r5, r5, 11565
	stb	r2, 26(r27)
	movi	r2, 44
	stb	r2, 1(r27)
	stw	r3, 4(r27)
	stw	ra, 64(r27)
	stw	r18, 60(r27)
	stw	r17, 56(r27)
	stw	r16, 52(r27)
	stw	r9, 48(r27)
	stw	r6, 28(r27)
	stw	r5, 44(r27)
	stb	r4, 17(r27)
	stb	r4, 18(r27)
	stb	r8, 19(r27)
	stb	r7, 20(r27)
	stb	r8, 22(r27)
	stb	r4, 24(r27)
	stb	zero, 27(r27)
	stb	r7, 2(r27)
	stb	zero, 3(r27)
	stb	zero, 8(r27)
	movi	r2, 72
	addi	r3, r27, 15
L112:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L112
	ldbu	r2, 28(r27)
	addi	r3, r27, 28
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L115
L113:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L113
L115:
	movi	r17, 1
L114:
	cmpnei	r2, r17, 1
	addi	r18, r17, 1
	beq	r2, zero, L123
	movi	r16, 2
	br	L116
L118:
	mov	r5, r16
	mov	r4, r17
	call	__modsi3
	beq	r2, zero, L117
	addi	r16, r16, 1
L116:
	mov	r4, r17
	call	sqrt
	blt	r16, r2, L118
	mov	r4, r17
	addi	r5, r27, 9
	call	itoa
	ldbu	r2, 9(r27)
	addi	r3, r27, 9
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L139
L120:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L120
L139:
	ldbu	r2, 1(r27)
	addi	r3, r27, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L117
L121:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L121
L117:
	cmpnei	r2, r18, 200
	beq	r2, zero, L177
L123:
	mov	r17, r18
	br	L114
L177:
	ldbu	r2, 28(r27)
	andi	r3, r2, 255
	xori	r3, r3, 128
	addi	r3, r3, -128
	beq	r3, zero, L124
	addi	r3, r27, 28
L125:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L125
L124:
	mov	r16, zero
	mov	r18, zero
	mov	r4, zero
L136:
	add	r4, r4, r18
	addi	r5, r27, 9
	call	itoa
	ldbu	r2, 9(r27)
	addi	r3, r27, 9
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L130
L127:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L127
L130:
	ldbu	r2, 1(r27)
	addi	r3, r27, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L129
L128:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L128
L129:
	addi	r16, r16, 1
	cmpnei	r2, r16, 20
	beq	r2, zero, L178
	cmpeqi	r2, r16, 1
	bne	r2, zero, L148
	mov	r17, r16
	mov	r18, zero
L126:
	addi	r4, r17, -2
	call	fib
	addi	r17, r17, -1
	cmpnei	r3, r17, 1
	add	r18, r18, r2
	bne	r3, zero, L126
	movi	r4, 1
	br	L136
L148:
	mov	r18, zero
	movi	r4, 1
	br	L136
L178:
	ldbu	r2, 28(r27)
	addi	r3, r27, 28
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L138
L133:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L133
L138:
	ldbu	r2, 4(r27)
	addi	r3, r27, 4
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L135
L134:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L134
L135:
	br END

	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r3, 48(r27)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	bne	r3, r2, L179
	mov	r2, zero
	ldw	ra, 64(r27)
	ldw	r18, 60(r27)
	ldw	r17, 56(r27)
	ldw	r16, 52(r27)
	addi	r27, r27, 68
	ret
L179:
	call	__stack_chk_fail
	.global	__stack_chk_guard
__stack_chk_guard:
	.word	110371071
END:

.data
		.skip 0xFF7C
.end