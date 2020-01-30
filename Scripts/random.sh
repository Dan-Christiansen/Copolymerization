#!/bin/bash -x

############################################################################
#		To be run by the Copolymer.sh script
#		and produce a linear alternating copolymer.
#			- DC (9/17/19)
############################################################################

# Collect inputs from the head program and split it into some related groups
Input=( "$@" ) # Total input
unMon=${Input[0]} # Number of unique monomers in the system
dop=${Input[1]} # Number of times the sequence will repeat
i=2
monStore=() # Store the file names of each monomer
molStore=() # Store the number of each monomer in subsequence
mypwd=$(pwd)
cd ..
abvpwd=$(pwd)
cd $mypwd

while [ $i -lt $(($unMon+2)) ]; do
	monStore+=(${Input[$i]})
	#echo ${monStore[@]}
	i=$(($i+1))
done
while [ $i -lt ${#Input[@]} ]; do
	molStore+=(${Input[$i]})
	#echo ${mnStore[@]}
	i=$(($i+1))
done

# Name of polymer being produced
i=0
monName="Rand_"
while [ $i -lt ${#monStore[@]} ]; do
	monName="${monName}${monStore[$i]}_"
	i=$(($i+1))
done
#elsum=0
#for elem in ${mnStorep[@]}; do
#	elsum=`expr $elsum + $elem`
#done
#elsum=`expr ${#monStore[@]} \* $repeat`
monName="${monName}DOP_$dop"

# Begin polymerization

edge=3
cp -r "$abvpwd"/GromacsTools/* "$abvpwd"/workingdir/
i=1
k=0
kp=1
while [ $i -le $dop ]; do
	randval=$(( $RANDOM % 100 + 1 ))
	j=0
	sumval=0
	for l in ${molStore[@]}; do
		sumval=`expr $sumval + $l`
		if [ $randval -le $sumval ]; then
			monUse=${monStore[$j]}
			break
		else
			j=$j+1
		fi
	done
	if [ $i -eq 1 ]; then
		cp "$abvpwd"/PolymerInputs/"$monUse".gro "$abvpwd"/workingdir/
		cd "$abvpwd"/workingdir/
		gmx insert-molecules -ci "$monUse".gro -nmol 1 -box $edge $edge $edge -o temp_"$k".gro
		gmx pdb2gmx -f temp_"$k".gro -ff oplsaa -p topol.top -o temp_"$k".gro -water none
		cd ..
	else
		cp "$abvpwd"/PolymerInputs/"${monStore[$j]}".gro "$abvpwd"/workingdir/
		cd "$abvpwd"/workingdir/		
		halfedge=$(bc <<< "scale = 3; $edge / 2")
		gmx editconf -f temp_"$k".gro -center $halfedge $halfedge $halfedge -o temp_"$k"_sized.gro
		gmx solvate -cp temp_"$k"_sized.gro -cs "${monStore[$j]}".gro -maxsol 1 -p topol.top -o temp_"$kp"_solvated.gro
		gmx pdb2gmx -f temp_"$kp"_solvated.gro -ff oplsaa -p topol.top -o temp_"$kp"_treated.gro -water none
		gmx grompp -f minim.mdp -c temp_"$kp"_treated.gro -p topol.top -o temp_"$kp"_min.tpr
		gmx mdrun -deffnm temp_"$kp"_min
		nextedge=$(bc <<< "scale = 3; $edge + 0.151")
		gmx insert-molecules -ci temp_"$kp"_min.gro -nmol 1 -box $nextedge $nextedge $nextedge -o temp_"$kp".gro
		edge=$nextedge
		rm ./#*
		rm *.trr
		rm *.edr
		rm *.log
		rm *.tpr
		rm *_solvated.gro
		rm *_sized.gro
		rm *_treated.gro
		rm *_min.gro
		cd ..
		k=$(($k+1))
		kp=$(($kp+1))
	fi
	i=$(($i+1))
done
cp "$abvpwd"/Scripts/copol_rtp_maker_v1.py "$abvpwd"/workingdir/
cd "$abvpwd"/workingdir/
python copol_rtp_maker_v1.py "$monName"
mv ./*_rtpEntry.txt "$abvpwd"/copolymer_output/
mv ./temp_"$k".gro "$abvpwd"/copolymer_output/"$monName".gro 
rm temp_*
