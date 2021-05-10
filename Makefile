WATS    := $(wildcard *.wast)
SRCS    := $(patsubst %.wast,%.wasm,$(WATS))
OBJS    := $(patsubst %.wasm,%.o,$(SRCS))
EXES		:= $(patsubst %.o,%.exe,$(OBJS)) 

all: shim target

%.wasm : %.wast
	wat2wasm $< -o $@

%.o : %.wasm
	./wamrc --format=object -o $@ $<

%.exe : %.o
	clang $< wamr-shim.o -o $@

shim: 
	clang -c wamr-shim.S

target: $(EXES)

clean:
	rm -f *.wasm
	rm -f *.o
	rm -f *.exe
