#include <stdio.h>
int my_strcmp(char const *s1, char const *s2); // Error: 501

int main(int argc, const char *argv[])
{
    char str0[] = "This is a test!";
    char str1[] = "This is a test!";
    char str2[] = "is";
    char str3[] = "is?";
 
    printf("%d\n", my_strcmp((void *) 0, (void *) 0));
    printf("%d\n", my_strcmp(str0, str1));
    printf("%d\n", my_strcmp(str0, str2));
    printf("%d\n", my_strcmp(str2, str3));
    return 0;
}
