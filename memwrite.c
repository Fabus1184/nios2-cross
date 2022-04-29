__asm__(
	".data\n"
	"ARR: .skip 127"
);

void asciiToMem(char c, int addr){
	__asm__(
		"stw r4, ARR(r5)"
	);
}


int main(){
	int addr = 0x0;
	for (char c=0; c<127; c++){
		asciiToMem(c, addr + (8 * c));
	}
}
