#include <stdio.h>
#include <stdbool.h>
bool my_str_isupper(char const *str);

int main(int argc, const char *argv[])
{
    char str0[] = "This is a test!";
    char str1[] = "This is a TEST!";
    char str2[] = "IS";
    char str3[] = "IS?";
 
    printf("%d\n", my_str_isupper((void *) 0));
    printf("%d\n", my_str_isupper(str0));
    printf("%d\n", my_str_isupper(str1));
    printf("%d\n", my_str_isupper(str2));
    printf("%d\n", my_str_isupper(str3));
    return 0;
}
