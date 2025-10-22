#include <stdio.h>
int my_compute_square_root(int nb);

int main(int argc, const char *argv[])
{
    printf("%d\n", my_compute_square_root(-1));
    printf("%d\n", my_compute_square_root(0));
    printf("%d\n", my_compute_square_root(1));
    printf("%d\n", my_compute_square_root(4));
    printf("%d\n", my_compute_square_root(9));
    printf("%d\n", my_compute_square_root(100));
    printf("%d\n", my_compute_square_root(52637));
    return 0;
}
