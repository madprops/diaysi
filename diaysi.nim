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

proc get_time(): (int, int, int) =
  let time = now()
  let hour = time.hour
  let minutes = time.minute
  let seconds = time.second
  return (hour, minutes, seconds)

proc colon_string(args: varargs[int]): string =
  result = ""

  for i, num in args:
    if i > 0:
      result.add " : "

    result.add get_num_str(num)

proc do_show_1(num: int) =
  let num_str = get_num_str(num)
  stdout.write num_str
  flush()
  sleep duration

  for i in 1..num_str.len:
    stdout.write "\b \b"

  flush()

# Method with shell flash
proc show_1() =
  let (hour, minutes, seconds) = get_time()

  hide_cursor()

  # Hour
  do_show_1 hour
  sleep gap

  # Minutes
  do_show_1 minutes
  sleep gap

  show_cursor()

# Method with popup notifications
proc show_2() =
  let (hour, minutes, seconds) = get_time()
  let stime = colon_string(hour, minutes)
  discard execCmd(fmt"notify-send '{stime}'")

proc main() =
  let args = commandLineParams()

  if args.len > 0:
    let arg = args[0]

    if arg == "2":
      show_method = 2

  if show_method == 1:
    show_1()
  elif show_method == 2:
    show_2()

when is_main_module:
  main()