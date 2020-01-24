#!/bin/bash  
echo "Welcome To Flip Coin Simulation"

#declare dictionary
declare -A Display

#read count of from user
read -p "Enter how many times user want to flip coin" num
echo "num= "$num

head=0
tail=0

#function to Display head  or tail#
function  DisplayHeadTail()
{
	#loop to calculate  how many time flip a coin
	for((i=1; i<$num; i++))
	do
		FlipCoin=$((RANDOM%2))
		if [[ $FlipCoin -eq 0 ]]
		then 
		Display[flip$i]="HEAD"
		((head++))
		else
		Display[flip$i]="TAIL"
		((tail++))
		fi
	done
}

DisplayHeadTail
echo "display head or tail : ${Display[@]}"
echo "head=$head"
echo "tail=$tail"


#calculating percentage of head and tail#
percentage_of_head=$( echo "scale=2; $head * 100 / $num" | bc )
percentage_of_tail=$(echo "scale=2; $tail * 100 / $num" | bc )

#printing  result here#
echo "Percentage of head = $percentage_of_head"
echo "Percentage of Tail = $percentage_of_tail"
