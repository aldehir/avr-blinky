MMCU=atmega32u4
PROGRAMMER=avr109
SERIAL=/dev/ttyACM0

.PHONY: all build flash clean

all: build

build: blinky.hex

blinky.elf: blinky.c
	avr-gcc -O2 -mmcu=$(MMCU) $^ -o $@

%.hex: %.elf
	avr-objcopy -j .text -j .data -O ihex $< $@

flash: blinky.hex
	avrdude -p $(MMCU) -c $(PROGRAMMER) -P $(SERIAL) -U flash:w:$<

clean:
	rm -f *.elf *.hex
