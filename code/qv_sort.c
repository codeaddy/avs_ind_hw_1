#include "stdio.h"
#include "stdlib.h"
#include "time.h"

void read(int *a, int n, FILE *ptr) {
	for (int i = 0; i < n; i++) {
		fscanf(ptr, "%d", &a[i]);
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

void print(int *a, int n, FILE *ptr) {
	for (int i = 0; i < n; i++) {
		fprintf(ptr, "%d ", a[i]);
	}
}

int main(int argc, char *argv[]) {
	char *file_in = argv[1];
	char *file_out = argv[2];

	int *a;
	int n;

	FILE *fin_ptr;
	fin_ptr = fopen(file_in, "r");
	fscanf(fin_ptr, "%d", &n);

	a = (int *)malloc(n * sizeof(int));

	read(a, n, fin_ptr);
	fclose(fin_ptr);

	FILE *fout_ptr;
	fout_ptr = fopen(file_out, "w");

	fprintf(fout_ptr, "read array: ");
	print(a, n, fout_ptr);
	fprintf(fout_ptr, "\n");

	sort(a, n);


	fprintf(fout_ptr, "    result: ");
	print(a, n, fout_ptr);
	fprintf(fout_ptr, "\n");

	fclose(fout_ptr);

	free(a);
	return 0;
}