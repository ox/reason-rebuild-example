REB_FLAGS = -use-ocamlfind -cflag -g -cflag -bin-annot -I src -I lib
REB = rebuild $(REB_FLAGS)
OUT_NAME = Hello
OUT_BYTE = $(OUT_NAME).byte
OUT_NATIVE = $(OUT_NAME).native

.PHONY: all clean byte native profile debug

all: native byte

clean:
	$(REB) -clean

native:
	$(REB) $(OUT_NATIVE)

byte:
	$(REB) $(OUT_BYTE)

profile:
	$(REB) -tag profile $(OUT_NATIVE)

debug:
	$(REB) -tag debug $(OUT_BYTE)
	# debug with https://github.com/reasonml/red:
	# red $(OUT_BYTE)
