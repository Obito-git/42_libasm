LIB_NAME = libasm.a

NAME = libasm.a
CC = clang
ASM = nasm
CFLAGS = -Wall -Werror -Wextra -g3 -Iinc -Itest
ASMFLAGS = -f elf64

SRCS_DIR = src
OBJ_DIR = obj
TEST_DIR = test/

SRCS = $(wildcard $(SRCS_DIR)/*/*.s)
OBJS = $(patsubst $(SRCS_DIR)/%.s, $(OBJ_DIR)/%.o, $(SRCS))
TEST_SRCS = $(wildcard $(TEST_DIR)*.c)
TEST_OBJS = $(patsubst $(TEST_DIR)/%.c, $(OBJ_DIR)/%.o, $(TEST_SRCS))
TEST_HEADERS = $(wildcard $(TEST_DIR)*.h) inc/libasm.h

all: $(NAME)

$(OBJ_DIR)/%.o: $(SRCS_DIR)/%.s Makefile | $(OBJ_DIR)
	@mkdir -p $(dir $@)
	$(ASM) $(ASMFLAGS) -o $@ $<

$(OBJ_DIR)/%.o: $(TEST_DIR)/%.c Makefile | $(OBJ_DIR)
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c -o $@ $<

$(NAME): $(OBJS)
	ar rcs $(NAME) $(OBJS)

test: $(NAME) $(TEST_OBJS) $(TEST_HEADERS)
	$(CC) $(CFLAGS) -g3 -o test_bin $(TEST_OBJS) $(NAME)

runtest: test
	./test_bin

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR)
	rm -f .*.swp

fclean: clean
	rm -f $(NAME)
	rm -f test_bin

re: fclean all

.PHONY: all clean fclean re test runtest
