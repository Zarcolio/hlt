#!/bin/bash

scriptdir="~/.scripts"
eval scriptdir=$scriptdir

if [[ -d "$scriptdir" && $1 ]]
then
	pushd $PWD>/dev/null
	cd $scriptdir
	git clone $1
	popd
fi	

if [[ ! -d "$scriptdir" ]]
then
	echo "fatal: Script dir $scriptdir does not exist"
fi

if [[ -z $1 ]]
then
	echo "fatal: repository not given"
fi

