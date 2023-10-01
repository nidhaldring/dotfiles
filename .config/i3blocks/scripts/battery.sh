BATTERY_LVL=$(acpi | cut -d "," -f 2)
BATTERY_STATUS=$(acpi | cut -d ":" -f 2 | cut -d "," -f 1 | xargs echo -n)

if [ "$BATTERY_STATUS" = 'Charging' ]
then
	echo "<span color='yellow'>$BATTERY_LVL $BATTERY_STATUS</span>"
elif [ "$BATTERY_STATUS" = 'Discharging' ]
then
	echo "<span color='red'>$BATTERY_LVL $BATTERY_STATUS</span>"
else
	echo "<span color='green'>$BATTERY_LVL $BATTERY_STATUS</span>"
fi
