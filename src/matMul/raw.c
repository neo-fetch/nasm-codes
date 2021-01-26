#include <stdio.h>

int main(int argc, char const *argv[])
{
	int matar1[3] = {1, 2, 3}; //	MATRIX A ROW 1.
	int matar2[3] = {4, 5, 6}; //	MATRIX A ROW 2.
	int matar3[3] = {7, 8, 9}; //	MATRIX A ROW 3.
	int matbr1[3] = {1, 2, 3}; //	MATRIX B ROW 1.
	int matbr2[3] = {4, 5, 6}; //	MATRIX B ROW 2.
	int matbr3[3] = {7, 8, 9}; //	MATRIX B ROW 3.
	int k = 0, j = 0;
	int res[9];
	//1st row
	while(j < 3)
	{
		res[k] = (matar1[0]) * (matbr1[j]) + (matar1[1]) * (matbr2[j]) + (matar1[2]) * (matbr3[j]);
		k++;
		j++;
	}
	//2nd row
	j = 0;
	while(j < 3)
	{
		res[k] = matar2[0] * (matbr1[j]) + matar2[1] * (matbr2[j]) + matar2[2] * (matbr3[j]);
		k++;
		j++;
	}
	//3rd row
	j = 0;
	while(j < 3)
	{
		res[k] = matar3[0] * (matbr1[j]) + matar3[1] * (matbr2[j]) + matar3[2] * (matbr3[j]);
		k++;
		j++;
	}
	//printing the result:
	j = 0;
	while(j < 9)
	{
		if (j % 3 == 0)
		{
			printf("\n");
		}

		printf("%d\t", res[j]);
		j++;
	}

	return 0;
}