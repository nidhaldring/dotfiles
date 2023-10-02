#!/bin/zsh
RIGHT_CLICK=1
LEFT_CLICK=3

if [ "$BLOCK_BUTTON" = "$RIGHT_CLICK"  ]
then
	pactl set-sink-volume @DEFAULT_SINK@ +5% 
elif [ "$BLOCK_BUTTON" = "$LEFT_CLICK" ]
then
	pactl set-sink-volume @DEFAULT_SINK@ -5% 
fi


sound_status=$(pamixer --get-mute | xargs echo -n)
if [ "$sound_status" = 'true' ]
then
	echo 🔇 $(pamixer --get-volume)%
else
	volume=$(pamixer --get-volume)
	if [ "$volume" -ge "100" ]
	then
		echo 🔊 $(pamixer --get-volume)%
	else
		echo 🔉 $(pamixer --get-volume)%
	fi
fi


