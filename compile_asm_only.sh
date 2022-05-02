#!/bin/bash
set -e
set -v

[[ -z $1 ]] && exit 1

readonly OPTIM="-O2"
readonly DIR="asm"
readonly PROGNAME=$DIR/$(echo `basePROGNAME $1` | cut -d "." -f1 )
OPTS="-ffreestanding -fno-builtin -nostdlib -march=r1 -Wall -S "
OPTS+="-O2 "

#OPTS+="-fverbose-asm "

./nios2-cross/bin/nios2-linux-gcc $VERBOSE_ASM $OPTIM $OPTS $1 -o $PROGNAME.s

readonly prog=$(<$PROGNAME.s)

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
printf "%s" "${out}" "$end" > $PROGNAME.s
