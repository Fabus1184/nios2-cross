#include "io.h"

int main(){

	timer_clear();
	timer_repeat(true);
	timer_set_period(1000000);
	timer_start();

	while(1) {
		timer_wait();
		set_leds(get_leds() ^ 0b1111);
	}


	asm("br END");
	return 0;
}
