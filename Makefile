# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lde-alen <lde-alen@student.42abudhabi.fr>  +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/12 08:48:30 by lde-alen          #+#    #+#              #
#    Updated: 2023/02/12 09:55:46 by lde-alen         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

## Executable name
NAME			=		cub3d


## Directories
LIBFT_DIR		=		libft/
GNL_DIR			=		get_next_line/
MLX_DIR			=		minilibx_opengl_20191021/
SRCS_DIR		=		srcs/

## Archives
LIBFT_NAME		=		libft.a
MLX_NAME		=		libmlx.a

## Files
SRCS			=		main.c


## Runs uname command on the terminal in order to determine the OS ##
UNAME 			:=		$(shell uname)

## Flags
FLAGS			=		-Wall -Wextra -Werror -g3 -0fast
## If the OS is Linux, then the MLX library is compiled with the following flags
## otherwise, it is compiled with the MacOS flags
ifeq ($(UNAME),Linux)
	MLX_COMPIL	=		-L $(MLX_DIR) -lm -lXext -lX11 -Ofast
else
	MLX_COMPIL	=		-L $(MLX_DIR) -l mlx -framework OpenGL -framework AppKit -Ofast
endif

## Path to Includes folder
INCLUDES		+=		-I./includes/

## Quality of life and dopamine
RM				=		rm -f
CC				=		gcc

## Transforms .c into .o
.c.o			:
						$(CC) $(FLAGS) -c $< -o $(<:.c=.o)

## 
$(NAME)			:		$(OBJS)
						$(MAKE) -C ./libft
						$(MAKE) -C $(MLX)
						$(CC) $(MLX_COMPIL) $(FLAGS) $(OBJS) $(MLX)/$(MLX_NAME) $(LIBFT_DIR)/$(LIBFT_NAME) -o $(NAME)
						mkdir -p $(OBJS_DIR_N)
						mv $(OBJS) $(OBJS_DIR)

## Calls Name
all				:		$(NAME)

## Removes all .o files
clean			:
						$(MAKE) clean -C $(LIBFT_DIR)
						$(MAKE) clean -C $(MLX)
						$(RM) -r $(OBJS_DIR)/

## Removes all .o files and the executable
fclean			:		clean
						$(MAKE) fclean -C $(LIBFT_DIR)
						$(RM) $(NAME)
						$(RM) $(LIBFT_DIR)/$(LIBFT_NAME)
						$(RM) $(MLX)/$(MLX_NAME)
## Calls fclean and all
re				:		fclean all
