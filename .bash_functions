function mkcd (){
	mkdir -p $1
	cd $1
}

isIn () {
  local e
    for e in "${@:2}"; do [[ "$e" == "$1" ]] && return 0; done
	   return 1
}

# lets set PATH with pathadd()
function pathadd () {
	if ! echo $PATH | /bin/egrep -q "(^|:)$1($|:)" ; then
		if [ "$2" = "after" ] ; then
			PATH=$PATH:$1
		else
			PATH=$1:$PATH
		fi
	fi
}


function modpaths() {
	varcnt=$#
	pathlistvar=$1
	pathlistval=${!pathlistvar}
	newpath=$2
	position=$3
	target=$4
	echo "param count: " $varcnt
	if [ "$varcnt" -lt 2 ] || [ "$varcnt" -gt 4 ]
	then
	   echo "Need 2, 3 or 4 params"
		return 1
	else
		declare -a pathslist
		declare newlist
		IFS=:, read -ra tmplist <<< "$pathlistval"
		# clean up null paths
		for i in "${tmplist[@]}"
		do
			if [ -n $i ]
			then
				pathslist=(${pathslist[@]} "$i")
			fi
		done
		echo
		echo 'PATHSLIST LIST: ' ${pathslist[@]}
		echo
		if [ "$varcnt" -eq 2 ] || [ "$position" = "first" ]
		then
			echo "BOO 1"
			newlist=$newpath:$pathlistval
		elif [ "$position" = "last" ]
		then
			echo "BOO 2"
			newlist=$pathlistval:$newpath
		else
			echo "BOO 3"
			for p in "${pathslist[@]}"
			do
				echo 'path item:' $p
				echo boo
				if [ "$p" = "$target" ] && [ "$target" ]
				then
					echo 'TARGETTARGETTARGET'
					if [ "$position" = "before" ]
					then
						newlist=$newlist:$newpath
					fi
					newlist=$newlist:$p
					if [ "$position" = "after" ]
					then
						newlist=$newlist:$newpath
					fi
				elif ! [ "$position" = "remove" ]
				then
					newlist=$newlist:$p
				elif ! [ "$p" = "$newpath" ] 
				then
					newlist=$newlist:$p
				fi
			done
		fi
#		eval "$var=\$val"
		echo 'newlist:'
		echo $newlist
		echo
		echo $pathlistvar
		echo
		eval "$pathlistvar=$newlist"
		echo
		echo 'NEWPATHS:' 
		echo ${!pathlistvar}
	fi
}

function tt () {
	av1=asd
	av2=cvb
	av3=asd
	if [ "$av1" = "$av2" ]
	then
		echo "av1 = av2"
	elif [ "$av2" = "$av3" ]
	then
		echo "av2 = av3"
	elif [ "$av3" = "$av1" ]
	then
		echo "av3 = av1"
	fi
}
