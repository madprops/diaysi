# When the program is called, it will show the HOUR (H).
# Then it will delete that after x milliseconds.
# Then it will print the MINUTES (M) for x milliseconds.
# Then it will print the SECONDS (S) for x milliseconds.
# Then it will clear it as well or exit.
# It is temporary information.

import times
import terminal
import strutils
import osproc
import os

import std/strformat

# Show each number for this duration
let duration = 800

# Wait before showing the next number
let gap = 350

# The show method to use
var show_method = 1

proc flush() =
  stdout.flush_file()

proc get_num_str(num: int): string =
  return align($num, 2, '0')

# Method with shell flash
proc show_1(num: int) =
  let num_str = get_num_str(num)
  stdout.write num_str
  flush()
  sleep duration

  for i in 1..num_str.len:
    stdout.write "\b \b"

  flush()

# Method with popup notifications
proc show_2(num: int) =
  let num_str = get_num_str(num)
  discard execCmd(fmt"notify-send '{num_str}'")

proc show(num: int) =
  if show_method == 1:
    show_1(num)
  elif show_method == 2:
    show_2(num)

proc main() =
  let time = now()
  let hour = time.hour
  let minutes = time.minute
  let seconds = time.second

  # Get the first argument if any
  let args = commandLineParams()

  if args.len > 0:
    let arg = args[0]

    if arg == "2":
      show_method = 2

  hide_cursor()

  # Hour
  show hour
  sleep gap

  # Minutes
  show minutes
  sleep gap

  # Seconds
  show seconds

  show_cursor()

when is_main_module:
  main()