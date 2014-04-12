__asm__("\
.global _start \n\
.align  4 \n\
_start: \n\
	l.ori r2, r0, 0 \n\
	l.ori r4, r1, 0 \n\
	l.andi r1, r1, -8 \n\
	l.addi r1, r1, -8 \n\
	l.jal __cstart \n\
	 l.nop \n\
");
