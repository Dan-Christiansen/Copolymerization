#!/bin/bash
errorStore=(CAT SIGN SPONGEBOB nyan)
#i=$(( 100 / ${#errorStore[@]} ))

#j=1
#valStore=()
#while [ $j -le ${#errorStore[@]} ]; do
#	valStore=( "${valStore[@]}" "$i" )
#	j=$(($j+1))
#done
#echo ${valStore[@]}

#randval=$(( $RANDOM % 100 + 1 ))
#j=0
#sumval=0
#for k in ${valStore[@]}; do
#	sumval=`expr $sumval + $k`
#	if [ $randval -le $sumval ]; then
#		pickMe=${errorStore[$j]}
#		break
#	else
#		j=$j+1
#	fi
#done
randval=$(( $RANDOM % ${#errorStore[@]} ))
pickMe=${errorStore[$randval]}
case $pickMe in
	CAT) 
		echo -e "		\e[38;5;256;48;5;0m░░░░░░░░░░░░░░░░░░░░░▄▀░░▌░░░░░░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░░░░░░░░░░░░░░░░░░░▄▀▐░░░▌░░░░░░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░░░░░░░░░░░░░░░░▄▀▀▒▐▒░░░▌░░░░░░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░░░░░▄▀▀▄░░░▄▄▀▀▒▒▒▒▌▒▒░░▌░░░░░░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░░░░▐▒░░░▀▄▀▒▒▒▒▒▒▒▒▒▒▒▒▒█░░░░░░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░░░░▌▒░░░░▒▀▄▒▒▒▒▒▒▒▒▒▒▒▒▒▀▄░░░░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░░░░▐▒░░░░░▒▒▒▒▒▒▒▒▒▌▒▐▒▒▒▒▒▀▄░░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░░░░▌▀▄░░▒▒▒▒▒▒▒▒▐▒▒▒▌▒▌▒▄▄▒▒▐░░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░░░▌▌▒▒▀▒▒▒▒▒▒▒▒▒▒▐▒▒▒▒▒█▄█▌▒▒▌░░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m░▄▀▒▐▒▒▒▒▒▒▒▒▒▒▒▄▀█▌▒▒▒▒▒▀▀▒▒▐░░░▄░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m▀▒▒▒▒▌▒▒▒▒▒▒▒▄▒▐███▌▄▒▒▒▒▒▒▒▄▀▀▀▀░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m▒▒▒▒▒▐▒▒▒▒▒▄▀▒▒▒▀▀▀▒▒▒▒▄█▀░░▒▌▀▀▄▄░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m▒▒▒▒▒▒█▒▄▄▀▒▒▒▒▒▒▒▒▒▒▒░░▐▒▀▄▀▄░░░░▀░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m▒▒▒▒▒▒▒█▒▒▒▒▒▒▒▒▒▄▒▒▒▒▄▀▒▒▒▌░░▀▄░░░░░\e[0m"
		echo -e "		\e[38;5;256;48;5;0m▒▒▒▒▒▒▒▒▀▄▒▒▒▒▒▒▒▒▀▀▀▀▒▒▒▄▀░░░░░░░░░░\e[0m"
	;;
	SIGN)
		echo -e "		\e[38;5;256;48;5;0m☆ ∩∩ （ • •）☆				\e[0m"
echo -e "		\e[38;5;256;48;5;0m┏━∪∪━━━━━━━━┓				\e[0m"
echo -e "		\e[38;5;256;48;5;0m☆					\e[0m"
echo -e "		\e[38;5;256;48;5;0m❝ <Don't let your dreams be memes>。 ❞	\e[0m"
echo -e "		\e[38;5;256;48;5;0m┗━━━━━━━━━━━┛				\e[0m"
	;;
	SPONGEBOB)
		echo -e "	\e[38;5;256;48;5;0m──────────────────▄▄───▄▄▄▄▄▄▀▀▀▄──▄		\e[0m"
echo -e "	\e[38;5;256;48;5;0m────────────────▄▀──▀▀█▄▄──▄────█▄█▄▀▀▄▄▄▄	\e[0m"
echo -e "	\e[38;5;256;48;5;0m─────────────────▀█▀────▀▀▀▀█▄▄▄▄───▄▄────▀▀▀▀	\e[0m"
echo -e "	\e[38;5;256;48;5;0m─────────────▄▀▀▀▀▀──▀█▄▄▄▄▄─▀▀▀▀▀█▄███▀	\e[0m"
echo -e "	\e[38;5;256;48;5;0m──────────────▀█▄▄▄──▀▀─▄▄▄▄──────────▀▀▀▀█▀▀▀	\e[0m"
echo -e "	\e[38;5;256;48;5;0m───────▄▀▀▀▄▄▀▀████▀█▄▄▄▄▄▄▄▄▄▄▄───▄▄▄▄──▄█░▄█	\e[0m"
echo -e "	\e[38;5;256;48;5;0m────────▀▄▄▄▀▀██▀▀▀▄█─███▄──██─────▀██▀▀─█░░██	\e[0m"
echo -e "	\e[38;5;256;48;5;0m────────────▀█─▀▀█▄█▄─▀▀▀───█────────────▀█░▀█	\e[0m"
echo -e "	\e[38;5;256;48;5;0m─────────▄▄▀▀─▀▀▀▀░░▀█────▄█▄▀────────────█░░░	\e[0m"
echo -e "	\e[38;5;256;48;5;0m───▄▀▀▀▀▀░░░░░░░░░░░░░▀██▀▀▄▄▀▀──────────██░░░	\e[0m"
echo -e "	\e[38;5;256;48;5;0m▄▀▀▄████░░███████░░▄▄▄▄░░▀█▄─▀▀──────────▀█▄▄░	\e[0m"
echo -e "	\e[38;5;256;48;5;0m█░░█████▄▄███████▄██████▄▄░▀█──███▄▄────────█▄	\e[0m"
echo -e "	\e[38;5;256;48;5;0m█░░░▀▀▀▀▀▀▀▀▀▀▀░░░░░░░░░▀▀▀░░█─▀███▀───────▄█▀	\e[0m"
echo -e "	\e[38;5;256;48;5;0m─▀▀▄▄▄▄▄░░░░░░░░░░░░░░░░░░░░▄▀─────────────▀█░	\e[0m"
echo -e "	\e[38;5;256;48;5;0m───▄▀▄▄▀░░░░░░░░░░░░░░░░░░░░█────────────────█	\e[0m"
echo -e "	\e[38;5;256;48;5;0m▀▀▀─▀▄▀█░░░░░░░░░░░░░░░░░░░░█───────────────▄▀	\e[0m"
echo -e "	\e[38;5;256;48;5;0m─▄▄▀▀──▀▄░░░░░░░░░░░░░░░░░░█────────────────█░	\e[0m"
echo -e "	\e[38;5;256;48;5;0m▀────────▀▄░░░░░░░░░░░░░░▄▀──────────▄█▄▄────█	\e[0m"
echo -e "	\e[38;5;256;48;5;0m───────────▀▄▄▄▄░░░░░▄▄▄▀────────────▀██▀────█	\e[0m"
echo -e "	\e[38;5;256;48;5;0m────────────█░░░▀▀▀▀██████████▀▀▀▀▀▀▄▄▄▄▄▄▄▄▄█	\e[0m"
echo -e "	\e[38;5;256;48;5;0m───────────▄▀░░░░░░░█▒▒▒▒▒▒▒▒█░░░░░░░░░▄▄░░░░█	\e[0m"
echo -e "	\e[38;5;256;48;5;0m───────────▀▄▄▄░░░░░█▒▒▒▒▒▒▒▒█░░░░░░░░░▀█▀░░░█	\e[0m"
	;;
	nyan)
		echo -e "\e[38;5;256;48;5;0m▒▒▒▒▒▒▒█▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀█
▒▒▒▒▒▒▒█░▒▒▒▒▒▒▒▓▒▒▓▒▒▒▒▒▒▒░█
▒▒▒▒▒▒▒█░▒▒▓▒▒▒▒▒▒▒▒▒▄▄▒▓▒▒░█░▄▄
▒▒▄▀▀▄▄█░▒▒▒▒▒▒▓▒▒▒▒█░░▀▄▄▄▄▄▀░░█
▒▒█░░░░█░▒▒▒▒▒▒▒▒▒▒▒█░░░░░░░░░░░█
▒▒▒▀▀▄▄█░▒▒▒▒▓▒▒▒▓▒█░░░█▒░░░░█▒░░█
▒▒▒▒▒▒▒█░▒▓▒▒▒▒▓▒▒▒█░░░░░░░▀░░░░░█
▒▒▒▒▒▄▄█░▒▒▒▓▒▒▒▒▒▒▒█░░█▄▄█▄▄█░░█
▒▒▒▒█░░░█▄▄▄▄▄▄▄▄▄▄█░█▄▄▄▄▄▄▄▄▄█
▒▒▒▒█▄▄█░░█▄▄█░░░░░░█▄▄█░░█▄▄█\e[0m"
	;;
esac
echo -e "	  _____ _ __  __    _____  ____  _____  _______     ___ 
	 |_   _( )  \/  |  / ____|/ __ \|  __ \|  __ \ \   / / |
	   | | |/| \  / | | (___ | |  | | |__) | |__) \ \_/ /| |
	   | |   | |\/| |  \___ \| |  | |  _  /|  _  / \   / | |
	  _| |_  | |  | |  ____) | |__| | | \ \| | \ \  | |  |_|
	 |_____| |_|  |_| |_____/ \____/|_|  \_\_|  \_\ |_|  (_)"
exit