#!/bin/bash

# get memory percentage
mem_percent=$(free | grep Mem | awk '{printf "%.0f", $3/$2*100}')

ram_value=$((mem_percent/10))

ram_array_1=()
ram_array_2=()

# generate array for ram stick display
# using custom font, A and B represent the ram stick glyph
# two arrays are generated to get around the fact
# that a single module can only have one color
for ((i=1; i<=$ram_value; i++)); do
	ram_array_1+="B"
done

for ((i=1; i<=10-$ram_value; i++)); do
	ram_array_2+="A"
done

echo "$(free | grep Mem | awk '{printf "%.1f/%.1f GB", $3/1000000, $2/1000000}')" "$mem_percent" "$ram_array_1" "$ram_array_2"
