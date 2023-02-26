river() {
printf "You attempt to build a makeshift raft and sail down the river on it"
sleep 3
clear
printf "Your raft falls apart and you drown."
sleep 3
clear
printf "You have died - Please try again.\n GAME OVER!"
exit
}
portal(){
echo "You attempt to enter the mystical, shimmering, shifting portal."
sleep 2
clear
echo "As your head, left arm and partial torso pass through, what exists on the other side begins to come into sight"
sleep 5
clear
printf "A vast eutopian city spawls out in front of you, travel is done via hoverboards"
sleep 5
clear
printf "a child types a message on their hand-held device and a large cake materializes above him"
sleep 6
clear
printf "As you begin to say something to the boy, the portal begins vibrating aggressively, before fizzling out of existence slicing your body in half"
sleep 8
clear
printf "You have died - Please try again.\n GAME OVER!"
exit
}
tunnel(){
    echo "Welcome to the tunnel"
}

printf "\nEnter the the associated number to make your selection\n"
sleep 2
clear
printf "Welcome Adventurer. Where would you like to start your journey? \n\n"
sleep 1
echo "1)River"
echo "2)Portal"
echo "3)Tunnel"
echo ""

printf "Enter your choice: "
read userchoice
if [ $userchoice -eq 1 ]
then 
    river
elif [[ $userchoice -eq 2 ]]
then
    portal
elif [[ $userchoice -eq 3 ]]
then
    tunnel
fi

