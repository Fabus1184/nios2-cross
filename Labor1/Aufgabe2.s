	.text
	
	.global	area
	
area:
	addi	r27, r27, -12
	stw	r28, 8(r27)
	addi	r28, r27, 8
	mov	r2, r4
	mov	r3, r5
	sth	r2, -4(r28)
	mov	r2, r3
	sth	r2, -8(r28)
	ldh	r3, -4(r28)
	ldh	r2, -8(r28)
	mul	r2, r3, r2
	srli	r3, r2, 31
	add	r2, r3, r2
	srai	r2, r2, 1
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
	ret
	
	
	.global	main
	
main:
	addi	r27, r27, -16
	stw	ra, 12(r27)
	stw	r28, 8(r27)
	addi	r28, r27, 8
	movi	r2, 42
	sth	r2, -2(r28)
	movi	r2, 27
	sth	r2, -4(r28)
	ldh	r2, -2(r28)
	ldh	r3, -4(r28)
	mov	r5, r3
	mov	r4, r2
	call	area
	stw	r2, -8(r28)
	mov	r2, zero
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
