#include <stdio.h>
char *my_evil_str(char *str);

int main(int argc, const char *argv[])
{
    char *str_a = (void *) 0;
    char str_b[] = "Hello, World!";
    char str_c[] = "12345";

    printf("Input: %s\n", str_a);
    printf("New: %s\n", my_evil_str(str_a));
    printf("Input: %s\n", str_b);
    printf("New: %s\n", my_evil_str(str_b));
    printf("Input: %s\n", str_c);
    printf("New: %s\n", my_evil_str(str_c));
    return 0;
}
