	.file	"test.c"
	.section	.text
	.align	2
	.global	__divsi3
	.type	__divsi3, @function
__divsi3:
#APP
#  5 "test.c" 1
	div r2, r4, r5
#  0 "" 2
#NO_APP
	ret
	.size	__divsi3, .-__divsi3
	.align	2
	.global	__modsi3
	.type	__modsi3, @function
__modsi3:
#APP
#  5 "test.c" 1
	div r2, r4, r5
#  0 "" 2
#NO_APP
	mul	r2, r5, r2
	sub	r2, r4, r2
	ret
	.size	__modsi3, .-__modsi3
	.align	2
	.global	__stack_chk_fail
	.type	__stack_chk_fail, @function
__stack_chk_fail:
#APP
#  17 "test.c" 1
	callr r0
#  0 "" 2
#NO_APP
	ret
	.size	__stack_chk_fail, .-__stack_chk_fail
	.align	2
	.global	pow
	.type	pow, @function
pow:
	bge	zero, r5, .L8
	mov	r3, zero
	movi	r2, 1
.L7:
	addi	r3, r3, 1
	mul	r2, r2, r4
	bne	r5, r3, .L7
	ret
.L8:
	movi	r2, 1
	ret
	.size	pow, .-pow
	.align	2
	.global	log
	.type	log, @function
log:
	blt	r4, r5, .L15
	beq	r4, r5, .L16
	movi	r3, 1
	mov	r7, zero
	blt	r4, r3, .L18
.L14:
	addi	r8, r7, 1
	mov	r2, zero
	movi	r3, 1
.L13:
	mov	r6, r2
	mul	r3, r3, r5
	addi	r2, r2, 1
	bne	r7, r6, .L13
	mov	r7, r8
	bge	r4, r3, .L14
.L18:
	addi	r2, r7, -1
	ret
.L15:
	mov	r2, zero
	ret
.L16:
	movi	r2, 1
	ret
	.size	log, .-log
	.align	2
	.global	reverse
	.type	reverse, @function
reverse:
	addi	r2, r5, 3
	srli	r2, r2, 2
	movhi	r3, %hiadj(__stack_chk_guard)
	ldw	r3, %lo(__stack_chk_guard)(r3)
	slli	r2, r2, 2
	addi	sp, sp, -12
	stw	fp, 4(sp)
	addi	fp, sp, 4
	stw	ra, 8(sp)
	stw	r3, -4(fp)
	sub	sp, sp, r2
	mov	r8, sp
	addi	r2, r5, -1
	bge	zero, r5, .L20
	mov	r3, r4
	mov	r6, sp
	add	r7, r5, r4
.L21:
	ldbu	r5, 0(r3)
	addi	r3, r3, 1
	addi	r6, r6, 1
	stb	r5, -1(r6)
	bne	r3, r7, .L21
.L20:
	blt	r2, zero, .L19
.L23:
	add	r3, r8, r2
	ldbu	r5, 0(r3)
	add	r3, r4, r2
	addi	r2, r2, -1
	stb	r5, 0(r3)
	cmpnei	r3, r2, -1
	bne	r3, zero, .L23
.L19:
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r3, -4(fp)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	bne	r3, r2, .L28
	mov	sp, fp
	ldw	ra, 4(sp)
	ldw	fp, 0(sp)
	addi	sp, sp, 8
	ret
.L28:
	call	__stack_chk_fail
	.size	reverse, .-reverse
	.global	__divsi3
	.global	__modsi3
	.align	2
	.global	itoa
	.type	itoa, @function
itoa:
	addi	sp, sp, -24
	stw	r20, 16(sp)
	stw	ra, 20(sp)
	stw	r19, 12(sp)
	stw	r18, 8(sp)
	stw	r17, 4(sp)
	stw	r16, 0(sp)
	cmplti	r2, r4, 10
	mov	r20, r4
	bne	r2, zero, .L35
	cmpeqi	r2, r4, 10
	bne	r2, zero, .L36
	mov	r4, zero
.L32:
	mov	r17, r4
	mov	r2, zero
	addi	r4, r4, 1
	movi	r3, 1
.L31:
	mov	r6, r2
	muli	r3, r3, 10
	addi	r2, r2, 1
	bne	r6, r17, .L31
	bge	r20, r3, .L32
.L30:
	add	r18, r5, r17
	mov	r19, r18
	mov	r16, zero
	movi	r5, 1
.L33:
	mov	r4, r20
	call	__divsi3
	movi	r5, 10
	mov	r4, r2
	call	__modsi3
	addi	r2, r2, 48
	stb	r2, 0(r19)
	addi	r6, r16, 1
	blt	r17, r6, .L42
	movi	r5, 1
	mov	r2, zero
.L34:
	mov	r3, r2
	muli	r5, r5, 10
	addi	r2, r2, 1
	bne	r16, r3, .L34
	addi	r19, r19, -1
	mov	r16, r6
	br	.L33
.L42:
	stb	zero, 2(r18)
	ldw	ra, 20(sp)
	ldw	r20, 16(sp)
	ldw	r19, 12(sp)
	ldw	r18, 8(sp)
	ldw	r17, 4(sp)
	ldw	r16, 0(sp)
	addi	sp, sp, 24
	ret
.L35:
	mov	r17, zero
	br	.L30
.L36:
	movi	r17, 1
	br	.L30
	.size	itoa, .-itoa
	.align	2
	.global	writeString
	.type	writeString, @function
writeString:
.L50:
	ldbu	r2, 0(r4)
	andi	r3, r2, 255
	xori	r3, r3, 128
	addi	r3, r3, -128
	beq	r3, zero, .L43
	addi	r4, r4, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r4)
	br	.L50
.L43:
	ret
	.size	writeString, .-writeString
	.align	2
	.global	fib
	.type	fib, @function
fib:
	mov	r2, r4
	beq	r4, zero, .L112
	cmpeqi	r3, r4, 1
	bne	r3, zero, .L112
	addi	sp, sp, -108
	addi	r3, r4, -2
	stw	r3, 4(sp)
	ldw	r4, 4(sp)
	stw	ra, 104(sp)
	stw	fp, 100(sp)
	stw	r21, 96(sp)
	stw	r20, 92(sp)
	stw	r19, 88(sp)
	stw	r18, 84(sp)
	stw	r17, 80(sp)
	stw	r16, 76(sp)
	stw	zero, 0(sp)
	cmpeqi	r3, r2, 2
	mov	r5, r4
	bne	r3, zero, .L55
.L122:
	cmpeqi	r3, r4, 1
	addi	r4, r2, -1
	stw	r4, 16(sp)
	bne	r3, zero, .L56
	addi	r15, r2, -4
	mov	r14, zero
	mov	r13, r14
	cmpeqi	r2, r5, 2
	mov	r14, r15
	mov	r6, r14
	bne	r2, zero, .L60
.L121:
	addi	r3, r5, -1
	cmpeqi	r2, r14, 1
	stw	r3, 12(sp)
	bne	r2, zero, .L61
	addi	r15, r5, -4
	stw	r13, 20(sp)
	stw	r14, 24(sp)
	cmpeqi	r2, r6, 2
	mov	r5, zero
	mov	r7, r15
	bne	r2, zero, .L65
.L119:
	addi	r3, r6, -1
	cmpeqi	r2, r15, 1
	stw	r3, 8(sp)
	bne	r2, zero, .L66
	addi	r9, r6, -4
	mov	r20, r9
	mov	r6, zero
	stw	r15, 28(sp)
	stw	r5, 32(sp)
	cmpeqi	r2, r7, 2
	mov	r19, r6
	mov	r21, r20
	bne	r2, zero, .L70
.L117:
	cmpeqi	r2, r20, 1
	addi	r10, r7, -1
	bne	r2, zero, .L71
	addi	r8, r7, -4
	mov	r7, zero
	stw	r19, 36(sp)
	mov	r18, r7
	stw	r10, 40(sp)
	stw	r20, 44(sp)
	mov	r19, r8
.L72:
	cmpeqi	r2, r21, 2
	mov	r16, r19
	bne	r2, zero, .L75
	cmpeqi	r2, r19, 1
	addi	r10, r21, -1
	bne	r2, zero, .L76
	addi	fp, r21, -4
	mov	r20, zero
	mov	r7, r18
	mov	r6, r20
	mov	r5, fp
	mov	r8, r19
.L77:
	cmpeqi	r3, r16, 2
	mov	r2, r5
	bne	r3, zero, .L80
	cmpeqi	r3, r5, 1
	addi	r9, r16, -1
	bne	r3, zero, .L81
	addi	r17, r16, -4
	cmpeqi	r3, r2, 2
	mov	r16, zero
	mov	fp, r17
	bne	r3, zero, .L85
.L123:
	cmpeqi	r3, r17, 1
	addi	r11, r2, -1
	bne	r3, zero, .L86
	addi	r19, r2, -4
	cmpeqi	r2, fp, 2
	mov	r18, zero
	mov	r21, r19
	bne	r2, zero, .L90
.L125:
	cmpeqi	r2, r19, 1
	addi	fp, fp, -1
	bne	r2, zero, .L91
	mov	r20, zero
.L92:
	addi	r4, r21, -2
	stw	r8, 72(sp)
	stw	r10, 68(sp)
	stw	r9, 64(sp)
	stw	r11, 60(sp)
	stw	r5, 56(sp)
	stw	r6, 52(sp)
	stw	r7, 48(sp)
	addi	r21, r21, -1
	call	fib
	ldw	r7, 48(sp)
	ldw	r6, 52(sp)
	ldw	r5, 56(sp)
	ldw	r11, 60(sp)
	ldw	r9, 64(sp)
	ldw	r10, 68(sp)
	ldw	r8, 72(sp)
	cmpnei	r3, r21, 1
	add	r20, r20, r2
	beq	r21, zero, .L93
	bne	r3, zero, .L92
	addi	r20, r20, 1
.L93:
	add	r18, r18, r20
	bne	fp, zero, .L95
.L89:
	add	r16, r16, r18
	bne	r11, zero, .L96
	add	r6, r6, r16
	bne	r9, zero, .L97
.L124:
	mov	r18, r7
	mov	r20, r6
	mov	r19, r8
.L79:
	add	r18, r18, r20
	bne	r10, zero, .L98
	ldw	r19, 36(sp)
	ldw	r10, 40(sp)
	mov	r7, r18
	ldw	r20, 44(sp)
	add	r19, r19, r7
	beq	r10, zero, .L116
.L99:
	cmpnei	r2, r10, 1
	beq	r2, zero, .L70
.L68:
	mov	r7, r10
	addi	r20, r20, -1
	cmpeqi	r2, r7, 2
	mov	r21, r20
	beq	r2, zero, .L117
.L70:
	ldw	r5, 32(sp)
	ldw	r2, 8(sp)
	addi	r6, r19, 1
	ldw	r15, 28(sp)
	add	r5, r5, r6
	beq	r2, zero, .L118
.L100:
	ldw	r2, 8(sp)
	cmpnei	r2, r2, 1
	beq	r2, zero, .L65
.L63:
	ldw	r6, 8(sp)
	addi	r15, r15, -1
	mov	r7, r15
	cmpeqi	r2, r6, 2
	beq	r2, zero, .L119
.L65:
	ldw	r13, 20(sp)
	ldw	r2, 12(sp)
	addi	r5, r5, 1
	ldw	r14, 24(sp)
	add	r13, r13, r5
	beq	r2, zero, .L120
.L101:
	ldw	r2, 12(sp)
	cmpnei	r2, r2, 1
	beq	r2, zero, .L60
.L58:
	ldw	r5, 12(sp)
	addi	r14, r14, -1
	mov	r6, r14
	cmpeqi	r2, r5, 2
	beq	r2, zero, .L121
.L60:
	addi	r14, r13, 1
.L59:
	ldw	r2, 0(sp)
	ldw	r3, 16(sp)
	add	r2, r2, r14
	beq	r3, zero, .L105
	ldw	r3, 16(sp)
	cmpnei	r3, r3, 1
	beq	r3, zero, .L115
.L54:
	stw	r2, 0(sp)
	ldw	r2, 4(sp)
	addi	r2, r2, -1
	stw	r2, 4(sp)
	ldw	r2, 16(sp)
	ldw	r4, 4(sp)
	cmpeqi	r3, r2, 2
	mov	r5, r4
	beq	r3, zero, .L122
.L55:
	ldw	r2, 0(sp)
.L115:
	addi	r2, r2, 1
.L105:
	ldw	ra, 104(sp)
	ldw	fp, 100(sp)
	ldw	r21, 96(sp)
	ldw	r20, 92(sp)
	ldw	r19, 88(sp)
	ldw	r18, 84(sp)
	ldw	r17, 80(sp)
	ldw	r16, 76(sp)
	addi	sp, sp, 108
	ret
.L86:
	addi	r16, r16, 1
.L83:
	mov	r2, r11
	addi	r17, r17, -1
	cmpeqi	r3, r2, 2
	mov	fp, r17
	beq	r3, zero, .L123
.L85:
	addi	r16, r16, 1
.L126:
	add	r6, r6, r16
	beq	r9, zero, .L124
.L97:
	cmpnei	r2, r9, 1
	bne	r2, zero, .L78
.L80:
	mov	r18, r7
	mov	r19, r8
	addi	r20, r6, 1
	br	.L79
.L81:
	addi	r6, r6, 1
.L78:
	addi	r5, r5, -1
	mov	r16, r9
	br	.L77
.L98:
	cmpnei	r2, r10, 1
	bne	r2, zero, .L73
.L75:
	ldw	r19, 36(sp)
	ldw	r10, 40(sp)
	addi	r7, r18, 1
	ldw	r20, 44(sp)
	add	r19, r19, r7
	bne	r10, zero, .L99
.L116:
	ldw	r5, 32(sp)
	ldw	r2, 8(sp)
	mov	r6, r19
	ldw	r15, 28(sp)
	add	r5, r5, r6
	bne	r2, zero, .L100
.L118:
	ldw	r13, 20(sp)
	ldw	r2, 12(sp)
	ldw	r14, 24(sp)
	add	r13, r13, r5
	bne	r2, zero, .L101
.L120:
	mov	r14, r13
	br	.L59
.L91:
	addi	r18, r18, 1
.L88:
	addi	r19, r19, -1
	cmpeqi	r2, fp, 2
	mov	r21, r19
	beq	r2, zero, .L125
.L90:
	addi	r18, r18, 1
	br	.L89
.L76:
	addi	r18, r18, 1
.L73:
	addi	r19, r19, -1
	mov	r21, r10
	br	.L72
.L71:
	addi	r19, r19, 1
	br	.L68
.L66:
	addi	r5, r5, 1
	br	.L63
.L61:
	addi	r13, r13, 1
	br	.L58
.L96:
	cmpnei	r2, r11, 1
	bne	r2, zero, .L83
	addi	r16, r16, 1
	br	.L126
.L95:
	cmpnei	r2, fp, 1
	bne	r2, zero, .L88
	addi	r18, r18, 1
	br	.L89
.L56:
	ldw	r2, 0(sp)
	addi	r2, r2, 1
	br	.L54
.L112:
	ret
	.size	fib, .-fib
	.align	2
	.global	sqrt
	.type	sqrt, @function
sqrt:
	blt	r4, zero, .L129
	addi	r2, r4, -1
	ret
.L129:
	movi	r2, -1
	ret
	.size	sqrt, .-sqrt
	.align	2
	.global	isPrime
	.type	isPrime, @function
isPrime:
	cmplti	r2, r4, 2
	bne	r2, zero, .L134
	addi	sp, sp, -16
	stw	r18, 8(sp)
	addi	r18, r4, -1
	stw	r17, 4(sp)
	stw	ra, 12(sp)
	stw	r16, 0(sp)
	cmplti	r2, r18, 3
	mov	r17, r4
	bne	r2, zero, .L135
	andi	r2, r4, 1
	beq	r2, zero, .L136
	movi	r16, 2
	br	.L132
.L133:
	call	__modsi3
	beq	r2, zero, .L130
.L132:
	addi	r16, r16, 1
	mov	r4, r17
	mov	r5, r16
	bne	r16, r18, .L133
.L135:
	movi	r2, 1
.L130:
	ldw	ra, 12(sp)
	ldw	r18, 8(sp)
	ldw	r17, 4(sp)
	ldw	r16, 0(sp)
	addi	sp, sp, 16
	ret
.L134:
	mov	r2, zero
	ret
.L136:
	mov	r2, zero
	br	.L130
	.size	isPrime, .-isPrime
	.global	__umodsi3
	.section	.text.startup,"ax",@progbits
	.align	2
	.global	main
	.type	main, @function
main:
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r9, %lo(__stack_chk_guard)(r2)
	movhi	r2, 11565
	addi	sp, sp, -72
	addi	r2, r2, 11565
	stw	r2, 36(sp)
	stw	r2, 40(sp)
	stw	r2, 44(sp)
	movi	r2, 72
	stb	r2, 19(sp)
	movi	r2, 101
	stb	r2, 20(sp)
	movi	r2, 87
	stb	r2, 25(sp)
	movi	r2, 114
	stb	r2, 27(sp)
	movi	r2, 100
	movhi	r6, 11565
	movhi	r5, 10
	movhi	r3, 2628
	stb	r2, 29(sp)
	movi	r2, 33
	movi	r4, 108
	movi	r8, 111
	movi	r7, 32
	addi	r3, r3, 20037
	addi	r6, r6, 11530
	addi	r5, r5, 11565
	stb	r2, 30(sp)
	movi	r2, 44
	stb	r2, 1(sp)
	stw	r3, 4(sp)
	stw	ra, 68(sp)
	stw	r18, 64(sp)
	stw	r17, 60(sp)
	stw	r16, 56(sp)
	stw	r9, 52(sp)
	stw	r6, 32(sp)
	stw	r5, 48(sp)
	stb	r4, 21(sp)
	stb	r4, 22(sp)
	stb	r8, 23(sp)
	stb	r7, 24(sp)
	stb	r8, 26(sp)
	stb	r4, 28(sp)
	stb	zero, 31(sp)
	stb	r7, 2(sp)
	stb	zero, 3(sp)
	stb	zero, 8(sp)
	movi	r2, 72
	addi	r3, sp, 19
.L145:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L145
	ldbu	r2, 32(sp)
	addi	r3, sp, 32
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, .L148
.L146:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L146
.L148:
	movi	r17, 1
	mov	r18, zero
.L147:
	cmpnei	r2, r17, 1
	beq	r2, zero, .L157
	cmpltui	r2, r18, 3
	bne	r2, zero, .L150
	andi	r2, r17, 1
	beq	r2, zero, .L151
	movi	r16, 2
	br	.L152
.L153:
	mov	r5, r16
	mov	r4, r17
	call	__modsi3
	beq	r2, zero, .L151
.L152:
	addi	r16, r16, 1
	bne	r16, r18, .L153
.L150:
	mov	r4, r17
	addi	r5, sp, 9
	call	itoa
	ldbu	r2, 9(sp)
	addi	r3, sp, 9
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, .L173
.L154:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L154
.L173:
	ldbu	r2, 1(sp)
	addi	r3, sp, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, .L151
.L155:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L155
.L151:
	cmpnei	r2, r17, 199
	beq	r2, zero, .L212
.L157:
	addi	r18, r18, 1
	addi	r17, r17, 1
	br	.L147
.L212:
	ldbu	r2, 32(sp)
	andi	r3, r2, 255
	xori	r3, r3, 128
	addi	r3, r3, -128
	beq	r3, zero, .L158
	addi	r3, sp, 32
.L159:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L159
.L158:
	mov	r16, zero
	mov	r18, zero
	mov	r4, zero
.L170:
	add	r4, r4, r18
	addi	r5, sp, 9
	call	itoa
	ldbu	r2, 9(sp)
	addi	r3, sp, 9
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, .L164
.L161:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L161
.L164:
	ldbu	r2, 1(sp)
	addi	r3, sp, 1
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, .L163
.L162:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L162
.L163:
	addi	r16, r16, 1
	cmpnei	r2, r16, 20
	beq	r2, zero, .L213
	cmpeqi	r2, r16, 1
	bne	r2, zero, .L181
	mov	r17, r16
	mov	r18, zero
.L160:
	addi	r4, r17, -2
	call	fib
	addi	r17, r17, -1
	cmpnei	r3, r17, 1
	add	r18, r18, r2
	bne	r3, zero, .L160
	movi	r4, 1
	br	.L170
.L181:
	mov	r18, zero
	movi	r4, 1
	br	.L170
.L213:
	ldbu	r2, 32(sp)
	addi	r3, sp, 32
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, .L172
.L167:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L167
.L172:
	ldbu	r2, 4(sp)
	addi	r3, sp, 4
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	beq	r4, zero, .L169
.L168:
	addi	r3, r3, 1
#APP
#  51 "test.c" 1
	stb r2, 0x864(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(r3)
	ldbu	r2, 0(r3)
	andi	r4, r2, 255
	xori	r4, r4, 128
	addi	r4, r4, -128
	bne	r4, zero, .L168
.L169:
#APP
#  108 "test.c" 1
	
ENDLOOP:
br ENDLOOP

#  0 "" 2
#NO_APP
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r4, 52(sp)
	ldw	r3, %lo(__stack_chk_guard)(r2)
	bne	r4, r3, .L214
	mov	r2, zero
	ldw	ra, 68(sp)
	ldw	r18, 64(sp)
	ldw	r17, 60(sp)
	ldw	r16, 56(sp)
	addi	sp, sp, 72
	ret
.L214:
	call	__stack_chk_fail
	.size	main, .-main
	.global	__stack_chk_guard
	.section	.sdata,"aws"
	.align	2
	.type	__stack_chk_guard, @object
	.size	__stack_chk_guard, 4
__stack_chk_guard:
	.long	110371071
	.ident	"GCC: (Buildroot toolchains.bootlin.com-2021.11-1) 10.3.0"
