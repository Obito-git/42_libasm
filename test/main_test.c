#include "test.h"

int main()
{
    // String
    ft_strlen_test();
    ft_strcpy_test();
    ft_strcmp_test();
    ft_strdup_test();

    // Syscall
    ft_write_test();
    ft_read_test();

    // Char
    ft_tolower_test();
    ft_toupper_test();
    ft_isspace_test();
    ft_isprint_test();
    ft_isdigit_test();
    ft_isascii_test();
    ft_isalpha_test();
    ft_isalnum_test();

    return 0;
}