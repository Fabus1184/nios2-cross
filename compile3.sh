#!/bin/bash

set -e

[[ -z $1 ]] && exit 1

readonly name=$(echo `basename $1` | cut -d "." -f1 )

#./nios2-cross/bin/nios2-linux-gcc -O0 -nostdlib -lgcc -S -Wall $1 -march=r2
#./nios2-cross/bin/nios2-linux-gcc -fverbose-asm -ffreestanding -fno-builtin -nostdlib -O0 -S -Wall $1 -march=r1
./nios2-cross/bin/nios2-linux-gcc -ffreestanding -fno-builtin -nostdlib -O2 -S -Wall $1 -march=r1

# 	.file	"test.c"
# 	.section	.text
# 	.global	__stack_chk_guard
# 	.section	.sdata,"aws"
# 	.align	2
# 	.type	__stack_chk_guard, @object
# 	.size	__stack_chk_guard, 4
# __stack_chk_guard:
# 	.long	110371071
# 	.section	.text
# 	.align	2
# 	.global	__stack_chk_fail
# 	.type	__stack_chk_fail, @function
# __stack_chk_fail:
# 	addi	sp, sp, -4
# 	stw	fp, 0(sp)

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
	sed "s/[\t]+/\t/g"
)

end=$(echo -e "\n\n.data\n\t\t.skip 0xFF7C\n.end\n")
printf "%s" "${out}" "$end" | xclip -sel clipboard
