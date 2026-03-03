#/bin/bash


if [[ $1 == "" || $2 == "" ]]; then
	echo "Error : mean.sh requires 2 arguments. One or more are missing."
	exit 1
fi

column=$1
file=$2

awk -F ',' -v col="$1" '
    NR > 1 && $col != "" {
        sum += $col
        count++
    }
    END {
        if (count > 0) 
            print (sum / count)
        else 
            exit 1
    }
' "${file:-/dev/stdin}"

