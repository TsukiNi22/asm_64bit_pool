#include <stdio.h>
char *my_revstr(char *str);

int main(int argc, const char *argv[])
{
    char src[] = "This is a test!";
 
    printf("%p\n", my_revstr((void *) 0));
    printf("%s\n", src);
    printf("%s\n", my_revstr(src));
    return 0;
}
