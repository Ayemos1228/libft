# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: tsomeya <tsomeya@student.42tokyo.jp>       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/27 16:41:37 by tsomeya           #+#    #+#              #
#    Updated: 2021/04/20 00:23:29 by tsomeya          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME	= libft.a
SRCS	= ft_append.c ft_calloc.c ft_isascii.c ft_isspace.c \
ft_memchr.c ft_memmove.c ft_putendl_fd.c ft_split.c ft_strjoin.c \
ft_strlen.c ft_strnstr.c ft_substr.c ft_atoi.c ft_isalnum.c \
ft_isdigit.c ft_itoa.c ft_memcmp.c ft_memset.c  ft_putnbr_fd.c \
ft_strchr.c ft_strlcat.c ft_strmapi.c ft_strrchr.c ft_tolower.c \
ft_bzero.c ft_isalpha.c ft_isprint.c ft_memccpy.c ft_memcpy.c \
ft_putchar_fd.c ft_putstr_fd.c  ft_strdup.c  ft_strlcpy.c \
ft_strncmp.c ft_strtrim.c ft_toupper.c
OBJS	= $(SRCS:%.c=%.o)
BONUS	= ft_lstadd_back.c ft_lstclear.c ft_lstiter.c \
ft_lstmap.c ft_lstsize.c ft_lstadd_front.c ft_lstdelone.c \
ft_lstlast.c ft_lstnew.c
B_OBJS	= $(BONUS:%.c=%.o)
CC := gcc
CFLAGS := -Wall -Wextra -Werror

ifdef WITH_BONUS
OBJ_FILES = $(OBJS) $(B_OBJS)
else
OBJ_FILES = $(OBJS)
endif

.c.o:
	$(CC) $(CFLAGS)  -c $< -o $@

all:	$(NAME)

$(NAME) : $(OBJ_FILES)
		ar rcs $(NAME) $(OBJ_FILES)

bonus:
	$(MAKE) WITH_BONUS=1 all

clean:
		rm -f $(OBJS) $(B_OBJS)

fclean:		clean
			rm -f $(NAME)

re:			fclean all

.PHONY:		all clean flcean re bonus
