CC=gcc
CFLAGS=-Wall -g
NASMCFLAGS=-fno-pie -no-pie
NASMEXECUTABLE=matMul
CEXECUTABLE =raw
ALL: matMul raw
matMul: matMul.o
	$(CC) $(NASMCFLAGS) matMul.o -o $(NASMEXECUTABLE)

matMul.o: matMul.asm
	printf "\n\nNASM ASSEMBLY EXECUTION\n\n"
	printf "\n\nASSEMBLY CODE:\n\n"
	cat matMul.asm
	nasm -gdwarf -f elf64 matMul.asm

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