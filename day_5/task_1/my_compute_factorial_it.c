#include <stdio.h>
int my_compute_factorial_it(int nb);

int main(int argc, const char *argv[])
{
    printf("%d\n", my_compute_factorial_it(-1));
    printf("%d\n", my_compute_factorial_it(0));
    printf("%d\n", my_compute_factorial_it(3));
    printf("%d\n", my_compute_factorial_it(7));
    printf("%d\n", my_compute_factorial_it(12));
    printf("%d\n", my_compute_factorial_it(13));
    return 0;
}
