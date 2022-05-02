#pragma once

char get_leds() {
    char ret;
    asm volatile(
        "ldbio %[a], 0x810(r0)": [a]
        "=r"(ret)
    );
    return ret;
}

void set_leds(char mask) {
    asm volatile(
        "stbio %[a], 0x810(r0)":
        : [a]
        "r"(mask)
    );
}

char get_buttons() {
    char ret;
    asm volatile(
        "ldbio %[a], 0x840(r0)": [a]
        "=r"(ret)
    );
    return ret;
}

char get_dips() {
    char ret;
    asm volatile(
        "ldbio %[a], 0x850(r0)": [a]
        "=r"(ret)
    );
    return ret;
}
