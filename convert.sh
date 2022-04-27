
#!/bin/bash

./nios2-cross/bin/nios2-buildroot-linux-gnu-gcc-10.3.0.br_real -S $1

readonly out=$(echo `basename $1` | cut -d "." -f1 ).s

sed -i "s/fp/r28/g" $out
sed -i "s/sp/r27/g" $out
sed -i "s/gp/r26/g" $out
sed -i "s/\.L/L/g" $out
sed -i "s/\.file.*//g" $out
sed -i "s/\.align.*//g" $out
sed -i "s/\.type.*//g" $out
sed -i "s/\.size.*//g" $out
sed -i "s/\.ident.*//g" $out
sed -i "s/\.section//g" $out
sed -i "s/\t\t/\t/g" $out
sed -i "s/\t\t/\t/g" $out
sed -i "s/\t\t/\t/g" $out
sed -i "s/\t\t/\t/g" $out
