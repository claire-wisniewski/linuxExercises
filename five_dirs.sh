#/bin/bash

rm -rf five
mkdir -p five

for i in {1..5}; do
  dir="five/dir$i"
  mkdir -p "$dir"

  for j in {1..4}; do
    file="$dir/file$j"
    : > "$file"
    for k in $(seq 1 "$j"); do
      echo "$j" >> "$file"
    done
  done
done
