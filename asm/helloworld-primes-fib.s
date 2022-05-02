	.global	__stack_chk_guard
__stack_chk_guard:
	.word	110371071
	.global	__divsi3
__divsi3:
	addi	r27, r27, -16
	stw	r28, 12(r27)
	addi	r28, r27, 12
	stw	r4, -8(r28)
	stw	r5, -12(r28)
	ldw	r2, -8(r28)
	ldw	r3, -12(r28)
	div r2, r2, r3
	stw	r2, -4(r28)
	ldw	r2, -4(r28)
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	__modsi3
__modsi3:
	addi	r27, r27, -16
	stw	ra, 12(r27)
	stw	r28, 8(r27)
	addi	r28, r27, 8
	stw	r4, -4(r28)
	stw	r5, -8(r28)
	ldw	r5, -8(r28)
	ldw	r4, -4(r28)
	call	__divsi3
	mov	r3, r2
	ldw	r2, -8(r28)
	mul	r2, r3, r2
	ldw	r3, -4(r28)
	sub	r2, r3, r2
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
	.global	__stack_chk_fail
__stack_chk_fail:
	addi	r27, r27, -4
	stw	r28, 0(r27)
	mov	r28, r27
	callr r0
	nop
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	pow
pow:
	addi	r27, r27, -20
	stw	r28, 16(r27)
	addi	r28, r27, 16
	stw	r4, -12(r28)
	stw	r5, -16(r28)
	movi	r2, 1
	stw	r2, -8(r28)
	stw	zero, -4(r28)
	br	L7
L8:
	ldw	r3, -8(r28)
	ldw	r2, -12(r28)
	mul	r2, r3, r2
	stw	r2, -8(r28)
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
L7:
	ldw	r3, -4(r28)
	ldw	r2, -16(r28)
	blt	r3, r2, L8
	ldw	r2, -8(r28)
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	log
log:
	addi	r27, r27, -20
	stw	ra, 16(r27)
	stw	r28, 12(r27)
	addi	r28, r27, 12
	stw	r4, -8(r28)
	stw	r5, -12(r28)
	ldw	r3, -8(r28)
	ldw	r2, -12(r28)
	bge	r3, r2, L11
	mov	r2, zero
	br	L12
L11:
	ldw	r3, -8(r28)
	ldw	r2, -12(r28)
	bne	r3, r2, L13
	movi	r2, 1
	br	L12
L13:
	stw	zero, -4(r28)
	br	L14
L15:
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
L14:
	ldw	r5, -4(r28)
	ldw	r4, -12(r28)
	call	pow
	mov	r3, r2
	ldw	r2, -8(r28)
	bge	r2, r3, L15
	ldw	r2, -4(r28)
	addi	r2, r2, -1
L12:
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
	.global	reverse
reverse:
	addi	r27, r27, -36
	stw	ra, 32(r27)
	stw	r28, 28(r27)
	addi	r28, r27, 28
	stw	r4, -24(r28)
	stw	r5, -28(r28)
	movhi	r4, %hiadj(__stack_chk_guard)
	ldw	r4, %lo(__stack_chk_guard)(r4)
	stw	r4, -4(r28)
	mov	r4, r27
	mov	r12, r4
	ldw	r4, -28(r28)
	addi	r5, r4, -1
	stw	r5, -12(r28)
	mov	r5, r4
	mov	r10, r5
	mov	r11, zero
	srli	r5, r10, 29
	slli	r7, r11, 3
	or	r7, r5, r7
	slli	r6, r10, 3
	mov	r5, r4
	mov	r8, r5
	mov	r9, zero
	srli	r5, r8, 29
	slli	r3, r9, 3
	or	r3, r5, r3
	slli	r2, r8, 3
	mov	r2, r4
	addi	r2, r2, 3
	srli	r2, r2, 2
	slli	r2, r2, 2
	sub	r27, r27, r2
	mov	r2, r27
	add	r2, r2, zero
	stw	r2, -8(r28)
	stw	zero, -16(r28)
	br	L17
L18:
	ldw	r2, -16(r28)
	ldw	r3, -24(r28)
	add	r2, r3, r2
	ldbu	r3, 0(r2)
	ldw	r4, -8(r28)
	ldw	r2, -16(r28)
	add	r2, r4, r2
	stb	r3, 0(r2)
	ldw	r2, -16(r28)
	addi	r2, r2, 1
	stw	r2, -16(r28)
L17:
	ldw	r3, -16(r28)
	ldw	r2, -28(r28)
	blt	r3, r2, L18
	ldw	r2, -28(r28)
	addi	r2, r2, -1
	stw	r2, -20(r28)
	br	L19
L20:
	ldw	r2, -20(r28)
	ldw	r3, -24(r28)
	add	r2, r3, r2
	ldw	r4, -8(r28)
	ldw	r3, -20(r28)
	add	r3, r4, r3
	ldbu	r3, 0(r3)
	stb	r3, 0(r2)
	ldw	r2, -20(r28)
	addi	r2, r2, -1
	stw	r2, -20(r28)
L19:
	ldw	r2, -20(r28)
	bge	r2, zero, L20
	mov	r27, r12
	nop
	ldw	r3, -4(r28)
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	beq	r3, r2, L21
	call	__stack_chk_fail
L21:
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
	.global	__divsi3
	.global	__modsi3
	.global	itoa
itoa:
	addi	r27, r27, -24
	stw	ra, 20(r27)
	stw	r28, 16(r27)
	addi	r28, r27, 16
	stw	r4, -12(r28)
	stw	r5, -16(r28)
	stw	zero, -8(r28)
	movi	r5, 10
	ldw	r4, -12(r28)
	call	log
	stw	r2, -4(r28)
	br	L23
L24:
	ldw	r5, -8(r28)
	movi	r4, 10
	call	pow
	mov	r5, r2
	ldw	r4, -12(r28)
	call	__divsi3
	movi	r5, 10
	mov	r4, r2
	call	__modsi3
	addi	r2, r2, 48
	mov	r4, r2
	ldw	r3, -4(r28)
	ldw	r2, -8(r28)
	sub	r2, r3, r2
	mov	r3, r2
	ldw	r2, -16(r28)
	add	r2, r2, r3
	mov	r3, r4
	stb	r3, 0(r2)
	ldw	r2, -8(r28)
	addi	r2, r2, 1
	stw	r2, -8(r28)
L23:
	movi	r5, 10
	ldw	r4, -12(r28)
	call	log
	mov	r3, r2
	ldw	r2, -8(r28)
	bge	r3, r2, L24
	ldw	r2, -8(r28)
	addi	r2, r2, 1
	stw	r2, -8(r28)
	ldw	r2, -8(r28)
	ldw	r3, -16(r28)
	add	r2, r3, r2
	stb	zero, 0(r2)
	nop
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
	.global	writeString
writeString:
	addi	r27, r27, -12
	stw	r28, 8(r27)
	addi	r28, r27, 8
	stw	r4, -8(r28)
	stw	zero, -4(r28)
	br	L26
L27:
	ldw	r2, -4(r28)
	ldw	r3, -8(r28)
	add	r3, r3, r2
	ldbu	r2, 0(r3)
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
L26:
	ldw	r2, -4(r28)
	ldw	r3, -8(r28)
	add	r2, r3, r2
	ldbu	r2, 0(r2)
	andi	r2, r2, 255
	xori	r2, r2, 128
	addi	r2, r2, -128
	bne	r2, zero, L27
	nop
	nop
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	fib
fib:
	addi	r27, r27, -16
	stw	ra, 12(r27)
	stw	r28, 8(r27)
	stw	r16, 4(r27)
	addi	r28, r27, 8
	stw	r4, -8(r28)
	ldw	r2, -8(r28)
	bne	r2, zero, L29
	mov	r2, zero
	br	L30
L29:
	ldw	r2, -8(r28)
	cmpnei	r2, r2, 1
	bne	r2, zero, L31
	movi	r2, 1
	br	L30
L31:
	ldw	r2, -8(r28)
	addi	r2, r2, -2
	mov	r4, r2
	call	fib
	mov	r16, r2
	ldw	r2, -8(r28)
	addi	r2, r2, -1
	mov	r4, r2
	call	fib
	add	r2, r16, r2
L30:
	addi	r27, r28, -4
	ldw	ra, 8(r27)
	ldw	r28, 4(r27)
	ldw	r16, 0(r27)
	addi	r27, r27, 12
	ret
	.global	sqrt
sqrt:
	addi	r27, r27, -12
	stw	r28, 8(r27)
	addi	r28, r27, 8
	stw	r4, -8(r28)
	ldw	r2, -8(r28)
	bge	r2, zero, L33
	movi	r2, -1
	br	L34
L33:
	stw	zero, -4(r28)
L36:
	ldw	r2, -4(r28)
	mul	r2, r2, r2
	ldw	r3, -8(r28)
	bge	r3, r2, L35
	ldw	r2, -8(r28)
	addi	r2, r2, -1
	br	L34
L35:
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
	br	L36
L34:
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	isPrime
isPrime:
	addi	r27, r27, -16
	stw	ra, 12(r27)
	stw	r28, 8(r27)
	addi	r28, r27, 8
	stw	r4, -8(r28)
	ldw	r2, -8(r28)
	cmpgei	r2, r2, 2
	bne	r2, zero, L38
	mov	r2, zero
	br	L39
L38:
	movi	r2, 2
	stw	r2, -4(r28)
	br	L40
L42:
	ldw	r2, -8(r28)
	ldw	r5, -4(r28)
	mov	r4, r2
	call	__modsi3
	bne	r2, zero, L41
	mov	r2, zero
	br	L39
L41:
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
L40:
	ldw	r4, -8(r28)
	call	sqrt
	mov	r3, r2
	ldw	r2, -4(r28)
	blt	r2, r3, L42
	movi	r2, 1
L39:
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
	.global	main
main:
	addi	r27, r27, -72
	stw	ra, 68(r27)
	stw	r28, 64(r27)
	addi	r28, r27, 64
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	stw	r2, -4(r28)
	movhi	r2, 11565
	addi	r2, r2, 11530
	stw	r2, -24(r28)
	movhi	r2, 11565
	addi	r2, r2, 11565
	stw	r2, -20(r28)
	movhi	r2, 11565
	addi	r2, r2, 11565
	stw	r2, -16(r28)
	movhi	r2, 11565
	addi	r2, r2, 11565
	stw	r2, -12(r28)
	movhi	r2, 10
	addi	r2, r2, 11565
	stw	r2, -8(r28)
	movi	r2, 72
	stb	r2, -37(r28)
	movi	r2, 101
	stb	r2, -36(r28)
	movi	r2, 108
	stb	r2, -35(r28)
	movi	r2, 108
	stb	r2, -34(r28)
	movi	r2, 111
	stb	r2, -33(r28)
	movi	r2, 32
	stb	r2, -32(r28)
	movi	r2, 87
	stb	r2, -31(r28)
	movi	r2, 111
	stb	r2, -30(r28)
	movi	r2, 114
	stb	r2, -29(r28)
	movi	r2, 108
	stb	r2, -28(r28)
	movi	r2, 100
	stb	r2, -27(r28)
	movi	r2, 33
	stb	r2, -26(r28)
	stb	zero, -25(r28)
	movi	r2, 44
	stb	r2, -55(r28)
	movi	r2, 32
	stb	r2, -54(r28)
	stb	zero, -53(r28)
	movhi	r2, 2628
	addi	r2, r2, 20037
	stw	r2, -52(r28)
	stb	zero, -48(r28)
	addi	r2, r28, -37
	mov	r4, r2
	call	writeString
	addi	r2, r28, -24
	mov	r4, r2
	call	writeString
	movi	r2, 1
	stw	r2, -64(r28)
	br	L44
L46:
	ldw	r4, -64(r28)
	call	isPrime
	beq	r2, zero, L45
	addi	r2, r28, -47
	mov	r5, r2
	ldw	r4, -64(r28)
	call	itoa
	addi	r2, r28, -47
	mov	r4, r2
	call	writeString
	addi	r2, r28, -55
	mov	r4, r2
	call	writeString
L45:
	ldw	r2, -64(r28)
	addi	r2, r2, 1
	stw	r2, -64(r28)
L44:
	ldw	r2, -64(r28)
	cmplti	r2, r2, 200
	bne	r2, zero, L46
	addi	r2, r28, -24
	mov	r4, r2
	call	writeString
	stw	zero, -60(r28)
	br	L47
L48:
	ldw	r4, -60(r28)
	call	fib
	mov	r3, r2
	addi	r2, r28, -47
	mov	r5, r2
	mov	r4, r3
	call	itoa
	addi	r2, r28, -47
	mov	r4, r2
	call	writeString
	addi	r2, r28, -55
	mov	r4, r2
	call	writeString
	ldw	r2, -60(r28)
	addi	r2, r2, 1
	stw	r2, -60(r28)
L47:
	ldw	r2, -60(r28)
	cmplti	r2, r2, 20
	bne	r2, zero, L48
	addi	r2, r28, -24
	mov	r4, r2
	call	writeString
	addi	r2, r28, -52
	mov	r4, r2
	call	writeString
	br END

	nop
	ldw	r3, -4(r28)
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	beq	r3, r2, L49
	call	__stack_chk_fail
L49:
	mov	r2, r4
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
END:

.data
		.skip 0xFF7C
.end
