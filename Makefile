process : process.o
	ld process.o -o process -I/lib64/ld-linux-x86-64.so.2 -lc
process.o : process.nasm
	nasm -f elf64 process.nasm -o process.o


clean :
	rm process.o
	rm process
