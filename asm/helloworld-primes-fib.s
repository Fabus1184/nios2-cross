	.global	pow
pow:
	bge	zero, r5, L4
	mov	r3, zero
	movi	r2, 1
L3:
	addi	r3, r3, 1
	mul	r2, r2, r4
	bne	r5, r3, L3
	ret
L4:
	movi	r2, 1
	ret
	.global	log
log:
	blt	r4, r5, L12
	beq	r4, r5, L13
	movi	r3, 1
	mov	r7, zero
	blt	r4, r3, L15
L11:
	addi	r8, r7, 1
	mov	r2, zero
	movi	r3, 1
L10:
	mov	r6, r2
	mul	r3, r3, r5
	addi	r2, r2, 1
	bne	r7, r6, L10
	mov	r7, r8
	bge	r4, r3, L11
L15:
	addi	r2, r7, -1
	ret
L12:
	mov	r2, zero
	ret
L13:
	movi	r2, 1
	ret
	.global	sqrt
sqrt:
	blt	r4, zero, L18
	addi	r2, r4, -1
	ret
L18:
	movi	r2, -1
	ret
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
	bge	zero, r5, L23
	mov	r3, r4
	mov	r6, r27
	add	r7, r5, r4
L24:
	ldbu	r5, 0(r3)
	addi	r3, r3, 1
	addi	r6, r6, 1
	stb	r5, -1(r6)
	bne	r3, r7, L24
L23:
	blt	r2, zero, L22
L26:
	add	r3, r8, r2
	ldbu	r5, 0(r3)
	add	r3, r4, r2
	addi	r2, r2, -1
	stb	r5, 0(r3)
	cmpnei	r3, r2, -1
	bne	r3, zero, L26
L22:
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r3, -4(r28)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	bne	r3, r2, L31
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
L31:
	call	__stack_chk_fail
	.global	writeString
writeString:
	ldbu	r2, 0(r4)
	andi	r3, r2, 255
	xori	r3, r3, 128
	addi	r3, r3, -128
	beq	r3, zero, L32
L34:
	stb r2, 0x864(r0)
	stb	r2, 0(r4)
	ldbu	r2, 1(r4)
	addi	r4, r4, 1
	andi	r3, r2, 255
	xori	r3, r3, 128
	addi	r3, r3, -128
	bne	r3, zero, L34
L32:
	ret
	.global	fib
fib:
	mov	r2, r4
	beq	r4, zero, L100
	cmpeqi	r3, r4, 1
	bne	r3, zero, L100
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
	bne	r3, zero, L43
L110:
	cmpeqi	r3, r4, 1
	addi	r4, r2, -1
	stw	r4, 16(r27)
	bne	r3, zero, L44
	addi	r15, r2, -4
	mov	r14, zero
	mov	r13, r14
	cmpeqi	r2, r5, 2
	mov	r14, r15
	mov	r6, r14
	bne	r2, zero, L48
L109:
	addi	r3, r5, -1
	cmpeqi	r2, r14, 1
	stw	r3, 12(r27)
	bne	r2, zero, L49
	addi	r15, r5, -4
	stw	r13, 20(r27)
	stw	r14, 24(r27)
	cmpeqi	r2, r6, 2
	mov	r5, zero
	mov	r7, r15
	bne	r2, zero, L53
L107:
	addi	r3, r6, -1
	cmpeqi	r2, r15, 1
	stw	r3, 8(r27)
	bne	r2, zero, L54
	addi	r9, r6, -4
	mov	r20, r9
	mov	r6, zero
	stw	r15, 28(r27)
	stw	r5, 32(r27)
	cmpeqi	r2, r7, 2
	mov	r19, r6
	mov	r21, r20
	bne	r2, zero, L58
L105:
	cmpeqi	r2, r20, 1
	addi	r10, r7, -1
	bne	r2, zero, L59
	addi	r8, r7, -4
	mov	r7, zero
	stw	r19, 36(r27)
	mov	r18, r7
	stw	r10, 40(r27)
	stw	r20, 44(r27)
	mov	r19, r8
L60:
	cmpeqi	r2, r21, 2
	mov	r16, r19
	bne	r2, zero, L63
	cmpeqi	r2, r19, 1
	addi	r10, r21, -1
	bne	r2, zero, L64
	addi	r28, r21, -4
	mov	r20, zero
	mov	r7, r18
	mov	r6, r20
	mov	r5, r28
	mov	r8, r19
L65:
	cmpeqi	r3, r16, 2
	mov	r2, r5
	bne	r3, zero, L68
	cmpeqi	r3, r5, 1
	addi	r9, r16, -1
	bne	r3, zero, L69
	addi	r17, r16, -4
	cmpeqi	r3, r2, 2
	mov	r16, zero
	mov	r28, r17
	bne	r3, zero, L73
L111:
	cmpeqi	r3, r17, 1
	addi	r11, r2, -1
	bne	r3, zero, L74
	addi	r19, r2, -4
	cmpeqi	r2, r28, 2
	mov	r18, zero
	mov	r21, r19
	bne	r2, zero, L78
L113:
	cmpeqi	r2, r19, 1
	addi	r28, r28, -1
	bne	r2, zero, L79
	mov	r20, zero
L80:
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
	beq	r21, zero, L81
	bne	r3, zero, L80
	addi	r20, r20, 1
L81:
	add	r18, r18, r20
	bne	r28, zero, L83
L77:
	add	r16, r16, r18
	bne	r11, zero, L84
	add	r6, r6, r16
	bne	r9, zero, L85
L112:
	mov	r18, r7
	mov	r20, r6
	mov	r19, r8
L67:
	add	r18, r18, r20
	bne	r10, zero, L86
	ldw	r19, 36(r27)
	ldw	r10, 40(r27)
	mov	r7, r18
	ldw	r20, 44(r27)
	add	r19, r19, r7
	beq	r10, zero, L104
L87:
	cmpnei	r2, r10, 1
	beq	r2, zero, L58
L56:
	mov	r7, r10
	addi	r20, r20, -1
	cmpeqi	r2, r7, 2
	mov	r21, r20
	beq	r2, zero, L105
L58:
	ldw	r5, 32(r27)
	ldw	r2, 8(r27)
	addi	r6, r19, 1
	ldw	r15, 28(r27)
	add	r5, r5, r6
	beq	r2, zero, L106
L88:
	ldw	r2, 8(r27)
	cmpnei	r2, r2, 1
	beq	r2, zero, L53
L51:
	ldw	r6, 8(r27)
	addi	r15, r15, -1
	mov	r7, r15
	cmpeqi	r2, r6, 2
	beq	r2, zero, L107
L53:
	ldw	r13, 20(r27)
	ldw	r2, 12(r27)
	addi	r5, r5, 1
	ldw	r14, 24(r27)
	add	r13, r13, r5
	beq	r2, zero, L108
L89:
	ldw	r2, 12(r27)
	cmpnei	r2, r2, 1
	beq	r2, zero, L48
L46:
	ldw	r5, 12(r27)
	addi	r14, r14, -1
	mov	r6, r14
	cmpeqi	r2, r5, 2
	beq	r2, zero, L109
L48:
	addi	r14, r13, 1
L47:
	ldw	r2, 0(r27)
	ldw	r3, 16(r27)
	add	r2, r2, r14
	beq	r3, zero, L93
	ldw	r3, 16(r27)
	cmpnei	r3, r3, 1
	beq	r3, zero, L103
L42:
	stw	r2, 0(r27)
	ldw	r2, 4(r27)
	addi	r2, r2, -1
	stw	r2, 4(r27)
	ldw	r2, 16(r27)
	ldw	r4, 4(r27)
	cmpeqi	r3, r2, 2
	mov	r5, r4
	beq	r3, zero, L110
L43:
	ldw	r2, 0(r27)
L103:
	addi	r2, r2, 1
L93:
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
L74:
	addi	r16, r16, 1
L71:
	mov	r2, r11
	addi	r17, r17, -1
	cmpeqi	r3, r2, 2
	mov	r28, r17
	beq	r3, zero, L111
L73:
	addi	r16, r16, 1
L114:
	add	r6, r6, r16
	beq	r9, zero, L112
L85:
	cmpnei	r2, r9, 1
	bne	r2, zero, L66
L68:
	mov	r18, r7
	mov	r19, r8
	addi	r20, r6, 1
	br	L67
L69:
	addi	r6, r6, 1
L66:
	addi	r5, r5, -1
	mov	r16, r9
	br	L65
L86:
	cmpnei	r2, r10, 1
	bne	r2, zero, L61
L63:
	ldw	r19, 36(r27)
	ldw	r10, 40(r27)
	addi	r7, r18, 1
	ldw	r20, 44(r27)
	add	r19, r19, r7
	bne	r10, zero, L87
L104:
	ldw	r5, 32(r27)
	ldw	r2, 8(r27)
	mov	r6, r19
	ldw	r15, 28(r27)
	add	r5, r5, r6
	bne	r2, zero, L88
L106:
	ldw	r13, 20(r27)
	ldw	r2, 12(r27)
	ldw	r14, 24(r27)
	add	r13, r13, r5
	bne	r2, zero, L89
L108:
	mov	r14, r13
	br	L47
L79:
	addi	r18, r18, 1
L76:
	addi	r19, r19, -1
	cmpeqi	r2, r28, 2
	mov	r21, r19
	beq	r2, zero, L113
L78:
	addi	r18, r18, 1
	br	L77
L64:
	addi	r18, r18, 1
L61:
	addi	r19, r19, -1
	mov	r21, r10
	br	L60
L59:
	addi	r19, r19, 1
	br	L56
L54:
	addi	r5, r5, 1
	br	L51
L49:
	addi	r13, r13, 1
	br	L46
L84:
	cmpnei	r2, r11, 1
	bne	r2, zero, L71
	addi	r16, r16, 1
	br	L114
L83:
	cmpnei	r2, r28, 1
	bne	r2, zero, L76
	addi	r18, r18, 1
	br	L77
L44:
	ldw	r2, 0(r27)
	addi	r2, r2, 1
	br	L42
L100:
	ret
	.global	__divsi3
	.global	__modsi3
	.global	itoa
itoa:
	addi	r27, r27, -24
	stw	r20, 16(r27)
	stw	ra, 20(r27)
	stw	r19, 12(r27)
	stw	r18, 8(r27)
	stw	r17, 4(r27)
	stw	r16, 0(r27)
	cmplti	r2, r4, 10
	mov	r20, r4
	bne	r2, zero, L121
	cmpeqi	r2, r4, 10
	bne	r2, zero, L122
	mov	r4, zero
L118:
	mov	r17, r4
	mov	r2, zero
	addi	r4, r4, 1
	movi	r3, 1
L117:
	mov	r6, r2
	muli	r3, r3, 10
	addi	r2, r2, 1
	bne	r6, r17, L117
	bge	r20, r3, L118
L116:
	add	r18, r5, r17
	mov	r19, r18
	mov	r16, zero
	movi	r5, 1
L119:
	mov	r4, r20
	call	__divsi3
	movi	r5, 10
	mov	r4, r2
	call	__modsi3
	addi	r2, r2, 48
	stb	r2, 0(r19)
	addi	r6, r16, 1
	blt	r17, r6, L128
	movi	r5, 1
	mov	r2, zero
L120:
	mov	r3, r2
	muli	r5, r5, 10
	addi	r2, r2, 1
	bne	r16, r3, L120
	addi	r19, r19, -1
	mov	r16, r6
	br	L119
L128:
	stb	zero, 1(r18)
	ldw	ra, 20(r27)
	ldw	r20, 16(r27)
	ldw	r19, 12(r27)
	ldw	r18, 8(r27)
	ldw	r17, 4(r27)
	ldw	r16, 0(r27)
	addi	r27, r27, 24
	ret
L121:
	mov	r17, zero
	br	L116
L122:
	movi	r17, 1
	br	L116
	.global	isPrime
isPrime:
	cmplti	r2, r4, 2
	bne	r2, zero, L133
	addi	r27, r27, -16
	stw	r18, 8(r27)
	addi	r18, r4, -1
	stw	r17, 4(r27)
	stw	ra, 12(r27)
	stw	r16, 0(r27)
	cmplti	r2, r18, 3
	mov	r17, r4
	bne	r2, zero, L134
	andi	r2, r4, 1
	beq	r2, zero, L135
	movi	r16, 2
	br	L131
L132:
	call	__modsi3
	beq	r2, zero, L129
L131:
	addi	r16, r16, 1
	mov	r4, r17
	mov	r5, r16
	bne	r16, r18, L132
L134:
	movi	r2, 1
L129:
	ldw	ra, 12(r27)
	ldw	r18, 8(r27)
	ldw	r17, 4(r27)
	ldw	r16, 0(r27)
	addi	r27, r27, 16
	ret
L133:
	mov	r2, zero
	ret
L135:
	mov	r2, zero
	br	L129
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
L144:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L144
	ldbu	r2, 28(r27)
	addi	r3, r27, 28
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L147
L145:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L145
L147:
	movi	r17, 1
	mov	r18, zero
L146:
	cmpnei	r2, r17, 1
	beq	r2, zero, L156
	cmpltui	r2, r18, 3
	bne	r2, zero, L149
	andi	r2, r17, 1
	beq	r2, zero, L150
	movi	r16, 2
	br	L151
L152:
	mov	r5, r16
	mov	r4, r17
	call	__modsi3
	beq	r2, zero, L150
L151:
	addi	r16, r16, 1
	bne	r16, r18, L152
L149:
	mov	r4, r17
	addi	r5, r27, 9
	call	itoa
	ldbu	r2, 9(r27)
	addi	r3, r27, 9
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L172
L153:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L153
L172:
	ldbu	r2, 1(r27)
	addi	r3, r27, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L150
L154:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L154
L150:
	cmpnei	r2, r17, 199
	beq	r2, zero, L211
L156:
	addi	r18, r18, 1
	addi	r17, r17, 1
	br	L146
L211:
	ldbu	r2, 28(r27)
	andi	r3, r2, 255
	xori	r3, r3, 128
	addi	r3, r3, -128
	beq	r3, zero, L157
	addi	r3, r27, 28
L158:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L158
L157:
	mov	r16, zero
	mov	r18, zero
	mov	r4, zero
L169:
	add	r4, r4, r18
	addi	r5, r27, 9
	call	itoa
	ldbu	r2, 9(r27)
	addi	r3, r27, 9
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L163
L160:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L160
L163:
	ldbu	r2, 1(r27)
	addi	r3, r27, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L162
L161:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L161
L162:
	addi	r16, r16, 1
	cmpnei	r2, r16, 20
	beq	r2, zero, L212
	cmpeqi	r2, r16, 1
	bne	r2, zero, L180
	mov	r17, r16
	mov	r18, zero
L159:
	addi	r4, r17, -2
	call	fib
	addi	r17, r17, -1
	cmpnei	r3, r17, 1
	add	r18, r18, r2
	bne	r3, zero, L159
	movi	r4, 1
	br	L169
L180:
	mov	r18, zero
	movi	r4, 1
	br	L169
L212:
	ldbu	r2, 28(r27)
	addi	r3, r27, 28
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L171
L166:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L166
L171:
	ldbu	r2, 4(r27)
	addi	r3, r27, 4
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, L168
L167:
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldbu	r2, 1(r3)
	addi	r3, r3, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, L167
L168:
	br END

	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r3, 48(r27)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	bne	r3, r2, L213
	mov	r2, zero
	ldw	ra, 64(r27)
	ldw	r18, 60(r27)
	ldw	r17, 56(r27)
	ldw	r16, 52(r27)
	addi	r27, r27, 68
	ret
L213:
	call	__stack_chk_fail
	.global	__stack_chk_guard
__stack_chk_guard:
	.word	110371071
END:

.data
		.skip 0xFF7C
.end