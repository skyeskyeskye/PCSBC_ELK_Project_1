#!/bin/bash

echo "enter date (format MMDD)"

read day

echo "enter time (format: 00:00:00 AM/PM)"

read hour

grep -i "$hour" ./"$day"_Dealer_schedule | awk '{print $5,$6}'
