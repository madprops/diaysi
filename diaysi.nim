# When the program is called, it will show the HOUR (H).
# Then it will delete that after x milliseconds.
# Then it will print the MINUTES (M) for x milliseconds.
# Then it will print the SECONDS (S) for x milliseconds.
# Then it will clear it as well or exit.
# It is temporary information.

import times
import terminal
import strutils
import os

# Show each number for this duration
let duration = 800

# Wait before showing the next number
let gap = 350

proc show(num: int) =
  let num_str = align($num, 2, '0')
  stdout.write num_str
  stdout.flushFile()
  sleep duration

  for i in 1..num_str.len:
    stdout.write "\b \b"

  stdout.flushFile()

proc main() =
  let time = now()
  let hour = time.hour
  let minutes = time.minute
  let seconds = time.second

  hideCursor()

  # Hour
  show hour
  sleep gap

  # Minutes
  show minutes
  sleep gap

  # Seconds
  show seconds

  showCursor()

when isMainModule:
  main()