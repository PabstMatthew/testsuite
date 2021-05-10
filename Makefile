WATS    := $(wildcard *.wast)
SRCS    := $(patsubst %.wast,%.wasm,$(WATS))
OBJS    := $(patsubst %.wasm,%.o,$(SRCS))
EXES		:= $(patsubst %.o,%.exe,$(OBJS)) 

%.wasm : %.wast
	wat2wasm $< -o $@

%.o : %.wasm
	./wamrc --format=object -o $@ $<

%.exe : %.o
	clang $< wamr-shim.o -o $@

all: $(EXES)
	clang -c wamr-shim.S

clean:
	rm *.wasm
	rm *.o
	rm *.exe
