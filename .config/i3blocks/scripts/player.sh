song=$(spotifycli --status)
status=$(spotifycli --playbackstatus)

# toggle song status upon click
[ -n "$BLOCK_BUTTON" ] && spotifycli --playpause

echo $status $song 

