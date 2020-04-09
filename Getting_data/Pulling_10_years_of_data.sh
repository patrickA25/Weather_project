#!/bin/bash
wget --wait=2.5 -i 1_Pulling_data/10_year_weather_data_list.txt

echo "all data has been pulled from FTP"
read -p "press enter to continue"

cd "$(g:/Weather_project/1_Pulling_data)"

#Unzipping files and moving them to raw_data_location
for file  in $(ls * | grep -i 'csv.gz')
do
        echo $file
        file_name="${file/.gz/}"
        echo $file_name
        gunzip -c 1_Pulling_data/$file > 2_Raw_data/$file_name
done

echo "All weather files have been unzipped"
read -p " press enter to end the function"