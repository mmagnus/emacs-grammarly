tell application "System Events"
	tell process "Grammarly"
                set visible to true
		set frontmost to true

                click menu item "Select All" of menu "Edit" of menu bar 1
		click menu item "Cut" of menu "Edit" of menu bar 1
       		display notification "All graphics have been converted." with title "My Graphic Processing Script" subtitle "Processing is complete." sound name "Frog"
	end tell
end tell

tell application "System Events"
	tell process "Emacs"
		set frontmost to true
        end tell
end tell
delay 0.1