.global __setjmp
.global _setjmp
.global setjmp
.type __setjmp,@function
.type _setjmp,@function
.type setjmp,@function
__setjmp:
_setjmp:
setjmp:
	l.sw	4(r3), r1
	l.sw	8(r3), r2
/*	l.sw	12(r3), r3*/
	l.sw	16(r3), r4
	l.sw	20(r3), r5
	l.sw	24(r3), r6
	l.sw	28(r3), r7
	l.sw	32(r3), r8
	l.sw	36(r3), r9
	l.sw	40(r3), r10
	l.sw	44(r3), r11
	l.sw	48(r3), r12
	l.sw	52(r3), r13
	l.sw	56(r3), r14
	l.sw	60(r3), r15
	l.sw	64(r3), r16
	l.sw	68(r3), r17
	l.sw	72(r3), r18
	l.sw	76(r3), r19
	l.sw	80(r3), r20
	l.sw	84(r3), r21
	l.sw	88(r3), r22
	l.sw	92(r3), r23
	l.sw	96(r3), r24
	l.sw	100(r3), r25
	l.sw	104(r3), r26
	l.sw	108(r3), r27
	l.sw	112(r3), r28
	l.sw	116(r3), r29
	l.sw	120(r3), r30
	l.sw	124(r3), r31
	l.jr	r9
	 l.ori	r11,r0,0