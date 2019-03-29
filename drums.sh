#!/bin/bash

DEVICE=$(timeout 1 evtest </dev/null 2>&1 | grep /dev/input | grep "Nintendo Wii Remote Drums" | cut -d ':' -f 1)

if [ x$DEVICE = x ]; then
	echo Cannot find input device for drums
	exit 1
fi

echo Using device $DEVICE

evtest $DEVICE | while read line; do
	echo -n $line | grep -q Event: || continue
	echo -n $line | grep -q EV_ABS || continue
	echo -n $line | grep -q 'value 0' && continue

	HAT=$(echo $line | cut -d '(' -f 3 | cut -d ')' -f 1)
	VELOCITY=$(echo $line | rev | cut -d ' ' -f 1)

	case $HAT in
		ABS_HAT3X)
			DRUM=kick
			;;
		ABS_HAT0X)
			DRUM=floortom
			;;
		ABS_HAT0Y)
			DRUM=hitom
			;;
		ABS_HAT1X)
			DRUM=snare
			;;
		ABS_HAT2X)
			DRUM=hihat
			;;
		ABS_HAT2Y)
			DRUM=cymbal
			;;
		*)
			echo Unknown hat $DRUM
			;;
	esac
	echo ${DRUM} ${VELOCITY}
	aplay ${DRUM}-${VELOCITY}.wav >/dev/null 2>&1 &

done
