#pragma once

#include "builtins.h"

typedef enum {
    false = 0,
        true = 1,
}
bool;

void reverse(char * ptr, int size) {
    char tmp[size];
    for (int i = 0; i < size; i++)
        tmp[i] = ptr[i];
    for (int i = size - 1; i >= 0; i--)
        ptr[i] = tmp[i];
}

void writeString(char * ptr) {
    for (int i = 0; ptr[i] != 0; i++)
        asm volatile("stb %[t], 0x864(r0)": [t]
            "+r"(ptr[i]));
}

int fib(int n) {
    if (n == 0)
        return 0;
    if (n == 1)
        return 1;
    return fib(n - 2) + fib(n - 1);
}
