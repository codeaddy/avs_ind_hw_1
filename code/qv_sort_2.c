#include "stdio.h"
#include "stdlib.h"

void read(int *a, int n, char *argv[]) {
	for (int i = 0; i < n; i++) {
		a[i] = atoi(argv[i + 2]);
	}
}

void sort(int *a, int n) {
	for (int i = 0; i < n; i++) {
		for (int j = 0; j + 1 < n; j++) {
			if (a[j] > a[j + 1]) {
				int temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
			}
		}
	}
}

void print(int *a, int n) {
	for (int i = 0; i < n; i++) {
		printf("%d ", a[i]);
	}
}

int main(int argc, char *argv[]) {
	int *a;
	int n = argc - 2;

	a = (int *)malloc(n * sizeof(int));

	read(a, n, argv);
	printf("read array: ");
	print(a, n);
	printf("\n");

	sort(a, n);
	printf("    result: ");
	print(a, n);
	printf("\n");

	free(a);
	return 0;
}