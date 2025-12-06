#include <stdio.h>
#include <stdbool.h>
bool my_str_islower(char const *str);

int main(int argc, const char *argv[])
{
    char str0[] = "this is a test!";
    char str1[] = "this is a TEST!";
    char str2[] = "is";
    char str3[] = "is?";
 
    printf("%d\n", my_str_islower((void *) 0));
    printf("%d\n", my_str_islower(str0));
    printf("%d\n", my_str_islower(str1));
    printf("%d\n", my_str_islower(str2));
    printf("%d\n", my_str_islower(str3));
    return 0;
}
