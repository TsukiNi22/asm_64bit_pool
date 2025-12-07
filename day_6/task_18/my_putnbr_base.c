#include <stdio.h>
int my_putnbr_base(int nbr, char const *base);

int main(int argc, const char *argv[])
{
    char base[] = "0";
    char base0[] = "01234";
    char base1[] = "abcdefghij";
 
    printf("|%d\n", my_putnbr_base(0, (void *) 0));
    printf("|%d\n", my_putnbr_base(0, base));
    printf("|%d\n", my_putnbr_base(-234, base0));
    printf("|%d\n", my_putnbr_base(0, base0));
    printf("|%d\n", my_putnbr_base(245, base0));
    printf("|%d\n", my_putnbr_base(10, base0));
    printf("|%d\n", my_putnbr_base(0, base1));
    printf("|%d\n", my_putnbr_base(245, base1));
    printf("|%d\n", my_putnbr_base(10, base1));
    return 0;
}
