#!/bin/zsh
RIGHT_CLICK=1
LEFT_CLICK=3

if [ "$BLOCK_BUTTON" = "$RIGHT_CLICK"  ]
then
	brightnessctl s +5% > /dev/null && echo 🌞 $(brightnessctl | head -2 | tail -1 | cut -d"(" -f 2 | cut -d")" -f 1);
elif [ "$BLOCK_BUTTON" = "$LEFT_CLICK" ]
then
	brightnessctl s 5%- > /dev/null && echo 🌞 $(brightnessctl | head -2 | tail -1 | cut -d"(" -f 2 | cut -d")" -f 1)
else
	echo 🌞 $(brightnessctl | head -2 | tail -1 | cut -d"(" -f 2 | cut -d")" -f 1)
fi

