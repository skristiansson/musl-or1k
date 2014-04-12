#include <string.h>
#include <elf.h>
#include <endian.h>

#define LDSO_ARCH "or1k"

#define IS_COPY(x) ((x)==R_OR1K_COPY)
#define IS_PLT(x) ((x)==R_OR1K_JUMP_SLOT)

static inline void do_single_reloc(
	struct dso *self, unsigned char *base_addr,
	size_t *reloc_addr, int type, size_t addend,
	Sym *sym, size_t sym_size,
	struct symdef def, size_t sym_val)
{
	switch(type) {
	case R_OR1K_GLOB_DAT:
	case R_OR1K_JMP_SLOT:
		*reloc_addr = sym_val + addend;
		break;
	case R_OR1K_RELATIVE:
		*reloc_addr = (size_t)base_addr + addend;
		break;
	case R_OR1K_COPY:
		memcpy(reloc_addr, (void *)sym_val, sym_size);
		break;
	case R_OR1K_TLS_DTPMOD:
		*reloc_addr = def.dso ? def.dso->tls_id : self->tls_id;
		break;
	case R_OR1K_TLS_DTPOFF:
		*reloc_addr = def.sym->st_value + addend;
		break;
	}
}

#include "syscall.h"
void __reloc_self(int c, size_t *a, size_t *dynv)
{
	char dot = '.', ex = 'x';
	char *base;
	size_t t[20], n;
	for (a+=c+1; *a; a++);
	for (a++; *a; a+=2) if (*a<20) t[*a] = a[1];
	base = (char *)t[AT_BASE];
	if (!base) base = (char *)(t[AT_PHDR] & -t[AT_PAGESZ]);
	for (a=dynv; *a; a+=2) if (*a<20) t[*a] = a[1];
	n = t[DT_RELASZ];
	for (a=(void *)(base+t[DT_RELA]); n; a+=3, n-=12)
		if (a[1]%256 == R_OR1K_RELATIVE)
			*(size_t *)(base+a[0]) = (size_t)base + a[2];
}
