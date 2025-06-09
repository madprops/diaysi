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

let delay = 1000

proc show(num: int) =
  let snum = align($num, 2, '0')
  stdout.write snum
  stdout.flushFile()
  sleep(delay)

  for i in 1..snum.len:
    stdout.write("\b \b")

  stdout.flushFile()

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