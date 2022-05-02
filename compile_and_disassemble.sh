#!/bin/bash

set -e

[[ -z $1 ]] && exit 1

readonly name=$(echo `basename $1` | cut -d "." -f1 )

./nios2-cross/bin/nios2-linux-gcc -Wall $1 -o $name.out \
-Wl,-Tdata=0x30000 -Wl,-Ttext=0x20000 -march=r1 -O0 -nostdlib -lgcc
#-nostdlib -nodefaultlibs -fno-builtin-memcpy
#-fno-builtin-memset \
#-fno-tree-loop-distribute-patterns \
#-fno-builtin -ffreestanding -static -fstack-reuse=all \
#-fno-plt -Wl,-Tdata=0x31000 -Wl,-Ttext=0x30000 \
#./nios2-cross/bin/nios2-linux-objcopy -O binary -j .text $name.out $name.hex
#./nios2-cross/bin/nios2-linux-objdump -d -s -S $name.out

./nios2-cross/bin/nios2-linux-objdump -d -S $name.out
./nios2-cross/bin/nios2-linux-objdump --disassemble=main -S $name.out \
| grep -oE "[0-9a-f]{8}" \
| sed "s/^/0x/g" | tr '\n' ',' \
| xclip -sel clipboard

#program=$(hexdump -e '16/4 "0x%02x, " ""' $name.hex | sed "s/,\ 0x\  //g" | rev | cut -d "," -f2- | rev)

