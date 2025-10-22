#include <stdio.h>
int my_getnbr(char const *str );

int main(int argc, const char *argv[])
{
    printf("%d\n", my_getnbr((void *) 0));
    printf("%d\n", my_getnbr("+---+--++---+---+---+-42"));
    printf("%d\n", my_getnbr("42a43"));
    printf("%d\n", my_getnbr("11000000000000000000000042"));
    printf("%d\n", my_getnbr("-1000000000000000000000042"));
    return 0;
}
