	.global	get_leds
get_leds:
	addi	r27, r27, -8
	stw	r28, 4(r27)
	addi	r28, r27, 4
	ldbio r2, 0x810(r0)
	stb	r2, -1(r28)
	ldbu	r2, -1(r28)
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	set_leds
set_leds:
	addi	r27, r27, -8
	stw	r28, 4(r27)
	addi	r28, r27, 4
	mov	r2, r4
	stb	r2, -4(r28)
	ldbu	r2, -4(r28)
	stbio r2, 0x810(r0)
	nop
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	get_buttons
get_buttons:
	addi	r27, r27, -8
	stw	r28, 4(r27)
	addi	r28, r27, 4
	ldbio r2, 0x840(r0)
	stb	r2, -1(r28)
	ldbu	r2, -1(r28)
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	get_dips
get_dips:
	addi	r27, r27, -8
	stw	r28, 4(r27)
	addi	r28, r27, 4
	ldbio r2, 0x850(r0)
	stb	r2, -1(r28)
	ldbu	r2, -1(r28)
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	.global	__stack_chk_guard
__stack_chk_guard:
	.word	110371071
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
	.global	__udivsi3
__udivsi3:
	addi	r27, r27, -16
	stw	ra, 12(r27)
	stw	r28, 8(r27)
	addi	r28, r27, 8
	stw	r4, -4(r28)
	stw	r5, -8(r28)
	ldw	r2, -4(r28)
	ldw	r3, -8(r28)
	mov	r5, r3
	mov	r4, r2
	call	__divsi3
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
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
	br	L16
L17:
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
L16:
	ldw	r3, -16(r28)
	ldw	r2, -28(r28)
	blt	r3, r2, L17
	ldw	r2, -28(r28)
	addi	r2, r2, -1
	stw	r2, -20(r28)
	br	L18
L19:
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
L18:
	ldw	r2, -20(r28)
	bge	r2, zero, L19
	mov	r27, r12
	nop
	ldw	r3, -4(r28)
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	beq	r3, r2, L20
	call	__stack_chk_fail
L20:
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
	br	L22
L23:
	ldw	r2, -4(r28)
	ldw	r3, -8(r28)
	add	r3, r3, r2
	ldbu	r2, 0(r3)
	stb r2, 0x864(r0)
	stb	r2, 0(r3)
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
L22:
	ldw	r2, -4(r28)
	ldw	r3, -8(r28)
	add	r2, r3, r2
	ldbu	r2, 0(r2)
	andi	r2, r2, 255
	xori	r2, r2, 128
	addi	r2, r2, -128
	bne	r2, zero, L23
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
	bne	r2, zero, L25
	mov	r2, zero
	br	L26
L25:
	ldw	r2, -8(r28)
	cmpnei	r2, r2, 1
	bne	r2, zero, L27
	movi	r2, 1
	br	L26
L27:
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
L26:
	addi	r27, r28, -4
	ldw	ra, 8(r27)
	ldw	r28, 4(r27)
	ldw	r16, 0(r27)
	addi	r27, r27, 12
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
	br	L29
L30:
	ldw	r3, -8(r28)
	ldw	r2, -12(r28)
	mul	r2, r3, r2
	stw	r2, -8(r28)
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
L29:
	ldw	r3, -4(r28)
	ldw	r2, -16(r28)
	blt	r3, r2, L30
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
	bge	r3, r2, L33
	mov	r2, zero
	br	L34
L33:
	ldw	r3, -8(r28)
	ldw	r2, -12(r28)
	bne	r3, r2, L35
	movi	r2, 1
	br	L34
L35:
	stw	zero, -4(r28)
	br	L36
L37:
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
L36:
	ldw	r5, -4(r28)
	ldw	r4, -12(r28)
	call	pow
	mov	r3, r2
	ldw	r2, -8(r28)
	bge	r2, r3, L37
	ldw	r2, -4(r28)
	addi	r2, r2, -1
L34:
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
	.global	sqrt
sqrt:
	addi	r27, r27, -12
	stw	r28, 8(r27)
	addi	r28, r27, 8
	stw	r4, -8(r28)
	ldw	r2, -8(r28)
	bge	r2, zero, L39
	movi	r2, -1
	br	L40
L39:
	stw	zero, -4(r28)
L42:
	ldw	r2, -4(r28)
	mul	r2, r2, r2
	ldw	r3, -8(r28)
	bge	r3, r2, L41
	ldw	r2, -8(r28)
	addi	r2, r2, -1
	br	L40
L41:
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
	br	L42
L40:
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
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
	br	L44
L45:
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
L44:
	movi	r5, 10
	ldw	r4, -12(r28)
	call	log
	mov	r3, r2
	ldw	r2, -8(r28)
	bge	r3, r2, L45
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
	.global	main
main:
	addi	r27, r27, -44
	stw	ra, 40(r27)
	stw	r28, 36(r27)
	addi	r28, r27, 36
	movhi	r2, %hiadj(__stack_chk_guard)
	ldw	r2, %lo(__stack_chk_guard)(r2)
	stw	r2, -4(r28)
	movi	r2, 32
	stb	r2, -13(r28)
	stb	zero, -12(r28)
	movi	r2, 10
	stb	r2, -11(r28)
	stb	zero, -10(r28)
	movi	r2, -1
	stb	r2, -34(r28)
L50:
	call	get_dips
	stb	r2, -33(r28)
	ldb	r3, -34(r28)
	ldb	r2, -33(r28)
	beq	r3, r2, L52
	ldbu	r2, -33(r28)
	stb	r2, -34(r28)
	ldb	r2, -34(r28)
	mov	r4, r2
	call	set_leds
	ldbu	r2, -34(r28)
	andi	r2, r2, 0xff
	andi	r2, r2, 1
	stw	r2, -32(r28)
	ldbu	r2, -34(r28)
	andi	r2, r2, 0xff
	srai	r2, r2, 1
	andi	r2, r2, 1
	stw	r2, -28(r28)
	ldbu	r2, -34(r28)
	andi	r2, r2, 0xff
	srai	r2, r2, 2
	andi	r2, r2, 1
	stw	r2, -24(r28)
	ldbu	r2, -34(r28)
	andi	r2, r2, 0xff
	srai	r2, r2, 3
	andi	r2, r2, 1
	stw	r2, -20(r28)
	addi	r2, r28, -9
	mov	r5, r2
	ldw	r4, -32(r28)
	call	itoa
	addi	r2, r28, -9
	mov	r4, r2
	call	writeString
	addi	r2, r28, -13
	mov	r4, r2
	call	writeString
	addi	r2, r28, -9
	mov	r5, r2
	ldw	r4, -28(r28)
	call	itoa
	addi	r2, r28, -9
	mov	r4, r2
	call	writeString
	addi	r2, r28, -13
	mov	r4, r2
	call	writeString
	addi	r2, r28, -9
	mov	r5, r2
	ldw	r4, -24(r28)
	call	itoa
	addi	r2, r28, -9
	mov	r4, r2
	call	writeString
	addi	r2, r28, -13
	mov	r4, r2
	call	writeString
	addi	r2, r28, -9
	mov	r5, r2
	ldw	r4, -20(r28)
	call	itoa
	addi	r2, r28, -9
	mov	r4, r2
	call	writeString
	addi	r2, r28, -13
	mov	r4, r2
	call	writeString
	addi	r2, r28, -11
	mov	r4, r2
	call	writeString
	br	L50
L52:
	nop
	br	L50
END:

.data
		.skip 0xFF7C
.end