cmd_/home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/wimax/.install := /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/wimax ./include/uapi/linux/wimax i2400m.h; /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/wimax ./include/linux/wimax ; /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/wimax ./include/generated/uapi/linux/wimax ; for F in ; do echo "$(pound)include <asm-generic/$$F>" > /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/wimax/$$F; done; touch /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/wimax/.install
