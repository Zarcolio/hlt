#!/bin/bash

scriptdir="~/.scripts"
eval scriptdir=$scriptdir

if [[ -d "$scriptdir" && $1 ]]
then
	pushd $PWD
	cd $scriptdir
	echo "Updating git scripts..."
	for d in *; do
		if [ -f "$d/.git/index" ]; then
			echo -e "\e[32m***** Checking $d ******\e[39m" 
			cd $d
			git checkout master
			git merge origin/master
			cd ..
		fi
	done
	popd
fi	



echo "Updating Python packages..."
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

