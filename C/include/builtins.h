#pragma once

unsigned long int __stack_chk_guard = 0x69420FF;

void __stack_chk_fail(void)
{
    asm volatile("callr r0");
}


int __divsi3(int a, int b) {
    int c;
    asm volatile("div %[c], %[a], %[b]": [c]
        "=r"(c): [a]
        "r"(a), [b]
        "r"(b));
    return c;
}

// VERY BAD !!!
unsigned int __udivsi3 (unsigned int a, unsigned int b) {
	return __divsi3(a, b);
}

int __modsi3(int a, int b) {
    return a - (b * (__divsi3(a, b)));
}

