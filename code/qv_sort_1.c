#include "stdio.h"
#include "stdlib.h"

int main(int argc, char *argv[]) {
	int *a;
	int n = argc - 1;

	a = (int *)malloc(n * sizeof(int));

	for (int i = 0; i < n; i++) {
		a[i] = atoi(argv[i + 1]);
	}

	for (int i = 0; i < n; i++) {
		for (int j = 0; j + 1 < n; j++) {
			if (a[j] > a[j + 1]) {
				int temp = a[j];
				a[j] = a[j + 1];
				a[j + 1] = temp;
			}
		}
	}

	for (int i = 0; i < n; i++) {
		printf("%d ", a[i]);
	}

	free(a);
	return 0;
}