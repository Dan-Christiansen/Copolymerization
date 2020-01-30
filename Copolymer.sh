#!/bin/bash
############################################################################
#	Head script to prompt the user to choose a copolymerization
#	scheme then executes a script that produces a linear polymer 
#	following the copolymerization scheme prescribed.
#		-DC (9/9/19)
#
#	Notes:
#	- The polymerization scripts called for here will depend on
#	  two folders being present in the same directory as each of
#	  these shell scripts.
#		- The first folder "PolymerInputs" will be  the 
#		  monomer structure files in .gro format.
#		- The second "GromacsTools" will contain all 
#		  necessary files and folders to do the sims.
#	- 
#	- These tools makes use of the +/- trick described in the 
#	  Single_chain_polymerization.txt and PolymerizationGuide
#	  files found in:
#	  /mnt/hdd1/shared/gromacs/GromacsTutorials/Polymerization
#	  
############################################################################

clear
# Prompt the user for what type of copolymerization they want to use
echo "######################################"
echo "What type of copolymer system is this?"
echo "	1 - Block"
echo "	2 - Alternating"
echo "	3 - Random"
echo "	4 - Graft"
echo "######################################"
echo
read -p "System: " input
mypwd=$(pwd)
case $input in
	1) # Block copolymerization questions and run script block.sh
		clear
		echo "###############################################"
		echo "             BLOCK COPOLYMER"
		echo "###############################################"
		echo
		echo "How many unique monomers are in the system? "
		echo
		echo "###############################################"
		echo
		read -p "Unique monomers: " unMon
		echo
		echo "###############################################"
		echo
		echo "How many times will the repeat sequence occur? "
		echo
		echo "###############################################"
		echo
		read -p "Repeats: " repeat
		echo
		echo "###############################################"
		i=1
		monStore=()
		mnStore=()
		while [ $i -le $unMon ]; do
			if [ ${i: -1} -eq 1 ]; then
				num="st"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			elif [ ${i: -1} -eq 2 ]; then
				num="nd"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			elif [ ${i: -1} -eq 3 ]; then
				num="rd"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			else
				num="th"
			fi
			echo
			read -p "What is the name of the gromacs structure file for the monomer in the "$i"$num block (Don't include \".gro\")? " mon
			echo
			read -p "How many monomers are in the "$i"$num block? " mval
			monStore+=($mon)
			mnStore+=($mval)
			i=$(($i+1))
		done
		for i in ${monStore[@]}; do
			if [ ! -f ./PolymerInputs/"$i".gro ]; then
				clear
				echo
				echo
				echo
				echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			
				echo "   At least one of the polymers requested is not in the PolymerInputs folder."
				echo "				 Aborting execution."
				echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
				echo
				echo
				exit
			fi
		done
		send=("$unMon" "$repeat" "${monStore[@]}" "${mnStore[@]}")
		if [ ! -d ""$mypwd"/copolymer_output/" ]; then
			mkdir copolymer_output
		fi
		if [ ! -d ""$mypwd"/workingdir/" ]; then
			mkdir workingdir
		else
			rm -r workingdir
			mkdir workingdir
		fi
		cp ./Scripts/block.sh ./workingdir/
		cd ./workingdir/
		./block.sh ${send[@]} > block_log.txt 2>&1 &
		;;
	2) # Alternating copolymerization questions and run script alternating.sh
		clear
		echo "###############################################"
		echo "             ALTERNATING COPOLYMER	     "
		echo "###############################################"
		echo
		echo "How many monomers are in the repeat sequence? "
		echo
		echo "###############################################"
		echo
		read -p "Monomers in sequence: " unMon
		echo
		echo "###############################################"
		echo
		echo "How many times will the repeat sequence occur? "
		echo
		echo "###############################################"
		echo
		read -p "Repeats: " repeat
		echo
		echo "###############################################"
		i=1
		monStore=()
		while [ $i -le $unMon ]; do
			if [ ${i: -1} -eq 1 ]; then
				num="st"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			elif [ ${i: -1} -eq 2 ]; then
				num="nd"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			elif [ ${i: -1} -eq 3 ]; then
				num="rd"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			else
				num="th"
			fi
			echo
			read -p "What is the name of the gromacs structure file for the "$i"$num monomer in the sequence (Don't include \".gro\")? " mon
			monStore+=($mon)
			i=$(($i+1))
		done
		for i in ${monStore[@]}; do
			if [ ! -f ./PolymerInputs/"$i".gro ]; then
				clear
				echo
				echo
				echo
				echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			
				echo "   At least one of the polymers requested is not in the PolymerInputs folder."
				echo "				 Aborting execution."
				echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
				echo
				echo
				exit
			fi
		done
		send=("$unMon" "$repeat" "${monStore[@]}")
		if [ ! -d ""$mypwd"/copolymer_output/" ]; then
			mkdir copolymer_output
		fi
		if [ ! -d ""$mypwd"/workingdir/" ]; then
			mkdir workingdir
		else
			rm -r workingdir
			mkdir workingdir
		fi
		cp ./Scripts/alternating.sh ./workingdir/
		cd ./workingdir/
		./alternating.sh ${send[@]} > alternating_log.txt 2>&1 &
		;;
	3) # Random copolymerization questions and run script random.sh
		clear
		echo "###############################################"
		echo "             RANDOM COPOLYMER"
		echo "###############################################"
		echo
		echo "How many unique monomers are in the system? "
		echo
		echo "###############################################"
		echo
		read -p "Unique monomers: " unMon
		echo
		echo "###############################################"
		echo
		echo "Desired degree of polymerization? "
		echo
		echo "###############################################"
		echo
		read -p "DOP: " dop
		echo
		echo "###############################################"
		i=1
		monStore=()
		mnStore=()
		while [ $i -le $unMon ]; do
			if [ ${i: -1} -eq 1 ]; then
				num="st"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			elif [ ${i: -1} -eq 2 ]; then
				num="nd"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			elif [ ${i: -1} -eq 3 ]; then
				num="rd"
				if [ $i -gt 10 ]; then
					if [ "${i: -2:1}" -eq "1" ]; then
						num="th"
					fi
				fi
			else
				num="th"
			fi
			echo " "
			read -p "What is the name of the gromacs structure file for the "$i"$num monomer in the system (Don't include \".gro\")? " mon
			echo
			read -p "What is the mole percent (out of 100%) of the "$i"$num monomer in the total system? " molval
			monStore+=($mon)
			molStore+=($molval)
			i=$(($i+1))
		done
		sumval=0
		for k in ${molStore[@]}; do
			sumval=`expr $k + $sumval`
		done
		if [ $sumval -ne 100 ]; then
			echo
			echo "The sum of your mole percents does not equal 100%."
			echo
			echo "Total percent is $sumval"
			echo
			echo "Please restart the program and try again."
			exit
		fi
		for i in ${monStore[@]}; do
			if [ ! -f ./PolymerInputs/"$i".gro ]; then
				clear
				echo
				echo
				echo
				echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
			
				echo "   At least one of the polymers requested is not in the PolymerInputs folder."
				echo "				 Aborting execution."
				echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
				echo
				echo
				exit
			fi
		done
		send=("$unMon" "$dop" "${monStore[@]}" "${molStore[@]}")
		if [ ! -d ""$mypwd"/copolymer_output/" ]; then
			mkdir copolymer_output
		fi
		if [ ! -d ""$mypwd"/workingdir/" ]; then
			mkdir workingdir
		else
			rm -r workingdir
			mkdir workingdir
		fi
		cp ./Scripts/random.sh ./workingdir/
		cd ./workingdir/
		./random.sh ${send[@]} > random_log.txt 2>&1 &
		;;
	4) # Graft copolymerization questions and run script graft.sh
		# This has not been added yet, so I have included a funny error message.
		clear
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		echo "Graft copolymerization has not been added yet."
		echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
		#echo
		echo "My apologies, please contact Eduardo Martinez at emarti59@uic.edu for a consolation gift."
		#echo
		echo "Please also try our other forms of copolymerization while you're here!"
		echo
		echo "Enjoy this ASCII art while you contemplate why you picked graft copolymerization"
		exec ./Scripts/error.sh
		;;
	*) # Any input not in the four copolymerization styles listed will give this error
		echo
		echo "That is not a valid input. Please restart this program and try again."
		exit
		;;
esac
echo " "
echo " "
echo " "
echo "			    Producing copolymer system..."
echo " "
echo " "
echo " "
