# I want to make a replacement of linux's date command/program.
# To output date. however there are some rules.
# When the program is called, it will show the HOUR (H).
# Then it will delete that after x milliseconds.
# Then it will print the MINUTES (M) for x milliseconds.
# Then it will clear it as well or exit.
# It is temporary information.

import times
import terminal
import os

proc main() =
  # Get current time
  let currentTime = now()
  let hour = currentTime.hour
  let minute = currentTime.minute

  # Initialize terminal
  hideCursor()

  # Display hour
  stdout.write $hour
  stdout.flushFile()
  sleep(1000)

  # Clear just the number, not the whole line
  let digits = ($hour).len

  for i in 1..digits:
    stdout.write("\b \b")

  stdout.flushFile()

  # Display minute
  stdout.write $minute
  stdout.flushFile()
  sleep(1000)

  # Clear final output and restore cursor
  let minuteDigits = ($minute).len

  for i in 1..minuteDigits:
    stdout.write("\b \b")

  stdout.flushFile()
  showCursor()

when isMainModule:
  main()