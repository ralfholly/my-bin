#!/bin/bash

# Common base script for (g)vimide.

###################################
# Note! This script should be 'sourced' otherwise
# the changes made to environment variables are
# lost.

export VIMIDE_VIM_ARGS

# If the first arguments refer to existing directories, they are passed to
# cscope; any remaining arguments are passed to vim.
for arg in "$@"; do
	if [ ! -d "$arg" ] || [ $end_of_cscope_args ]; then
		vim_args[${#vim_args[@]}]="$arg"
		end_of_cscope_args=1
	else
		cscope_args[${#cscope_args[@]}]="$arg"
	fi
done

echo cscope_args: ${cscope_args[@]}
echo vim_args: ${vim_args[@]}

# Invoke cscope script in current context (in order to be able to utilize the
# changes made to environment variables by the cscope script.
# Note! We need to supply at least one argument ('.') or all current positional
# parameters will be fed to the sourced script.
cscope_args_=${cscope_args[@]}
. cscope_ ${cscope_args_:-"."}

VIMIDE_VIM_ARGS=${vim_args[@]}

