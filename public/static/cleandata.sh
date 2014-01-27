
#!/bin/bash

echo "Cleaning files..."
ORIGINAL_FILES=./original_data/*.csv
FINAL_DIR=cleaned_data
FINAL_FILE=compiled_data.csv

#set header for base file
echo "season,day,month,awayteam,hometeam,time,player,team,x,y,result,points" >> $FINAL_DIR/$FINAL_FILE 

for f in $ORIGINAL_FILES
do 
    FILE_NAME=$(basename $f)
    echo "Processing $f file..."
    year=${FILE_NAME:0:4}
    day=${FILE_NAME:6:2}
    month=${FILE_NAME:4:2}
    away=${FILE_NAME:9:3}
    home=${FILE_NAME:11:3}
    
   
    if [ "$month" -gt 8 ] 
    then
	season=$(($year + 1))
    else
	season=$year
    fi

    awk -v s="$season" -v d="$day" -v m="$month" -v a="$away" -v  h="$home" \
    -F "," 'BEGIN {OFS = ","} \
    
    NR>1{if($25==""){$25=0};if($31!=""){print s,d,m,a,h,$12,$24,$13,$31,$32,$28,$25}}' $f >> $FINAL_DIR/$FINAL_FILE
done
echo "Done processing files."