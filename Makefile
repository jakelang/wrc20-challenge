all: main.wast

main.wast:
	clang -emit-llvm --target=wasm32-unknown-unknown-elf -c -O3 -o main.bc main.c
	llc -o main.s main.bc
	s2wasm -o main.wast main.s

clean:
	rm -f *.wast
	rm -f *.bc
	rm -f *.s
