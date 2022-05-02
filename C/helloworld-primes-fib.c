unsigned long int __stack_chk_guard = 0x69420FF;

int __divsi3(int a, int b){
	int c;
	asm("div %[c], %[a], %[b]"
		: [c] "=r" (c)
		: [a] "r" (a), [b] "r" (b)
	);
	return c;
}

int __modsi3(int a, int b){
	return a - (b * (__divsi3(a, b)));
}

void __stack_chk_fail(void){
	asm("callr r0");
}

int pow(int base, int exp){
	int ret = 1;
	for(int i = 0; i < exp; i++) ret *= base;
	return ret;
}

int log(int n, int base){
	if(n < base) return 0;
	if(n == base) return 1;
	int ret = 0;
	while(pow(base, ret) <= n) ret++;
	return ret - 1;
}


void reverse(char *ptr, int size){
	char tmp[size];
	for(int i=0; i < size; i++) tmp[i] = ptr[i];
	for(int i=size - 1; i >= 0; i--) ptr[i] = tmp[i];
}

void itoa(int num, char *buf){
	int i = 0;
	int max = log(num, 10);
	for(; i <= log(num, 10); i++)
		buf[max - i] = '0' + ((num / pow(10, i)) % 10);
	buf[i] = 0;
}

void writeString(char *ptr){
	for(int i=0; ptr[i] != 0; i++)
		asm(
			"stb %[t], 0x864(r0)"
			: [t] "+r" (ptr[i])
		);
}

int fib(int n){
	if (n == 0) return 0;
	if (n == 1) return 1;
	return fib(n-2) + fib(n-1);
}

int sqrt(int n) {
	if(n < 0) return -1;
	for(int i = 0; ; i++)
		if (i * i > n)
			return n - 1;
}

int isPrime(int n){
	if(n < 2) return 0;
	for(int i = 2; i < sqrt(n); i++)
		if (n % i == 0)
			return 0;
	return 1;
}

int main() {
	char line[] = "\n-----------------\n";
	char hw[] = "Hello World!";
	char sep[] = ", ";
	char end[] = "END\n";
	
	writeString(hw);
	writeString(line);

	for(int i = 1; i < 200; i++) {
		if(isPrime(i)) {	
			char buf[4];
			itoa(i, buf);
			writeString(buf);
			writeString(sep);
		}
	}

	writeString(line);

	for(int i = 0; i < 20; i++){
		char buf[6];
		itoa(fib(i), buf);
		writeString(buf);
		writeString(sep);
	}

	writeString(line);
	writeString(end);

	asm(
		"br END\n"
	);
}
