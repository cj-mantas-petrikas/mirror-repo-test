#!/bin/bash


# Loop to generate 100 random commits
for ((i=1; i<=1000; i++))
do
  # Generate a random commit message
  # commit_message=$(curl -s 'https://api.whatdoestrumpthink.com/api/v1/quotes/random' | jq .message)
  random_line=$(gshuf -n1 shakespeare.txt)
  commit_message="Message ${random_line}"
  # Generate a random file name
  file_name=$(cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 10 | head -n 1)

  # Generate random content for the file
  content=$(cat /dev/urandom | LC_ALL=C tr -dc 'a-zA-Z0-9' | fold -w 100 | head -n 1)

  # Create a new file with the random file name
  echo "$content" > "files/$file_name.txt"

  # Add the file to the staging area
  git add "files/$file_name.txt"

  # Make the commit using the random date and message
  git commit -m "$commit_message" -q
  # Remove the file

done
