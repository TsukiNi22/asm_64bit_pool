#include <stdio.h>
char *my_strlowcase(char *str);

int main(int argc, const char *argv[])
{
    char str0[] = "This is a test!";
    char str1[] = "This is a TEST!";
    char str2[] = "is";
    char str3[] = "is?";
 
    printf("%p\n", my_strlowcase((void *) 0));
    printf("%s\n", my_strlowcase(str0));
    printf("%s\n", my_strlowcase(str1));
    printf("%s\n", my_strlowcase(str2));
    printf("%s\n", my_strlowcase(str3));
    return 0;
}
