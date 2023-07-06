#!/usr/bin/bash
set -e
VENV_PREFIX=$(([[ $1 > 0 ]] && poetry env info --path 2>/dev/null) || \
	([[ $1 > 0 ]] && pipenv --venv 2>/dev/null) || \
	(pyenv prefix 2>/dev/null) || \
	echo $VIRTUAL_ENV)
if [[ -n $VENV_PREFIX ]]; then
	$VENV_PREFIX/bin/python -c 'import site; print(site.getsitepackages()[0])'
fi
