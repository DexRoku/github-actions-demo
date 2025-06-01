#!/bin/bash

# File to store the ASCII output
OUTPUT_FILE="ascii_output.txt"

# Clear the output file at the beginning
> "$OUTPUT_FILE"

# Install cowsay and figlet
sudo apt-get update >> "$OUTPUT_FILE" 2>&1
sudo apt-get install cowsay figlet -y >> "$OUTPUT_FILE" 2>&1

# Add ASCII art to file
{
  cowsay "Hello, world! This is the ASCII art job."
  cowsay -f tux "Tux the penguin says hello!"
  cowsay -f dragon "A dragon appears!"
  cowsay -f ghostbusters "Who you gonna call?"
  cowsay -f turtle "Slow and steady wins the race."
  cowsay -f sheep "Baa baa black sheep, have you any wool?"
  cowsay -f elephant "An elephant never forgets!"
  cowsay -f bunny "Hoppy Easter!"
  cowsay -f koala "Koalas are cute and cuddly!"
  cowsay -f tux "Tux is back with more ASCII art!"
  
  ls -al
} >> "$OUTPUT_FILE"
