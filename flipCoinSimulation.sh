#!/bin/bash -x 
echo "Welcome To Flip Coin Simulation"

#flipping coin to print head or tail 
Flip=$((RANDOM%2))
if [[ $Flip -eq 0 ]]
then
	echo "Head"
else
	echo "Tail"
fi
