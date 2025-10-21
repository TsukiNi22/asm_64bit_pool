#include <stdio.h>
int my_strlen(char const *str);

int main(int argc, const char *argv[])
{
    printf("len: %d\n", my_strlen((void *) 0));
    printf("len: %d\n", my_strlen("Hello, World!\n"));
    return 0;
}
