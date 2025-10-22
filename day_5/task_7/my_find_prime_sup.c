#include <stdio.h>
int my_find_prime_sup(int nb);

int main(int argc, const char *argv[])
{
    printf("%d\n", my_find_prime_sup(-1));
    printf("%d\n", my_find_prime_sup(0));
    printf("%d\n", my_find_prime_sup(2));
    printf("%d\n", my_find_prime_sup(5));
    printf("%d\n", my_find_prime_sup(123));
    printf("%d\n", my_find_prime_sup(271));
    printf("%d\n", my_find_prime_sup(991));
    printf("%d\n", my_find_prime_sup(324536));
    return 0;
}
