#include "push_swap.h"

int	main(int argc, char **argv)
{
	t_data	data;

	(void) argc;
	parse_args(1, argv);
	data = init_data(argv);
	heap_sort(&data);
	print_instr_loop(&data);
	return (EXIT_SUCCESS);
}
