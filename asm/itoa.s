itoa:
   55578: 	addi	sp,sp,-64
   5557c: 	ldw	r2,64(sp)
   55580: 	stw	r22,52(sp)
   55584: 	stw	r21,48(sp)
   55588: 	stw	r20,44(sp)
   5558c: 	nextpc	r22
   55590: 	movhi	r8,20
   55594: 	addi	r8,r8,17888
   55598: 	stw	ra,60(sp)
   5559c: 	stw	fp,56(sp)
   555a0: 	stw	r19,40(sp)
   555a4: 	stw	r18,36(sp)
   555a8: 	stw	r17,32(sp)
   555ac: 	stw	r16,28(sp)
   555b0: 	add	r22,r22,r8
   555b4: 	mov	r3,r4
   555b8: 	mov	r21,r6
   555bc: 	mov	r20,r7
   555c0: 	bne	r2,zero,5588c 
   555c4: 	cmpeqi	r2,r20,8
   555c8: 	ldw	r17,14816(r22)
   555cc: 	mov	r6,r5
   555d0: 	bne	r2,zero,5589c 
   555d4: 	cmpeqi	r2,r20,16
   555d8: 	bne	r2,zero,55938
   555dc: 	addi	r8,r20,-2
   555e0: 	ldw	r10,13196(r22)
   555e4: 	muli	r8,r8,20
   555e8: 	beq	r5,zero,55988 
   555ec: 	add	r2,r10,r8
   555f0: 	ldb	r11,8(r2)
   555f4: 	ldw	r4,12(r2)
   555f8: 	ldw	r7,16(r2)
   555fc: 	sll	r9,r4,r11
   55600: 	srli	r16,r7,16
   55604: 	andi	r7,r7,65535
   55608: 	srli	r14,r9,16
   5560c: 	andi	r13,r9,65535
   55610: 	bltu	r5,r4,55b20 
   55614: 	beq	r11,zero,55bf8 
   55618: 	movi	r2,64
   5561c: 	sub	r2,r2,r11
   55620: 	addi	r4,r2,-32
   55624: 	blt	r4,zero,55c5c 
   55628: 	srl	r2,r5,r4
   5562c: 	movi	r18,32
   55630: 	sub	r18,r18,r11
   55634: 	addi	r19,r18,-32
   55638: 	blt	r19,zero,55c78 
   5563c: 	srl	r19,r5,r19
   55640: 	srli	r4,r2,16
   55644: 	andi	r6,r2,65535
   55648: 	mul	r5,r6,r7
   5564c: 	mul	r15,r4,r7
   55650: 	mul	r6,r6,r16
   55654: 	srli	r5,r5,16
   55658: 	mul	r4,r4,r16
   5565c: 	add	r6,r6,r15
   55660: 	add	r5,r5,r6
   55664: 	srli	r12,r5,16
   55668: 	bgeu	r5,r15,55c9c 
   5566c: 	movhi	r5,1
   55670: 	add	r5,r2,r5
   55674: 	add	r4,r5,r4
   55678: 	add	r12,r4,r12
   5567c: 	srli	r6,r12,16
   55680: 	andi	r5,r12,65535
   55684: 	mul	r4,r5,r13
   55688: 	mul	r15,r6,r13
   5568c: 	mul	r5,r5,r14
   55690: 	srli	fp,r4,16
   55694: 	andi	r4,r4,65535
   55698: 	add	r5,r5,r15
   5569c: 	add	r5,r5,fp
   556a0: 	slli	ra,r5,16
   556a4: 	srli	fp,r5,16
   556a8: 	sub	r4,r19,r4
   556ac: 	sub	r4,r4,ra
   556b0: 	mul	r6,r6,r14
   556b4: 	sub	r2,r2,fp
   556b8: 	cmpltu	r19,r19,r4
   556bc: 	sub	r2,r2,r19
   556c0: 	bgeu	r5,r15,556cc 
   556c4: 	movhi	r5,1
   556c8: 	add	r6,r6,r5
   556cc: 	sub	r5,r2,r6
   556d0: 	beq	r2,r6,55c94 
   556d4: 	sub	r6,r4,r9
   556d8: 	cmpltu	r4,r4,r6
   556dc: 	bne	r4,r5,55c50 
   556e0: 	addi	r12,r12,1
   556e4: 	bltu	r6,r9,556f0 
   556e8: 	sub	r6,r6,r9
   556ec: 	addi	r12,r12,1
   556f0: 	srli	r2,r6,16
   556f4: 	andi	r4,r6,65535
   556f8: 	mul	r5,r4,r7
   556fc: 	mul	r15,r2,r7
   55700: 	mul	r4,r4,r16
   55704: 	srli	r5,r5,16
   55708: 	sll	r3,r3,r11
   5570c: 	add	r4,r4,r15
   55710: 	add	r5,r5,r4
   55714: 	mul	r4,r2,r16
   55718: 	bgeu	r5,r15,55724 
   5571c: 	movhi	r2,1
   55720: 	add	r4,r4,r2
   55724: 	srli	r2,r5,16
   55728: 	add	r2,r2,r6
   5572c: 	add	r2,r2,r4
   55730: 	srli	r4,r2,16
   55734: 	andi	r5,r2,65535
   55738: 	mul	r15,r5,r13
   5573c: 	mul	fp,r4,r13
   55740: 	mul	r5,r5,r14
   55744: 	srli	r19,r15,16
   55748: 	mul	r4,r4,r14
   5574c: 	add	r5,r5,fp
   55750: 	add	r5,r19,r5
   55754: 	bgeu	r5,fp,55760 
   55758: 	movhi	r19,1
   5575c: 	add	r4,r4,r19
   55760: 	slli	fp,r5,16
   55764: 	srli	r19,r5,16
   55768: 	andi	r5,r15,65535
   5576c: 	sub	r5,r3,r5
   55770: 	sub	r5,r5,fp
   55774: 	sub	r6,r6,r19
   55778: 	cmpltu	r3,r3,r5
   5577c: 	sub	r6,r6,r3
   55780: 	sub	r15,r6,r4
   55784: 	beq	r6,r4,5579c 
   55788: 	sub	r4,r5,r9
   5578c: 	cmpltu	r3,r5,r4
   55790: 	bne	r3,r15,55c44 
   55794: 	addi	r2,r2,1
   55798: 	mov	r5,r4
   5579c: 	bltu	r5,r9,557a8 
   557a0: 	sub	r5,r5,r9
   557a4: 	addi	r2,r2,1
   557a8: 	srl	r3,r5,r11
   557ac: 	stw	r3,24(sp)
   557b0: 	beq	r11,zero,557c0 
   557b4: 	sll	r12,r12,r11
   557b8: 	srl	r18,r2,r18
   557bc: 	or	r12,r12,r18
   557c0: 	srli	r4,r12,16
   557c4: 	andi	r6,r12,65535
   557c8: 	mul	r5,r6,r7
   557cc: 	mul	r6,r6,r16
   557d0: 	mul	r7,r4,r7
   557d4: 	srli	r5,r5,16
   557d8: 	sll	r2,r2,r11
   557dc: 	add	r6,r6,r7
   557e0: 	add	r5,r5,r6
   557e4: 	mul	r16,r4,r16
   557e8: 	bgeu	r5,r7,557f4 
   557ec: 	movhi	r4,1
   557f0: 	add	r16,r16,r4
   557f4: 	srli	r4,r5,16
   557f8: 	add	r4,r4,r12
   557fc: 	add	r4,r4,r16
   55800: 	srli	r15,r4,16
   55804: 	andi	r5,r4,65535
   55808: 	mul	r6,r5,r13
   5580c: 	mul	r5,r5,r14
   55810: 	mul	r13,r15,r13
   55814: 	srli	r7,r6,16
   55818: 	mul	r14,r15,r14
   5581c: 	add	r5,r5,r13
   55820: 	add	r7,r7,r5
   55824: 	bgeu	r7,r13,55830 
   55828: 	movhi	r5,1
   5582c: 	add	r14,r14,r5
   55830: 	slli	r13,r7,16
   55834: 	andi	r5,r6,65535
   55838: 	srli	r7,r7,16
   5583c: 	sub	r5,r2,r5
   55840: 	sub	r5,r5,r13
   55844: 	sub	r12,r12,r7
   55848: 	cmpltu	r2,r2,r5
   5584c: 	sub	r2,r12,r2
   55850: 	sub	r6,r2,r14
   55854: 	beq	r2,r14,5586c 
   55858: 	sub	r2,r5,r9
   5585c: 	cmpltu	r5,r5,r2
   55860: 	bne	r5,r6,55c2c 
   55864: 	addi	r4,r4,1
   55868: 	mov	r5,r2
   5586c: 	bltu	r5,r9,55878 
   55870: 	sub	r5,r5,r9
   55874: 	addi	r4,r4,1
   55878: 	srl	r5,r5,r11
   5587c: 	stw	r4,16(sp)
   55880: 	movi	r7,3
   55884: 	stw	r5,20(sp)
   55888: 	br	55990 
   5588c: 	cmpeqi	r2,r20,8
   55890: 	ldw	r17,14616(r22)
   55894: 	mov	r6,r5
   55898: 	beq	r2,zero,555d4 
   5589c: 	beq	r5,zero,558ec 
   558a0: 	addi	r6,r21,-10
   558a4: 	mov	r2,r21
   558a8: 	andi	r4,r3,7
   558ac: 	add	r4,r17,r4
   558b0: 	ldbu	r4,0(r4)
   558b4: 	addi	r2,r2,-1
   558b8: 	srli	r3,r3,3
   558bc: 	stb	r4,0(r2)
   558c0: 	bne	r2,r6,558a8 
   558c4: 	slli	r4,r5,2
   558c8: 	srli	r5,r5,1
   558cc: 	andi	r4,r4,4
   558d0: 	or	r3,r3,r4
   558d4: 	beq	r5,zero,55b18 
   558d8: 	add	r3,r17,r3
   558dc: 	ldbu	r2,0(r3)
   558e0: 	addi	r21,r21,-11
   558e4: 	mov	r3,r5
   558e8: 	stb	r2,0(r21)
   558ec: 	mov	r2,r21
   558f0: 	andi	r4,r3,7
   558f4: 	add	r4,r17,r4
   558f8: 	ldbu	r4,0(r4)
   558fc: 	srli	r3,r3,3
   55900: 	addi	r2,r2,-1
   55904: 	stb	r4,0(r2)
   55908: 	bne	r3,zero,558f0 
   5590c: 	ldw	ra,60(sp)
   55910: 	ldw	fp,56(sp)
   55914: 	ldw	r22,52(sp)
   55918: 	ldw	r21,48(sp)
   5591c: 	ldw	r20,44(sp)
   55920: 	ldw	r19,40(sp)
   55924: 	ldw	r18,36(sp)
   55928: 	ldw	r17,32(sp)
   5592c: 	ldw	r16,28(sp)
   55930: 	addi	sp,sp,64
   55934: 	ret
   55938: 	beq	r5,zero,55964 
   5593c: 	addi	r2,r21,-8
   55940: 	andi	r4,r3,15
   55944: 	add	r4,r17,r4
   55948: 	ldbu	r4,0(r4)
   5594c: 	addi	r21,r21,-1
   55950: 	srli	r3,r3,4
   55954: 	stb	r4,0(r21)
   55958: 	bne	r21,r2,55940 
   5595c: 	mov	r3,r5
   55960: 	br	55968 
   55964: 	mov	r2,r21
   55968: 	andi	r4,r3,15
   5596c: 	add	r4,r17,r4
   55970: 	ldbu	r4,0(r4)
   55974: 	srli	r3,r3,4
   55978: 	addi	r2,r2,-1
   5597c: 	stb	r4,0(r2)
   55980: 	bne	r3,zero,55968 
   55984: 	br	5590c 
   55988: 	stw	r3,16(sp)
   5598c: 	movi	r7,1
   55990: 	add	r8,r10,r8
   55994: 	ldw	r18,0(r8)
   55998: 	slli	r2,r7,2
   5599c: 	ldw	r4,17104(r22)
   559a0: 	ldb	r10,4(r8)
   559a4: 	addi	r7,sp,16
   559a8: 	srli	r19,r18,16
   559ac: 	stw	r4,12(sp)
   559b0: 	add	r7,r7,r2
   559b4: 	addi	r16,sp,20
   559b8: 	mov	r4,r21
   559bc: 	andi	r18,r18,65535
   559c0: 	movhi	fp,1
   559c4: 	bne	r10,zero,55a48 
   559c8: 	beq	r3,zero,55b0c 
   559cc: 	ldb	r12,5(r8)
   559d0: 	mov	r2,r4
   559d4: 	srli	r6,r3,16
   559d8: 	andi	r13,r3,65535
   559dc: 	mul	r11,r13,r18
   559e0: 	mul	r14,r6,r18
   559e4: 	mul	r13,r13,r19
   559e8: 	srli	r11,r11,16
   559ec: 	mul	r6,r6,r19
   559f0: 	add	r13,r13,r14
   559f4: 	add	r11,r11,r13
   559f8: 	srli	r5,r11,16
   559fc: 	addi	r2,r2,-1
   55a00: 	bgeu	r11,r14,55a08 
   55a04: 	add	r6,r6,fp
   55a08: 	add	r5,r5,r6
   55a0c: 	srl	r5,r5,r12
   55a10: 	sub	r11,r4,r2
   55a14: 	mul	r6,r20,r5
   55a18: 	sub	r3,r3,r6
   55a1c: 	add	r3,r17,r3
   55a20: 	ldbu	r6,0(r3)
   55a24: 	mov	r3,r5
   55a28: 	stb	r6,0(r2)
   55a2c: 	bne	r5,zero,559d4 
   55a30: 	bne	r16,r7,55ac4 
   55a34: 	bne	r2,r21,5590c 
   55a38: 	movi	r3,48
   55a3c: 	stb	r3,-1(r2)
   55a40: 	addi	r2,r2,-1
   55a44: 	br	5590c 
   55a48: 	beq	r3,zero,55b0c 
   55a4c: 	ldb	r12,5(r8)
   55a50: 	mov	r2,r4
   55a54: 	addi	r12,r12,-1
   55a58: 	srli	r6,r3,16
   55a5c: 	andi	r13,r3,65535
   55a60: 	mul	r11,r13,r18
   55a64: 	mul	r14,r6,r18
   55a68: 	mul	r13,r19,r13
   55a6c: 	srli	r11,r11,16
   55a70: 	mul	r6,r19,r6
   55a74: 	add	r13,r13,r14
   55a78: 	add	r11,r11,r13
   55a7c: 	srli	r5,r11,16
   55a80: 	addi	r2,r2,-1
   55a84: 	bgeu	r11,r14,55a8c 
   55a88: 	add	r6,r6,fp
   55a8c: 	add	r6,r5,r6
   55a90: 	sub	r5,r3,r6
   55a94: 	srli	r5,r5,1
   55a98: 	sub	r11,r4,r2
   55a9c: 	add	r5,r5,r6
   55aa0: 	srl	r5,r5,r12
   55aa4: 	mul	r6,r20,r5
   55aa8: 	sub	r3,r3,r6
   55aac: 	add	r3,r17,r3
   55ab0: 	ldbu	r6,0(r3)
   55ab4: 	mov	r3,r5
   55ab8: 	stb	r6,0(r2)
   55abc: 	bne	r5,zero,55a58 
   55ac0: 	beq	r16,r7,55a34 
   55ac4: 	ldb	r6,9(r8)
   55ac8: 	bge	r11,r6,55c24 
   55acc: 	sub	r4,r11,r6
   55ad0: 	add	r4,r2,r4
   55ad4: 	ldw	r2,12(sp)
   55ad8: 	sub	r6,r6,r11
   55adc: 	movi	r5,48
   55ae0: 	stw	r10,8(sp)
   55ae4: 	stw	r8,4(sp)
   55ae8: 	stw	r7,0(sp)
   55aec: 	callr	r2
   55af0: 	ldw	r7,0(sp)
   55af4: 	ldw	r8,4(sp)
   55af8: 	ldw	r10,8(sp)
   55afc: 	mov	r4,r2
   55b00: 	ldw	r3,-8(r7)
   55b04: 	addi	r7,r7,-4
   55b08: 	br	559c4 
   55b0c: 	mov	r2,r4
   55b10: 	mov	r11,zero
   55b14: 	br	55a30 
   55b18: 	mov	r21,r2
   55b1c: 	br	558ec 
   55b20: 	addi	r6,r11,-32
   55b24: 	blt	r6,zero,55c04 
   55b28: 	sll	r6,r3,r6
   55b2c: 	mov	r3,zero
   55b30: 	srli	r2,r6,16
   55b34: 	andi	r5,r6,65535
   55b38: 	mul	r4,r5,r7
   55b3c: 	mul	r5,r5,r16
   55b40: 	mul	r7,r2,r7
   55b44: 	srli	r4,r4,16
   55b48: 	mul	r16,r2,r16
   55b4c: 	add	r5,r5,r7
   55b50: 	add	r4,r4,r5
   55b54: 	bgeu	r4,r7,55b60 
   55b58: 	movhi	r2,1
   55b5c: 	add	r16,r16,r2
   55b60: 	srli	r2,r4,16
   55b64: 	add	r2,r2,r6
   55b68: 	add	r2,r2,r16
   55b6c: 	srli	r12,r2,16
   55b70: 	andi	r4,r2,65535
   55b74: 	mul	r5,r4,r13
   55b78: 	mul	r4,r4,r14
   55b7c: 	mul	r13,r12,r13
   55b80: 	srli	r7,r5,16
   55b84: 	mul	r14,r12,r14
   55b88: 	add	r4,r4,r13
   55b8c: 	add	r7,r7,r4
   55b90: 	bgeu	r7,r13,55b9c 
   55b94: 	movhi	r4,1
   55b98: 	add	r14,r14,r4
   55b9c: 	slli	r12,r7,16
   55ba0: 	andi	r4,r5,65535
   55ba4: 	srli	r7,r7,16
   55ba8: 	sub	r4,r3,r4
   55bac: 	sub	r4,r4,r12
   55bb0: 	sub	r5,r6,r7
   55bb4: 	cmpltu	r3,r3,r4
   55bb8: 	sub	r3,r5,r3
   55bbc: 	sub	r5,r3,r14
   55bc0: 	beq	r3,r14,55bd8 
   55bc4: 	sub	r6,r4,r9
   55bc8: 	cmpltu	r3,r4,r6
   55bcc: 	bne	r3,r5,55c38 
   55bd0: 	addi	r2,r2,1
   55bd4: 	mov	r4,r6
   55bd8: 	bltu	r4,r9,55be4 
   55bdc: 	sub	r4,r4,r9
   55be0: 	addi	r2,r2,1
   55be4: 	srl	r3,r4,r11
   55be8: 	stw	r2,16(sp)
   55bec: 	movi	r7,2
   55bf0: 	stw	r3,20(sp)
   55bf4: 	br	55990 
   55bf8: 	movi	r18,32
   55bfc: 	mov	r12,zero
   55c00: 	br	556e4 
   55c04: 	srli	r2,r3,1
   55c08: 	movi	r4,31
   55c0c: 	sub	r4,r4,r11
   55c10: 	srl	r2,r2,r4
   55c14: 	sll	r6,r5,r11
   55c18: 	sll	r3,r3,r11
   55c1c: 	or	r6,r2,r6
   55c20: 	br	55b30 
   55c24: 	mov	r4,r2
   55c28: 	br	55b00 
   55c2c: 	sub	r5,r2,r9
   55c30: 	addi	r4,r4,2
   55c34: 	br	5586c 
   55c38: 	sub	r4,r6,r9
   55c3c: 	addi	r2,r2,2
   55c40: 	br	55bd8 
   55c44: 	sub	r5,r4,r9
   55c48: 	addi	r2,r2,2
   55c4c: 	br	5579c 
   55c50: 	sub	r6,r6,r9
   55c54: 	addi	r12,r12,2
   55c58: 	br	556e4 
   55c5c: 	slli	r4,r5,1
   55c60: 	movi	r6,31
   55c64: 	sub	r6,r6,r2
   55c68: 	sll	r4,r4,r6
   55c6c: 	srl	r2,r3,r2
   55c70: 	or	r2,r4,r2
   55c74: 	br	5562c 
   55c78: 	slli	r5,r5,1
   55c7c: 	movi	r4,31
   55c80: 	sub	r4,r4,r18
   55c84: 	sll	r4,r5,r4
   55c88: 	srl	r19,r3,r18
   55c8c: 	or	r19,r4,r19
   55c90: 	br	55640 
   55c94: 	mov	r6,r4
   55c98: 	br	556e4 
   55c9c: 	add	r4,r2,r4
   55ca0: 	add	r12,r4,r12
   55ca4: 	srli	r6,r12,16
   55ca8: 	andi	r5,r12,65535
   55cac: 	mul	r4,r5,r13
   55cb0: 	mul	r15,r6,r13
   55cb4: 	mul	r5,r5,r14
   55cb8: 	srli	fp,r4,16
   55cbc: 	andi	r4,r4,65535
   55cc0: 	add	r5,r5,r15
   55cc4: 	add	r5,r5,fp
   55cc8: 	slli	ra,r5,16
   55ccc: 	srli	fp,r5,16
   55cd0: 	sub	r4,r19,r4
   55cd4: 	sub	r4,r4,ra
   55cd8: 	sub	fp,r2,fp
   55cdc: 	cmpltu	r2,r19,r4
   55ce0: 	mul	r6,r6,r14
   55ce4: 	sub	r2,fp,r2
   55ce8: 	br	556c0 
