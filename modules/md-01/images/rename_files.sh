#!/bin/bash

counter=1

for file in *.png; do
  new_name=$(printf "setup-element-%02d.png" $counter)
  mv "$file" "$new_name"
  counter=$((counter + 1))
done
