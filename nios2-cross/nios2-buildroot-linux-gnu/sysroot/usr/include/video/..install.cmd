cmd_/home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/video/.install := /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/video ./include/uapi/video edid.h sisfb.h uvesafb.h; /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/video ./include/video ; /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/video ./include/generated/uapi/video ; for F in ; do echo "$(pound)include <asm-generic/$$F>" > /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/video/$$F; done; touch /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/video/.install
