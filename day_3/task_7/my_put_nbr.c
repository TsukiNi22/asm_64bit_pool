int my_put_nbr(int nb);

int main(int argc, const char *argv[])
{
    my_put_nbr(0);
    my_put_nbr(1);
    my_put_nbr(3);
    my_put_nbr(23);
    my_put_nbr(2147483648);
    my_put_nbr(-0);
    my_put_nbr(-1);
    my_put_nbr(-3);
    my_put_nbr(-23);
    my_put_nbr(-2147483647);
    return 0;
}
