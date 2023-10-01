BRIGHTNESS=$(brightnessctl | head -2 | tail -1 | cut -d"(" -f 2 | cut -d")" -f 1)
echo 🌞 $BRIGHTNESS
