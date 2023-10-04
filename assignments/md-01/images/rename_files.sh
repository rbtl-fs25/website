#!/bin/bash

counter=1

for file in Screenshot*.png; do
  new_name=$(printf "verify-element-app-session-%02d.png" $counter)
  mv "$file" "$new_name"
  counter=$((counter + 1))
done
