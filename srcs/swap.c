#include "push_swap.h"

void	swap(int stack_id, t_data *data)
{
	t_stack *stack_s;
	int	aux;

	stack_s = &data->stack[stack_id - 2 * (stack_id == 2)];
	if (stack_s->size < 2)
		return ;
	aux = stack_s->array[stack_s->size - 1];
	stack_s->array[stack_s->size - 1] = stack_s->array[stack_s->size - 2];
	stack_s->array[stack_s->size - 2] = aux;
	if (stack_id == 2)
		swap(S_B, data);
}
