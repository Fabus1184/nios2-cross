	
	.text
	
	.global	main
	
main:
	addi	r27, r27, -16
	stw	r28, 12(r27)
	addi	r28, r27, 12
	stw	zero, -4(r28)
	ldw	r2, -12(r28)
	cmpgei	r2, r2, 100
	bne	r2, zero, L2
	stw	zero, -8(r28)
	br	L3
L4:
	ldw	r2, -8(r28)
	addi	r3, r2, 1
	stw	r3, -8(r28)
	ldw	r3, -4(r28)
	add	r2, r3, r2
	stw	r2, -4(r28)
	ldw	r2, -8(r28)
	addi	r2, r2, 1
	stw	r2, -8(r28)
L3:
	ldw	r3, -8(r28)
	ldw	r2, -12(r28)
	blt	r3, r2, L4
	br	L5
L2:
	movi	r2, -1
	stw	r2, -4(r28)
L5:
	mov	r2, zero
	mov	r27, r28
	ldw	r28, 0(r27)
	addi	r27, r27, 4
