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

# Duration to show each number
let duration = 800

# Time to wait before showing the next number
let gap = 350

proc show(num: int) =
  let num_str = align($num, 2, '0')
  stdout.write num_str
  stdout.flushFile()
  sleep duration

  for i in 1..num_str.len:
    stdout.write("\b \b")

  stdout.flushFile()
  sleep gap

proc main() =
  let time = now()
  let hour = time.hour
  let minutes = time.minute
  let seconds = time.second

  hideCursor()
  # ---
  show hour
  show minutes
  show seconds
  # ---
  showCursor()

when isMainModule:
  main()