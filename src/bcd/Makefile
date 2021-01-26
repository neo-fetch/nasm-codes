CC=gcc
CFLAGS=-Wall -g
NASMCFLAGS=-fno-pie -no-pie
NASMEXECUTABLE=bcd
CEXECUTABLE =raw
ALL: bcd raw
bcd: bcd.o
	$(CC) $(NASMCFLAGS) bcd.o -o $(NASMEXECUTABLE)

bcd.o: bcd.asm
	printf "\n\nNASM ASSEMBLY EXECUTION\n\n"
	printf "\n\nASSEMBLY CODE:\n\n"
	cat bcd.asm
	nasm -gdwarf -f elf64 bcd.asm

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