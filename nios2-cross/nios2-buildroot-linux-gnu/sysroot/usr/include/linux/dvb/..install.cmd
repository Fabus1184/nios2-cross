cmd_/home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/dvb/.install := /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/dvb ./include/uapi/linux/dvb audio.h ca.h dmx.h frontend.h net.h osd.h version.h video.h; /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/dvb ./include/linux/dvb ; /bin/bash scripts/headers_install.sh /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/dvb ./include/generated/uapi/linux/dvb ; for F in ; do echo "$(pound)include <asm-generic/$$F>" > /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/dvb/$$F; done; touch /home/fabian/Downloads/nios2--glibc--stable-2021.11-1/nios2-buildroot-linux-gnu/sysroot/usr/include/linux/dvb/.install
