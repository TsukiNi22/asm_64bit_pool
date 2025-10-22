#include <stdio.h>
int my_compute_power_it(int nb, int p);

int main(int argc, const char *argv[])
{
    printf("%d\n", my_compute_power_it(134, -1));
    printf("%d\n", my_compute_power_it(23454, 0));
    printf("%d\n", my_compute_power_it(2, 31));
    printf("%d\n", my_compute_power_it(124, 23));
    return 0;
}
