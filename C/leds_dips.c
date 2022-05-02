#include "include/io.h"
#include "include/nioslib.h"
#include "include/stdlib.h"

int main() {
    char k[5];
    char sep[] = " ";
    char nl[] = "\n";
    char dips = 0xFF;

    while (true) {
        char tmp = get_dips();
        if (dips != tmp)
            dips = tmp;
        else
            continue;

        set_leds(dips);

        int d1 = dips & 0b1;
        int d2 = (dips & 0b10) >> 1;
        int d3 = (dips & 0b100) >> 2;
        int d4 = (dips & 0b1000) >> 3;

        itoa(d1, k);
        writeString(k);
        writeString(sep);

        itoa(d2, k);
        writeString(k);
        writeString(sep);

        itoa(d3, k);
        writeString(k);
        writeString(sep);

        itoa(d4, k);
        writeString(k);
        writeString(sep);

        writeString(nl);
    }

    asm("br END");
    return 0;
}
