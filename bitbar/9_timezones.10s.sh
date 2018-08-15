#!/bin/bash

date +'%a %m.%d %l:%M'
echo "---"
TZ=America/Chicago date '+%I:%M %Z'
TZ=America/Denver date '+%I:%M %Z'
TZ=America/Los_Angeles date '+%I:%M %Z'
TZ=GMT/Zulu date '+%H:%M %Z'
