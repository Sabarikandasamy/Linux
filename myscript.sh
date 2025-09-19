#!/bin/bash
echo "Checking website status..."

http_code=$(curl -s -o /dev/null -w "%{http_code}" -L https://guvi.in)

echo "HTTP Code is: $http_code"

if [[ "$http_code" == 2* ]]; then
  echo "Website is working fine (Success)"
else
  echo "Website is not working (Failure)"
fi

file="$1"

if [ -z "$file" ]; then
  echo "Please provide a file name when running the script, e.g.:"
  echo "./myscript.sh myfile.txt"
  exit 1
fi

cp "$file" "${file}.bak"

sed '5,$ { /welcome/ s/give/learning/g }' "$file" > temp.txt

mv temp.txt "$file"

echo "File updated. A backup is saved as ${file}.bak"
