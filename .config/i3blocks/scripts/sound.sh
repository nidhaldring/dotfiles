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
