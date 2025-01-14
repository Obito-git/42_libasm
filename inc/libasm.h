#ifndef LIBASM_H
#define LIBASM_H

#include <unistd.h>

extern size_t ft_strlen(const char *str);
extern char *ft_strcpy(char *dest, const char *src);
extern int ft_strcmp(const char *s1, const char *s2);
extern ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
extern ssize_t ft_read(int fd, void *buf, size_t count);
extern char *ft_strdup(const char *src);
extern int ft_tolower(int c);
extern int ft_toupper(int c);
extern int ft_isspace(int c);

#endif