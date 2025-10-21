#include <stdio.h>
void my_swap(int *a, int *b);

int main(int argc, const char *argv[])
{
    int a = 36;
    int b = 14;
    
    printf("a: %d\nb: %d\n", a, b);
    my_swap(&a, &b);
    printf("a: %d\nb: %d\n", a, b);
    return 0;
}
