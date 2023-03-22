/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   check.c                                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lde-alen <lde-alen@student.42abudhabi.ae>  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/18 20:24:08 by lde-alen          #+#    #+#             */
/*   Updated: 2023/03/22 08:37:09 by lde-alen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

static void	check_ext(char *map)
{
	int	i;

	i = 0;
	while (map[i])
		i++;
	if (!(map[i] != 'b' || map[i - 1] != 'u' || map[i - 2] != 'c' || map[i - 3] != '.'))
		ft_putstr_fd("Error: Invalid file extension.\n", 2);
}

char	*read_file(char *name)
{
	char	*ret;
	char	*tmp;
	int		fd;

	fd = open(name, O_RDONLY);
	if (fd < 0)
		return (ft_putstr_fd("Error: Invalid file.\n", 2), NULL);
	ret = ft_strdup("start");
	tmp = ft_strdup("");
	while (ret != NULL)
	{
		ret = get_next_line(fd);
		if (ret == NULL)
			return (tmp);
		tmp = ft_strjoin(tmp, ret);
	}
	return (tmp);
}

int	ft_check_file(char *map_name)
{
	char	*file;
	int		ret;

	ret = 0;
	check_ext(map_name);
	file = read_file(map_name);
	if (!file)
		return (free(file), ft_putstr_fd("Error: Invalid file.\n", 2), 1);
	else if (check_textures(file) == 1 || check_colors(file) == 1 || check_map(file) == 1) // to code
		return (free(file), ft_putstr_fd("Error: Invalid textures.\n", 2), 1);
	else if (ret == 1)
		return (free(file), ft_putstr_fd("Error: Invalid Map.\n", 2), 1);
	else
		return (0);
}
