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
  local word=$1
  local lang=$2

  echo "$word" > /tmp/speak

  if [ "$lang" = "chinese" ]; then
    say -v Ting-Ting -r 150 -f /tmp/speak
  elif [ "$lang" = "english" ]; then
    say -v Samantha -r 200 -f /tmp/speak
  elif [ "$lang" = "tagalog" ]; then
    say -v Karen -r 200 -f /tmp/speak
  else
    echo "Unsupported language: $lang"
  fi
}

while true; do
  # choose a random language
  lang_idx=$((RANDOM%3))
  if [ $lang_idx -eq 0 ]; then
    lang="english"
    word=$(sort -R words_en.txt | head -1)
  elif [ $lang_idx -eq 1 ]; then
    lang="chinese"
    word=$(sort -R words_cn.txt | head -1)
  else
    lang="tagalog"
    word=$(sort -R words_tl.txt | head -1)
  fi

  # speak the word in the selected language
  speak "$word" "$lang"


  echo "Press a key for the answer"
  read -n 1 -s

  echo $word
 

  # wait for keypress
  echo "Press a key for the next word"
  read -n 1 -s
done
