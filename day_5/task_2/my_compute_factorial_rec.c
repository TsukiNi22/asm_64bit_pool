#include <stdio.h>
int my_compute_factorial_rec(int nb);

int main(int argc, const char *argv[])
{
    printf("%d\n", my_compute_factorial_rec(-1));
    printf("%d\n", my_compute_factorial_rec(0));
    printf("%d\n", my_compute_factorial_rec(3));
    printf("%d\n", my_compute_factorial_rec(7));
    printf("%d\n", my_compute_factorial_rec(12));
    printf("%d\n", my_compute_factorial_rec(13));
    return 0;
}
