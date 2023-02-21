#!/bin/bash
#
# Copyright 2023 David Viloria
#
# Based on code originally written by Tom White (https://github.com/tomwhite/) (c) 2011, licensed under the Apache License
# Modificiations made by David Viloria involve mainly adopting this project on Mac, adding support for multiple langauges, etc
# Such modifications are licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
function speak {
  if [ "$2" == "chinese" ]; then
    say -v Ting-Ting "$1"
  elif [ "$2" == "tagalog" ]; then
    say -v Monica "$1"
  else
    say "$1"
  fi
}

# initialize array to keep track of used words
declare -a used_words=()

while true; do
  # choose a random language
  lang_idx=$((RANDOM%3))
  if [ $lang_idx -eq 0 ]; then
    lang="english"
    word=$(sort -R words_en.txt | head -1)
    word_speak="$word"
  elif [ $lang_idx -eq 1 ]; then
    lang="chinese"
    word=$(sort -R words_cn.txt | head -1)
    word_speak=$(echo "$word" | sed -E 's/\(([^)]+)\)//g')
  else
    lang="tagalog"
    word=$(sort -R words_tl.txt | head -1)
    word_speak="$word"
  fi

  # check if word has been used before
  if [[ " ${used_words[@]} " =~ " ${word} " ]]; then
    continue  # skip to next iteration if word has been used before
  fi

  # speak the word in the selected language
  speak "$word_speak" "$lang"

  # wait for keypress
  echo "Press a key for the answer"
  read -n 1 -s

  # spell out the word
  letters=$(echo $word | tr '[A-Z]' '[a-z]' | sed 's/[a-z]/&, /g')
  echo $word
  echo $letters

  # speak the letters in the selected language
  speak "$letters" "$lang"

  # ask if the user got the word correct
  read -p "Did you get it correct? (y/n) " answer
  if [ "$answer" == "y" ]; then
    used_words+=("$word")  # add word to used_words array
  fi

  # wait for keypress
  echo "Press a key for the next word"
  read -n 1 -s
done
