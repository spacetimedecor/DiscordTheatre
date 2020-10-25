------------------------------------------------
-- First quit any instances currently running:
------------------------------------------------
on is_running(appName)
  tell application "System Events" to (name of processes) contains appName
end is_running

on quitChromia()
  repeat while is_running("Chromium")
    tell application "Chromium"
      quit
    end tell
  end repeat
end quitChromia
------------------------------------------------
------------------------------------------------
------------------------------------------------

------------------------------------------------
-- Now delete all directories beginning with directoryData.
------------------------------------------------
on deleteProfileData()
  try
    do shell script "rm -r ./directoryData*;"
  on error
    display dialog "No test directories to delete"
  end try
end deleteProfileData
------------------------------------------------
------------------------------------------------
------------------------------------------------

------------------------------------------------
-- Make profile data directories.
------------------------------------------------
on makeProfileData(numberThereof)
  tell application "Finder"
    repeat with i from 1 to numberThereof
      do shell script "mkdir directoryData" & i
    end repeat
  end tell
end makeProfileData
------------------------------------------------
------------------------------------------------
------------------------------------------------

------------------------------------------------
-- Make profile data directories.
------------------------------------------------
on openInstances(numberThereof)
  set chromium to "/Applications/Chromium.app"
  repeat with i from 1 to numberThereof
    set userdatadir to "\"/Applications/Chromiums/directoryData"& i & "\""
    do shell script "open /Applications/Chromium.app -n --args --user-data-dir="&userdatadir
  end repeat
end openInstances
------------------------------------------------
------------------------------------------------
------------------------------------------------

------------------------------------------------
-- Direct instances.
------------------------------------------------
on directInsances(numberThereof)

  --First get instances
  tell application "System Events"
    set currentProcesses to unix id of every application process whose name = "Chromium"
  end tell

  repeat with unixID in currentProcesses
    log unixID
  end repeat

end directInsances
------------------------------------------------
------------------------------------------------
------------------------------------------------

------------------------------------------------
-- Direct instance.
------------------------------------------------
on directInsance(which)

end directInsance
------------------------------------------------
------------------------------------------------
------------------------------------------------

------------------------------------------------
-- Run
------------------------------------------------
on run argv

  set numInstances to (item 1 of argv)

  quitChromia()
  deleteProfileData()
  makeProfileData(numInstances)
  openInstances(numInstances)
  directInsances(numInstances)
end run
------------------------------------------------
------------------------------------------------
------------------------------------------------

--on run argList
--  try
--    class of argList
--  on error
--    set argList to {"No arguments were passed!"}
--  end try
--
--  TestHandler(item 1 of argList)
--end run
--
--on TestHandler(somevar)
--  set contentText to somevar as string
--  display dialog contentText
--end TestHandler