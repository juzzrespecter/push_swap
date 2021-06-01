#ifndef PUSH_SWAP_H
# define PUSH_SWAP_H
# include <unistd.h>
# include <stdlib.h>
# include <limits.h>
# include "libft.h"

# define E_DUPL 0 
# define E_NOARG 1
# define E_NONUM 2
# define E_INTOVF 3
# define E_NOMEM 4
# define E_NOFLAG 5 
# define E_NOINSTR 6
# define E_NORAND 7

# define V_FLAG 0
# define R_FLAG 1
# define C_FLAG 2

# define SWAP_ID 0
# define PUSH_ID 1 
# define ROT_ID 2
# define RROT_ID 3

# define S_A 0
# define S_B 1
# define S_BOTH 2

# include <stdio.h>

typedef struct	s_stack
{
	int	*array;
	int	size;
}		t_stack;

typedef struct	s_data
{
	t_stack	stack[2];
	t_list	*instr_list_head;
	int		flags[3]; //tmp
	void	*bonus_misc;
}	t_data;

void	swap(int stack_id, t_data *data);
void	swap_both(int stack_id, t_data *data);
void	push(int stack_id, t_data *data);
void	rotate(int stack_id, t_data *data);
void	rotate_both(int stack_id, t_data *data);
void	rev_rotate(int stack_id, t_data *data);
void	rev_rotate_both(int stack_id, t_data *data);

void	free_data(t_data *data);
void	err_and_exit(t_data *data, char *err_token, int err_code);
t_data	init_data(char **argv);
void	parse_element(int i, int stack_size, char **argv);
void	exec_instr_loop(int instr_id, int stack_id, int n, t_data *data);
void	exec_instr(unsigned int instr_id, unsigned int stack_id, t_data *data);
int	stack_ud(t_stack stack_s, int pos);
t_stack	fill_stack(int start, char **argv);
void	print_instr_loop(t_data *data);
void	save_instr_init(char *instr, int instr_id, int stack_id, t_data *data);

void	selection_sort(t_data *data);
void	insertion_sort(t_data *data);
void	quick_sort_init(t_data *data);
int		check_already_sorted(t_stack stack, int rec);

#endif
