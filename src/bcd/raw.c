#include <stdio.h>

unsigned long int convertToBinary(int decimal);
int getFromBinary(unsigned long int binary);

int main(int argc, char const *argv[])
{
    int binary;
    int a = 0b1010101011011010;
    int i = a;
    int msb = 0;
    int div = 1;
    int digit;

    while (i > 0)
    {
        i = i / 10;
        msb++;
    }
    // int place = msb;

    i = msb-1;

    while (i > 0)
    {
        div = div * 10;
        i--;
    }
    i = a;
    while (div)
    {
        digit = i / div;
        binary = convertToBinary(digit);
        printf("%d	", binary);
        i = i - digit * div;
        div = div / 10;
    }
    return 0;
}

int getFromBinary(unsigned long int binary)
{
    if (binary == 0)
    {
        return 0;
    }
    else
    {
        int temp = binary % 10;
        return ((temp) + 2 * getFromBinary(binary / 10));
    }
}

unsigned long int convertToBinary(int decimal)
{
    if (decimal == 0)
    {
        return 0;
    }
    else
    {
        return ((decimal & 1) + 10 * convertToBinary(decimal / 2));
    }
}
