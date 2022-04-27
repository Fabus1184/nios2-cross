	
	.text
	
	.global	main
	
main:
	addi	r27, r27, -76
	stw	r28, 72(r27)
	addi	r28, r27, 72
	movi	r2, 42
	stw	r2, -8(r28)
	movi	r2, 1
	stw	r2, -40(r28)
	movi	r2, 2
	stw	r2, -36(r28)
	movi	r2, 3
	stw	r2, -32(r28)
	movi	r2, 4
	stw	r2, -28(r28)
	movi	r2, 5
	stw	r2, -24(r28)
	movi	r2, 6
	stw	r2, -20(r28)
	movi	r2, 7
	stw	r2, -16(r28)
	movi	r2, 8
	stw	r2, -12(r28)
	stw	zero, -72(r28)
	stw	zero, -68(r28)
	stw	zero, -64(r28)
	stw	zero, -60(r28)
	stw	zero, -56(r28)
	stw	zero, -52(r28)
	stw	zero, -48(r28)
	stw	zero, -44(r28)
	stw	zero, -4(r28)
	br	L2
L3:
	ldw	r2, -4(r28)
	slli	r2, r2, 2
	add	r2, r28, r2
	ldw	r3, -40(r2)
	ldw	r2, -8(r28)
	add	r3, r3, r2
	ldw	r2, -4(r28)
	slli	r2, r2, 2
	add	r2, r28, r2
	stw	r3, -72(r2)
	ldw	r2, -4(r28)
	addi	r2, r2, 1
	stw	r2, -4(r28)
L2:
	ldw	r2, -4(r28)
	cmplti	r2, r2, 8
	bne	r2, zero, L3
	mov	r2, zero
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
