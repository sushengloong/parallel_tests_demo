#!/usr/bin/env sh

NUM_OF_FILLERS=1000
TARGET=../user_spec.rb

i=0
while [ $i -lt $NUM_OF_FILLERS ]; do
  ln -vfs $TARGET user_${i}_spec.rb
  i=$((i+1))
done
