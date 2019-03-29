#!/bin/bash
M=7
P=2

for i in cymbal floortom hihat hitom kick snare; do
	MP=$(echo scale=3\; ${M}'^'${P} | bc)
	for j in $(seq 1 $M); do
		PW=$(echo scale=3\; '('$j'^'${P}')'/${MP} | bc)
		sox -v $PW ${i}.wav ${i}-${j}.wav
	done
done 
