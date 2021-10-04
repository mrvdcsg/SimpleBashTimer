# SimpleBashTimer
A timer written in bash that is incredibly simple...

There isn't much to be said... This is a simple timer that has a few options that you can use. I wrote it geared towards MAC but it should work on Linux with a few missing features. 

## PreReqs
- terminal-notifier: Allows for a notification to pop up on your desktop as a visual indicator that the timer is complete.
- say: Allows it to announce that your timer is complete with a built-in voice (MAC).

## Help
Available Options: 
 - d View this help file 
 - h) Specify hours for timer 
 - m) Specify Minutes for timer 
 - s) Specify Seconds for timer 
 - p) Standard pomodoro (25 minutes timer) 
 - r) Standard Pomodoro Break 
 - a) (MacOS Only)Timer Completion Announcement (should be quoted) 

## Alias
You can create an alias for your timer by adding an entry to your .bash_profile or .bashrc

alias timer="sh /path/to/timer.sh"

## Elephant in the room
Could this be done a million different ways? Sure. Simpler? Probably. It was a fun challenge to throw something together that looked near quickly. I can even have my applications call it. It should be relatively accurate while still not consuming large CPU. I have it sleeping (not accurate) but that is measuring a difference in the seconds against the clock, not relying on sleeping 1s being 1 actual second. Feel free to PR upgrades or use it however you like. Cheers!