#!/bin/bash

linha=""


for ((i=0; i<90; i++)); do
    linha+="─"
done

printf "%s\n" "$linha"
