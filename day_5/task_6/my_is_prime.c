#include <stdio.h>
int my_is_prime(int nb);

int main(int argc, const char *argv[])
{
    printf("%d\n", my_is_prime(-1));
    printf("%d\n", my_is_prime(0));
    printf("%d\n", my_is_prime(2));
    printf("%d\n", my_is_prime(5));
    printf("%d\n", my_is_prime(123));
    printf("%d\n", my_is_prime(271));
    printf("%d\n", my_is_prime(991));
    printf("%d\n", my_is_prime(324536));
    return 0;
}
