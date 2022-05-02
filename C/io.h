#pragma once

#include "bool.h"

char get_leds() {
	char ret;
	asm volatile(
		"ldbio %[a], 0x810(r0)"
		: [a] "=r" (ret)
	);
	return ret;
}

void set_leds(char mask) {
	asm volatile(
		"stbio %[a], 0x810(r0)"
		:
		: [a] "r" (mask)
	);
}

char get_buttons() {
	char ret;
	asm volatile(
		"ldbio %[a], 0x840(r0)"
		: [a] "=r" (ret)
	);
	return ret;
}

char get_dips(){
	char ret;
	asm volatile(
		"ldbio %[a], 0x850(r0)"
		: [a] "=r" (ret)
	);
	return ret;
}

bool timer_out() {
	char ret;
	asm volatile(
		"ldbio %[a], 0x820(r0)"
		: [a] "=r" (ret)
	);
	return ret & 0x1;
}

void timer_clear() {
	asm volatile("stwio r0, 0x820(r0)");
}

void timer_repeat(bool bit) {
	if(bit)
		asm volatile(
			"ldbio %0, 0x824(r0)"
			"\n"
			"andi %0, %0, 4"
			:
			: [a] "r" (bit)
		);
	else
		asm volatile(
			"ldbio %0, 0x824(r0)"
			"\n"
			"andi %0, %0, 0"
			:
			: [a] "r" (bit)
		);
}

void timer_start() {
	int ret;
	asm volatile(
		"ldbio %0, 0x824(r0)"
		"\n"
		"ori %0, %0, 1"
		"\n"
		"stbio %0, 0x824(r0)"
		: "=r" (ret)
	);
}

void timer_stop() {
	char contents;
	asm volatile(
		"ldbio %[a], 0x824(r0)"
		: [a] "=r" (contents)
	);

	contents &= 0b110;

	asm volatile(
		"stbio %[a], 0x824(r0)"
		:
		: [a] "r" (contents)
	);
}

void timer_set_period(unsigned long long int n) {
	int hi = n >> 32;
	int lo = (int) n;
	
	asm volatile(
		"stwio %[a], 0x828(r0)"
		"\n"
		"stwio %[b], 0x82C(r0)"
		:
		: [a] "r" (lo), [b] "r" (hi)
	);
}

unsigned long long int timer_get_snapshot(){
	unsigned long long int ret;
	int hi, lo;

	asm volatile(
		"stwio r0, 0x830(r0)"
		"\n"
		"ldwio %[a], 0x830(r0)"
		"\n"
		"ldwio %[b], 0x834(r0)"
		: [a] "=r" (lo), [b] "=r" (hi)
	);

	ret = hi;
	ret <<= 32;
	ret += lo;

	return ret;
}

bool timer_running(){
	char c;
	asm volatile(
		"ldbio %[a], 0x820(r0)"
		: [a] "=r" (c)
	);
	return c & 0b01;
}

void timer_wait(){
	while(timer_running())
		asm volatile("nop");
}
