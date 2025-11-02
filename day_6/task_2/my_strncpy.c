#include <stdio.h>
char *my_strncpy(char *dest, char const *src, int n);

int main(int argc, const char *argv[])
{
    char dest[100] = {0};
    char src[] = "This is a test!";
 
    printf("%s\n%s\n", (void *) 0, my_strncpy(dest, (void *) 0, 3));
    printf("%s\n%s\n", src, my_strncpy((void *) 0, src, 34));
    printf("%s\n%s\n", src, my_strncpy(dest, src, 2));
    return 0;
}
