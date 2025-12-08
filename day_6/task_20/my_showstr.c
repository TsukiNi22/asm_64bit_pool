#include <stdio.h>
int my_showstr(char const *str);

int main(int argc, const char *argv[])
{
    char str0[] = "This is a test!";
    char str1[] = "This \a\ntest";
 
    printf("|%d\n", my_showstr((void *) 0));
    printf("|%d\n", my_showstr(str0));
    printf("|%d\n", my_showstr(str1));
    return 0;
}
