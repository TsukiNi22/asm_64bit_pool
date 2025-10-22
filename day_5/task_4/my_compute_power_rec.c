#include <stdio.h>
int my_compute_power_rec(int nb, int p);

int main(int argc, const char *argv[])
{
    printf("%d\n", my_compute_power_rec(134, -1));
    printf("%d\n", my_compute_power_rec(23454, 0));
    printf("%d\n", my_compute_power_rec(23, 4));
    printf("%d\n", my_compute_power_rec(2, 30));
    printf("%d\n", my_compute_power_rec(2, 31));
    printf("%d\n", my_compute_power_rec(124, 23));
    return 0;
}
