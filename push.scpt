tell application "System Events"
	tell process "Grammarly"
                set visible to true
		set frontmost to true
         	click menu item "Paste" of menu "Edit" of menu bar 1
       		display notification "" with title "Emacs Grammarly" subtitle "Pull" sound name "Pop"
	end tell
end tell
delay 0.1
