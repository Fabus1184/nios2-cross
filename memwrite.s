	
	.text
#APP
	.data
ARR: .skip 127
#NO_APP
	
	.global	asciiToMem
	
asciiToMem:
	addi	r27, r27, -12
	stw	r28, 8(r27)
	addi	r28, r27, 8
	mov	r2, r4
	stw	r5, -8(r28)
	stb	r2, -4(r28)
#APP
#  7 "memwrite.c" 1
	stw r4, ARR(r5)
#  0 "" 2
#NO_APP
	nop
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
	stw	zero, -8(r28)
	stb	zero, -1(r28)
	br	L3
L4:
	ldb	r4, -1(r28)
	ldb	r2, -1(r28)
	slli	r3, r2, 3
	ldw	r2, -8(r28)
	add	r2, r3, r2
	mov	r5, r2
	call	asciiToMem
	ldbu	r2, -1(r28)
	addi	r2, r2, 1
	stb	r2, -1(r28)
L3:
	ldb	r2, -1(r28)
	cmpnei	r2, r2, 127
	bne	r2, zero, L4
	mov	r2, zero
	mov	r27, r28
	ldw	ra, 4(r27)
	ldw	r28, 0(r27)
	addi	r27, r27, 8
	ret
	
	
