#include <stdio.h>

int main(int argc, char const *argv[])
{
    int n = 20;
    int r = 10;
    int i = 0;
    long int npr = 1;
    long int rfac = 1;
    int k = n;
    //nPr
    while (i < r)
    {
        npr = npr * (k);
        k--;
        i++;
    }
    //r!
    while (r > 0)
    {
        rfac = rfac * r;
        r--;
    }
    //nPr/r! = nCr
    printf("nCr = %ld\n", npr / rfac);
    return 0;
}