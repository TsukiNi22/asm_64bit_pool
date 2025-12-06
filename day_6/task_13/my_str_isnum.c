#include <stdio.h>
#include <stdbool.h>
bool my_str_isnum(char const *str);

int main(int argc, const char *argv[])
{
    char str0[] = "This is a test!54367";
    char str1[] = "254367This is a TEST!";
    char str2[] = "132545678";
    char str3[] = "IS?";
 
    printf("%d\n", my_str_isnum((void *) 0));
    printf("%d\n", my_str_isnum(str0));
    printf("%d\n", my_str_isnum(str1));
    printf("%d\n", my_str_isnum(str2));
    printf("%d\n", my_str_isnum(str3));
    return 0;
}
