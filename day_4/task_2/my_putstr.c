int my_putstr(char const *str);

int main(int argc, const char *argv[])
{
    my_putstr((void *) 0);
    my_putstr("Hello, World!\n");
    return 0;
}
