#!/bin/bash

cd "$(g:/Weather_data/2_Raw_data)"

for file in $(ls * | grep '.csv')
do
    sed -i 1i"station_Name,date,Factors,X4,X5,X6,X7,X8" $file
    cut -d -f5,6,7,8 $file > $file 
done

echo "All weather files have had cols removed."
read -p " press enter to end the function."