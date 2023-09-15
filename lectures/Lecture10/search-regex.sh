#!/bin/sh

# List all of the strings
echo "List all of the strings"
grep -E '' findthemall.txt

#Only charmander and chespin
echo "Only charmander and chespin"
grep -E 'charmander|chespin' findthemall.txt

echo "Only charmander and chespin (better)"
grep -E '^ch*' findthemall.txt

#All the words with two t's
echo "All the words with two t's"
grep -E 'tt' findthemall.txt

echo "All the words with two t's (different way)"
grep -E 't.*t' findthemall.txt

# Words that don't start with a vowel
echo "Words that don't start with a vowel"
grep -E '^[^aeiou]' findthemall.txt    

echo "Won't work - why?"
grep -E '^[aeiou]' findthemall.txt    

# All words with two consecutive vowels
echo "All words with two consecutive vowels"
grep -E '[aeiou]{2}' findthemall.txt

# All words with two consecutive letters (same)
echo "All words with two consecutive letters (same)"
grep -E '(.)\1' findthemall.txt

# All words that begin and end with the same letter
echo "All words that begin and end with the same letter"
grep -E '^(.).*\1$' findthemall.txt

# All words with exactly 2 of r, s, or t
echo "All words with exactly 2 of r, s, or t"
grep -E '^[^rst]*[rst][^rst]*[rst][^rst]*$' findthemall.txt
