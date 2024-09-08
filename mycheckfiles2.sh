#!/bin/bash

echo -e "\nNumber of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l

echo -e "\n#==========================================================="
echo -e "Start Times"

for file in *.out; do
    if [[ -f "$file" ]]; then
        echo -e "\n==> $file <=="
        grep -m 1 "time.struct_time" "$file" 
    else 
        echo "No file matching *.out."
    fi
done

echo -e "\nEnd Times"

for file in *.out; do
    if [[ -f "$file" ]]; then
        echo -e "\n==> $file <=="
        grep  "time.struct_time" "$file" | tail -1
        tail -n 4 "$file"
    else
        echo "No file matching *.out"
    fi
done
echo  "#==========================================================="
