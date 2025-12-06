#include <stdio.h>
char *my_strcapitalize(char *str);

int main(int argc, const char *argv[])
{
    char str0[] = "This is a test!";
    char str1[] = "This is a TEST!";
    char str2[] = "is";
    char str3[] = "is?";
    char str4[] = "hey, how are you? 42WORds forty-two; fifty+one";

    printf("%p\n", my_strcapitalize((void *) 0));
    printf("%s\n", my_strcapitalize(str0));
    printf("%s\n", my_strcapitalize(str1));
    printf("%s\n", my_strcapitalize(str2));
    printf("%s\n", my_strcapitalize(str3));
    printf("%s\n", my_strcapitalize(str4));
    return 0;
}
