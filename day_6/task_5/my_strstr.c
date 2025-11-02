#include <stdio.h>
char *my_strstr(char *str, char const *to_find);

int main(int argc, const char *argv[])
{
    char str[] = "This is a test!";
    char to_find_t[] = "is";
    char to_find_f[] = "is?";
 
    printf("%p\n", my_strstr((void *) 0, (void *) 0));
    printf("%s\n%s\n", str, my_strstr(str, to_find_t));
    printf("%s\n%p\n", str, my_strstr(str, to_find_f));
    return 0;
}
