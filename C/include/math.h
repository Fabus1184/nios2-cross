#pragma once

int pow(int base, int exp) {
    int ret = 1;
    for (int i = 0; i < exp; i++)
        ret *= base;
    return ret;
}

int log(int n, int base) {
    if (n < base)
        return 0;
    if (n == base)
        return 1;
    int ret = 0;
    while (pow(base, ret) <= n)
        ret++;
    return ret - 1;
}

int sqrt(int n) {
    if (n < 0)
        return -1;
    for (int i = 0;; i++)
        if (i * i > n)
            return n - 1;
}
