.global _dlstart
_dlstart:
	l.jal	1f
	 l.nop
1:	l.movhi	r16, gotpchi(_GLOBAL_OFFSET_TABLE_+0)
	l.ori	r16, r16, gotpclo(_GLOBAL_OFFSET_TABLE_+4)
	l.add	r16, r16, r9
	l.jal	plt(__reloc_self)
	 l.addi	r1, r1, -16

	l.lwz	r3, 16(r1)
	l.jal	plt(__dynlink)
	 l.addi	r4, r1, 20
	l.addi	r1, r1, 16

	l.lwz	r4, 0(r1)
1:	l.addi	r4, r4, -1
	l.lwz	r5, 4(r1)
	l.sfeqi	r5, -1
	l.bf	1b
	 l.addi	r1, r1, 4
	l.addi	r4, r4, 1
	l.sw	-4(r1), r4

	l.ori	r9, r3, 0
	l.jr	r9
	 l.ori	r3, r0, 0