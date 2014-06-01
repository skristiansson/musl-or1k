.global _longjmp
.global longjmp
.type   _longjmp,@function
.type   longjmp,@function
_longjmp:
longjmp:
	l.sfeqi	r4, 0
	l.bnf	1f
	 l.addi	r11, r4,0
	l.ori	r11, r0, 1
1:	l.lwz	r1, 4(r3)
	l.lwz	r2, 8(r3)
/*	l.lwz	r3, 12(r3)*/
	l.lwz	r4, 16(r3)
	l.lwz	r5, 20(r3)
	l.lwz	r6, 24(r3)
	l.lwz	r7, 28(r3)
	l.lwz	r8, 32(r3)
	l.lwz	r9, 36(r3)
	l.lwz	r10, 40(r3)
/*	l.lwz	r11, 44(r3)*/
	l.lwz	r12, 48(r3)
	l.lwz	r13, 52(r3)
	l.lwz	r14, 56(r3)
	l.lwz	r15, 60(r3)
	l.lwz	r16, 64(r3)
	l.lwz	r17, 68(r3)
	l.lwz	r18, 72(r3)
	l.lwz	r19, 76(r3)
	l.lwz	r20, 80(r3)
	l.lwz	r21, 84(r3)
	l.lwz	r22, 88(r3)
	l.lwz	r23, 92(r3)
	l.lwz	r24, 96(r3)
	l.lwz	r25, 100(r3)
	l.lwz	r26, 104(r3)
	l.lwz	r27, 108(r3)
	l.lwz	r28, 112(r3)
	l.lwz	r29, 116(r3)
	l.lwz	r30, 120(r3)
	l.lwz	r31, 124(r3)
	l.jr	r9
	 l.nop
