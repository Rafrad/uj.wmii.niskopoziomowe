all: starter example


# Static jest potrzebne jeżeli domyślnie linkuje jako PIE
starter: starter.o  asm64_io.o driver64.o
#	gcc -fno-pie driver64.o asm64_io.o starter.o -o starter	
	gcc -fno-pie driver64.o asm64_io.o starter.o -o starter	-static
		
starter.o: starter.asm 
	nasm -f elf64 $< -o $@


asm64_io.o: asm64_io.asm
	nasm -f elf64 asm64_io.asm -o asm64_io.o
	
driver64.o: driver64.c asm64_io.inc
	gcc -fno-pie -c driver64.c -o driver64.o 
	
example.o: example.asm
	nasm -f elf64 example.asm  -o example.o

example: driver64.o asm64_io.o example.o
#	gcc -fno-pie driver64.o asm64_io.o example.o  -o example	
	gcc -fno-pie driver64.o asm64_io.o example.o  -o example -static	
	

.PHONY: clean
clean:
	rm -f *.o starter example
