#pragma once

#include "math.h"

void itoa(int num, char *buf) {
    int i = 0;
    int max = log(num, 10);
    for (; i <= log(num, 10); i++)
        buf[max - i] = '0' + ((num / pow(10, i)) % 10);
    buf[i] = 0;
}
