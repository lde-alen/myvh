/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lde-alen <lde-alen@student.42abudhabi.ae>  +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/12 10:20:02 by lde-alen          #+#    #+#             */
/*   Updated: 2023/03/21 08:01:07 by lde-alen         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "cub3d.h"

int	main(int ac, char **av)
{	
	if (ac != 2)
		return (ft_putstr_fd("Error: Invalid amount of arguments.\n", 2), 1);
	if (ft_check_map(av[1]))
		return (1);
	return (0);
}
