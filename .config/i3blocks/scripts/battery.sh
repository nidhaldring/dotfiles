BATTERY_LVL=$(acpi | cut -d "," -f 2)
BATTERY_STATUS=$(acpi | cut -d ":" -f 2 | cut -d "," -f 1 | xargs echo -n)

if [ "$BATTERY_STATUS" = 'Charging' ]
then
	echo "<span color='yellow'>$BATTERY_LVL $BATTERY_STATUS</span>"
elif [ "$BATTERY_STATUS" = 'Discharging' ]
then
	echo "<span color='red'>$BATTERY_LVL $BATTERY_STATUS</span>"
  BATTERY_LVL_NUM=$(echo $BATTERY_LVL | cut -d "%" -f 1)
  [ $BATTERY_LVL_NUM -lt 10 ] && notify-send "For the love of god, please re-charge your pc!"
else
	echo "<span color='green'>$BATTERY_LVL $BATTERY_STATUS</span>"
fi
