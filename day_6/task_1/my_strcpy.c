#include <stdio.h>
char *my_strcpy(char *dest, char const *src);

int main(int argc, const char *argv[])
{
    char dest[100] = {0};
    char src[] = "This is a test!";
 
    printf("%s\n%s\n", (void *) 0, my_strcpy(dest, (void *) 0));
    printf("%s\n%s\n", src, my_strcpy((void *) 0, src));
    printf("%s\n%s\n", src, my_strcpy(dest, src));
    return 0;
}
