#!/bin/bash

echo "Enter Date (format MMDD)"
read day
echo "Enter Time (format HH:MM:SS AM/PM)"
read hour
echo "Blackjack Dealer:"
 grep -i "$hour" ./"$day"_Dealer_schedule | awk '{print $3,$4}' 
echo "Roulette Dealer:"
 grep -i "$hour" ./"$day"_Dealer_schedule | awk '{print $5,$6}' 
echo "Texas Hold 'Em Dealer:"
 grep -i "$hour" ./"$day"_Dealer_schedule | awk '{print $7,$8}' 
