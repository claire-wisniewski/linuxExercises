#!/bin/bash
# Calculate the average TotalAssessedValue for properties in MADISON SCHOOLS district
cat Property_Tax_Roll.csv | \
grep "MADISON SCHOOLS" | \
cut -d ',' -f 7 | \
{
    sum=0
    count=0
    # Traverse each value line, accumulate sum and count the number of lines
    while read -r value; do
        # Skip empty lines and non-numeric lines to avoid calculation errors
        if [[ -n "$value" && "$value" =~ ^[0-9]+$ ]]; then
            sum=$((sum + value))
            count=$((count + 1))
        fi
    done
    # Calculate average with 2 decimal places (floating point calculation via bc)
    if [ $count -gt 0 ]; then
        avg=$(echo "scale=2; $sum / $count" | bc)
        echo "Total assessed value of MADISON SCHOOLS: $sum"
        echo "Number of properties: $count"
        echo "Average assessed value: $avg"
    else
        echo "No valid data found for MADISON SCHOOLS district"
    fi
}
