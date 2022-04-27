int main() {
	int i, c = 42;
	int a[8] = {1, 2, 3, 4, 5, 6, 7, 8};
	int b[8] = {0, 0, 0, 0, 0, 0, 0, 0};

	for(i = 0; i < 8; i++) b[i] = a[i] + c;
}
