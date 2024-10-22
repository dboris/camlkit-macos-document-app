.PHONY: build clean

build:
	opam exec -- dune build

clean:
	opam exec -- dune clean
