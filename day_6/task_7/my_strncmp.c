#include <stdio.h>
int my_strncmp(char const *s1, char const *s2, int n); // Error: 501

int main(int argc, const char *argv[])
{
    char str0[] = "This is a test!";
    char str1[] = "This is a test!";
    char str2[] = "is";
    char str3[] = "is?";
 
    printf("%d\n", my_strncmp((void *) 0, (void *) 0, 0));
    printf("%d\n", my_strncmp(str0, str1, 50));
    printf("%d\n", my_strncmp(str0, str2, -1));
    printf("%d\n", my_strncmp(str2, str3, 2));
    return 0;
}
