#include "include/math.h"
#include "include/nioslib.h"
#include "include/stdlib.h"

int isPrime(int n) {
    if (n < 2)
        return 0;
    for (int i = 2; i < sqrt(n); i++)
        if (n % i == 0)
            return 0;
    return 1;
}

int main() {
    char line[] = "\n-----------------\n";
    char hw[] = "Hello World!";
    char sep[] = ", ";
    char end[] = "END\n";

    writeString(hw);
    writeString(line);

    for (int i = 1; i < 200; i++) {
        if (isPrime(i)) {
            char buf[4];
            itoa(i, buf);
            writeString(buf);
            writeString(sep);
        }
    }

    writeString(line);

    for (int i = 0; i < 20; i++) {
        char buf[6];
        itoa(fib(i), buf);
        writeString(buf);
        writeString(sep);
    }

    writeString(line);
    writeString(end);

    asm volatile("br END\n");
    return 0;
}
