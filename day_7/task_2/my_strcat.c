#include <stdio.h>
char *my_strcat(char *dest, char const *src);

int main(int argc, const char *argv[])
{
    char dest[100] = "This is a test!";
    char src[] = "This is a second test";
 
    printf("%p\n", my_strcat((void *) 0, (void *) 0));
    printf("%s\n", my_strcat(dest, src));
    return 0;
}
