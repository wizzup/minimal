.DEFAULT_GOAL := run
.PHONY: check run clean

hello:
	bun build ./hello.ts --compile --outfile ./hello

check:
	bun test .

run: hello
	./hello    

clean:
	rm ./hello
