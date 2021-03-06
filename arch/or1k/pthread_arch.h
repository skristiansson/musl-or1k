/* or1k use variant I, but with the twist that tp points to the end of TCB */
static inline struct pthread *__pthread_self()
{
#ifdef __clang__
	char *tp;
	__asm__ __volatile__ ("l.ori %0, r10, 0" : "=r" (self) );
#else
	register char *tp __asm__("r10");
#endif
	return (struct pthread *) (tp - sizeof(struct pthread));
}

#define TLS_ABOVE_TP
#define TP_ADJ(p) ((char *)(p) + sizeof(struct pthread))

/* word-offset to 'pc' in mcontext_t */
#define CANCEL_REG_IP 32
