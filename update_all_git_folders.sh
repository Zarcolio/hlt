for d in *; do
	if [ -f "$d/.git/index" ]; then
		echo -e "\e[32m***** Checking $d ******\e[39m" 
		cd $d
		git checkout master
		git merge origin/master
		cd ..
	fi
done
