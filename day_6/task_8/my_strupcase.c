#include <stdio.h>
char *my_strupcase(char *str);

int main(int argc, const char *argv[])
{
    char str0[] = "This is a test!";
    char str1[] = "This is a TEST!";
    char str2[] = "is";
    char str3[] = "is?";
 
    printf("%p\n", my_strupcase((void *) 0));
    printf("%s\n", my_strupcase(str0));
    printf("%s\n", my_strupcase(str1));
    printf("%s\n", my_strupcase(str2));
    printf("%s\n", my_strupcase(str3));
    return 0;
}
