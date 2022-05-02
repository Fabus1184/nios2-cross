	.file	"test.c"
	.section	.text
	.align	2
	.global	get_leds
	.type	get_leds, @function
get_leds:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
#APP
#  7 "io.h" 1
	ldbio r2, 0x810(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(fp)
	ldbu	r2, -1(fp)
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	get_leds, .-get_leds
	.align	2
	.global	set_leds
	.type	set_leds, @function
set_leds:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
	mov	r2, r4
	stb	r2, -4(fp)
	ldbu	r2, -4(fp)
#APP
#  15 "io.h" 1
	stbio r2, 0x810(r0)
#  0 "" 2
#NO_APP
	nop
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	set_leds, .-set_leds
	.align	2
	.global	get_buttons
	.type	get_buttons, @function
get_buttons:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
#APP
#  24 "io.h" 1
	ldbio r2, 0x840(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(fp)
	ldbu	r2, -1(fp)
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	get_buttons, .-get_buttons
	.align	2
	.global	get_dips
	.type	get_dips, @function
get_dips:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
#APP
#  33 "io.h" 1
	ldbio r2, 0x850(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(fp)
	ldbu	r2, -1(fp)
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	get_dips, .-get_dips
	.align	2
	.global	timer_out
	.type	timer_out, @function
timer_out:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
#APP
#  42 "io.h" 1
	ldbio r2, 0x820(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(fp)
	ldbu	r2, -1(fp)
	andi	r2, r2, 0xff
	andi	r2, r2, 1
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	timer_out, .-timer_out
	.align	2
	.global	timer_clear
	.type	timer_clear, @function
timer_clear:
	addi	sp, sp, -4
	stw	fp, 0(sp)
	mov	fp, sp
#APP
#  50 "io.h" 1
	stwio r0, 0x820(r0)
#  0 "" 2
#NO_APP
	nop
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	timer_clear, .-timer_clear
	.align	2
	.global	timer_repeat
	.type	timer_repeat, @function
timer_repeat:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
	stw	r4, -4(fp)
	ldw	r2, -4(fp)
	beq	r2, zero, .L12
	ldw	r2, -4(fp)
#APP
#  55 "io.h" 1
	ldbio r2, 0x824(r0)
andi r2, r2, 4
#  0 "" 2
#NO_APP
	br	.L14
.L12:
	ldw	r2, -4(fp)
#APP
#  63 "io.h" 1
	ldbio r2, 0x824(r0)
andi r2, r2, 0
#  0 "" 2
#NO_APP
.L14:
	nop
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	timer_repeat, .-timer_repeat
	.align	2
	.global	timer_start
	.type	timer_start, @function
timer_start:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
#APP
#  74 "io.h" 1
	ldbio r2, 0x824(r0)
ori r2, r2, 1
stbio r2, 0x824(r0)
#  0 "" 2
#NO_APP
	stw	r2, -4(fp)
	nop
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	timer_start, .-timer_start
	.align	2
	.global	timer_stop
	.type	timer_stop, @function
timer_stop:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
#APP
#  86 "io.h" 1
	ldbio r2, 0x824(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(fp)
	ldbu	r2, -1(fp)
	andi	r2, r2, 6
	stb	r2, -1(fp)
	ldbu	r2, -1(fp)
#APP
#  93 "io.h" 1
	stbio r2, 0x824(r0)
#  0 "" 2
#NO_APP
	nop
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	timer_stop, .-timer_stop
	.align	2
	.global	timer_set_period
	.type	timer_set_period, @function
timer_set_period:
	addi	sp, sp, -20
	stw	fp, 16(sp)
	addi	fp, sp, 16
	stw	r4, -16(fp)
	stw	r5, -12(fp)
	ldw	r4, -12(fp)
	srl	r2, r4, zero
	mov	r3, zero
	stw	r2, -8(fp)
	ldw	r2, -16(fp)
	stw	r2, -4(fp)
	ldw	r2, -4(fp)
	ldw	r3, -8(fp)
#APP
#  104 "io.h" 1
	stwio r2, 0x828(r0)
stwio r3, 0x82C(r0)
#  0 "" 2
#NO_APP
	nop
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	timer_set_period, .-timer_set_period
	.align	2
	.global	timer_get_snapshot
	.type	timer_get_snapshot, @function
timer_get_snapshot:
	addi	sp, sp, -20
	stw	fp, 16(sp)
	addi	fp, sp, 16
#APP
#  117 "io.h" 1
	stwio r0, 0x830(r0)
ldwio r5, 0x830(r0)
ldwio r4, 0x834(r0)
#  0 "" 2
#NO_APP
	stw	r5, -16(fp)
	stw	r4, -12(fp)
	ldw	r4, -12(fp)
	stw	r4, -8(fp)
	srai	r4, r4, 31
	stw	r4, -4(fp)
	ldw	r4, -8(fp)
	sll	r3, r4, zero
	mov	r2, zero
	stw	r2, -8(fp)
	stw	r3, -4(fp)
	ldw	r2, -16(fp)
	mov	r6, r2
	srai	r2, r2, 31
	mov	r7, r2
	ldw	r4, -8(fp)
	ldw	r5, -4(fp)
	add	r2, r4, r6
	cmpltu	r8, r2, r4
	add	r3, r5, r7
	add	r4, r8, r3
	mov	r3, r4
	stw	r2, -8(fp)
	stw	r3, -4(fp)
	ldw	r2, -8(fp)
	ldw	r3, -4(fp)
	mov	r4, r2
	mov	r5, r3
	mov	r2, r4
	mov	r3, r5
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	timer_get_snapshot, .-timer_get_snapshot
	.align	2
	.global	timer_running
	.type	timer_running, @function
timer_running:
	addi	sp, sp, -8
	stw	fp, 4(sp)
	addi	fp, sp, 4
#APP
#  135 "io.h" 1
	ldbio r2, 0x820(r0)
#  0 "" 2
#NO_APP
	stb	r2, -1(fp)
	ldbu	r2, -1(fp)
	andi	r2, r2, 0xff
	andi	r2, r2, 1
	mov	sp, fp
	ldw	fp, 0(sp)
	addi	sp, sp, 4
	ret
	.size	timer_running, .-timer_running
	.align	2
	.global	timer_wait
	.type	timer_wait, @function
timer_wait:
	addi	sp, sp, -8
	stw	ra, 4(sp)
	stw	fp, 0(sp)
	mov	fp, sp
	br	.L23
.L24:
#APP
#  144 "io.h" 1
	nop
#  0 "" 2
#NO_APP
.L23:
	call	timer_running
	bne	r2, zero, .L24
	nop
	nop
	mov	sp, fp
	ldw	ra, 4(sp)
	ldw	fp, 0(sp)
	addi	sp, sp, 8
	ret
	.size	timer_wait, .-timer_wait
	.align	2
	.global	main
	.type	main, @function
main:
	addi	sp, sp, -8
	stw	ra, 4(sp)
	stw	fp, 0(sp)
	mov	fp, sp
	call	timer_clear
	movi	r4, 1
	call	timer_repeat
	movhi	r4, 15
	addi	r4, r4, 16960
	mov	r5, zero
	call	timer_set_period
	call	timer_start
.L26:
	call	timer_wait
	call	get_leds
	xori	r2, r2, 15
	andi	r2, r2, 255
	xori	r2, r2, 128
	addi	r2, r2, -128
	mov	r4, r2
	call	set_leds
	br	.L26
	.size	main, .-main
	.ident	"GCC: (Buildroot toolchains.bootlin.com-2021.11-1) 10.3.0"
