CC=gcc
CFLAGS=-Wall -g
NASMCFLAGS=-fno-pie -no-pie
NASMEXECUTABLE=ncr
CEXECUTABLE =raw
ALL: ncr raw
ncr: ncr.o
	$(CC) $(NASMCFLAGS) ncr.o -o $(NASMEXECUTABLE)

ncr.o: ncr.asm
	printf "\n\nNASM ASSEMBLY EXECUTION\n\n"
	printf "\n\nASSEMBLY CODE:\n\n"
	cat ncr.asm
	nasm -gdwarf -f elf64 ncr.asm

raw: raw.c
	printf "\n\nNORMAL C CODE USED FOR ANALOGY:\n\n"
	cat raw.c
	$(CC) $(CFLAGS) raw.c -o $(CEXECUTABLE)
clean:
	rm -rf *.o *.gch $(NASMEXECUTABLE) $(CEXECUTABLE)
leaksNASM:
	valgrind --leak-check=yes ./$(NASMEXECUTABLE)
leaksC:
	valgrind --leak-check=yes ./$(CEXECUTABLE)