
#!/bin/bash  -x
echo "Welcome To Flip Coin Simulation"

#read count of from user
read -p "Enter how many times user want to flip coin" Number
echo "Number="$Number

#switch case#
function combination_flip_coin()
{
	#local start=0
	read -p "Do you want to play if yes press 1 otherwise press any key" start
	while [ $start -eq 1 ]
	do
		echo "perform simulator operation to create a Singlet and Doublet Combination"
		echo -e "1.Singlet \n2.Doublet"
		read -p "Enter your choice" choice
		case $choice in
			1)
				fCoin=1
				FlipCoin
				;;
			2)
				fCoin=2;
				FlipCoin
				;;
			*)
				echo "please enter a valid number"
				;; 
		esac
		read -p "Do you want to continue again" start
	done
}

#funct to Display head  or tail#
function  FlipCoin()
{	
	flipkey=""
	#declare dictionary
	declare -A Simulation
	#loop to calculate  how many time flip a coin
	for((i=1; i<=$Number; i++))
	do
		for((j=1; j<=$fCoin; j++))
		do
			if [[ $((RANDOM%2)) -eq 0 ]]
			then 
				flipkey+=H
			else
				flipkey+=T
			fi
		done
		
		Simulation[$flipkey]=$((${Simulation[$flipkey]}+1))
		flipkey=""
	done
	echo  "key of flip coins : ${!Simulation[@]}"
	echo "counting of flip coins : ${Simulation[@]}"
	
	Calculation
}

#calculating percentage of head and tail#
function Calculation()
{
	#key=""
	for flipkey in ${!Simulation[@]}
	do
		Simulation[$flipkey]=$( echo "scale=2; ${Simulation[$flipkey]} * 100 / $Number" | bc )
	done
	echo "Key percentage of flip coins : ${!Simulation[@]}"
	echo "percentage of flip coins : ${Simulation[@]}"
	
}

#switch case function
combination_flip_coin



