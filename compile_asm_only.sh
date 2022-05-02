#!/bin/bash
set -e
set -v

[[ -z $1 ]] && exit 1

readonly path="asm"
readonly name=$path/$(echo `basename $1` | cut -d "." -f1 )

#./nios2-cross/bin/nios2-linux-gcc -O0 -nostdlib -lgcc -S -Wall $1 -march=r2
#./nios2-cross/bin/nios2-linux-gcc -fverbose-asm -ffreestanding -fno-builtin -nostdlib -O0 -S -Wall $1 -march=r1
./nios2-cross/bin/nios2-linux-gcc -ffreestanding -fno-builtin -nostdlib -O0 -S -Wall $1 -march=r1 -o $name.s

readonly prog=$(<$name.s)

out=$(echo "${prog}" |\
	grep -v ".file" |\
	grep -v ".section" |\
	grep -v ".align" |\
	grep -v ".type" |\
	grep -v ".ident" |\
	grep -v ".size" |\
	grep -v "^#" |\
	grep -Ev "^[^[a-z]]+#" |\
	sed "s/\.long/\.word/g" |\
	sed "s/\.zero/\.skip/g" |\
	sed "s/\.L/L/g" |\
	sed "s/sp/r27/g" |\
	sed "s/fp/r28/g" |\
	sed "s/gp/r26/g" |\
	sed "s/[\t]+/\t/g" |\
	tr -s '\t'
)

end=$(echo -e "\nEND:\n\n.data\n\t\t.skip 0xFF7C\n.end\n")
printf "%s" "${out}" "$end" | xclip -sel clipboard
printf "%s" "${out}" "$end" > $name.s
