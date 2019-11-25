CC=arm-linux-gnueabi-gcc
CFLAGS=-Os -Wall -Wextra
LDFLIBS=-L../lib/libev3api -lev3api -I../lib/libev3api -lpthread

EV3DUDER=../tools/ev3duder/ev3duder
OPTDUDER=--usb

.DEFAULT_GOAL=build

src=$(wildcard *.c)
base=$(basename $(src))
out=$(addsuffix .elf, $(base))
rbf=$(addsuffix .rbf, $(base))

upload=/media/card/myapps/

.PHONY: build
build: 
	@echo "\nBUILDING: $(src)"
	$(CC) $(src) -o $(out) $(CFLAGS) $(LDFLIBS) 

.PHONY: upload
upload: build
	@echo "\nUPLOADING: $(out)"
	@# upload .elf
	sudo $(EV3DUDER) $(OPTDUDER) up $(out) $(upload)$(base) 
	@# build .rbf menu entry from uploaded .elf
	sudo $(EV3DUDER) $(OPTDUDER) mkrbf $(upload)$(base) $(rbf) 
	@# upload .rbf
	sudo $(EV3DUDER) $(OPTDUDER) up $(rbf) $(upload)$(rbf) 

.PHONY:run
run: upload
	@echo "\nRUNNING: $(rbf)"
	sudo $(EV3DUDER) $(OPTDUDER) run $(upload)$(rbf) 

.PHONY: clean
clean:
	rm -f *.elf *.rbf
