#include <stdio.h>
void my_sort_int_array(int *array, int size);

int main(int argc, const char *argv[])
{
    int array[] = {50, 0, 0, 32, 2, 4566, 222};
    int size = 7;

    my_sort_int_array(array, size);
    for (int i = 0; i < size; i++)
        printf("[%d] = %d\n", i, array[i]);
    return 0;
}
