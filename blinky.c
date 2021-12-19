#include <avr/io.h>

#define F_CPU 16000000UL
#include <util/delay.h>

int main() {
	DDRB = _BV(PB0);

	while (1) {
		PINB |= _BV(PB0);
		_delay_ms(500);
	}

	return 1;
}
