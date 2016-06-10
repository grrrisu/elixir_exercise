# Convert a float to a string with two decimal digits. (Erlang)
:io.format("~.2f~n", [2.0/3.0])

# Get the value of an operating-system environment variable. (Elixir)
System.get_env("_system_name")

# Return the extension component of a file name (so return .exs if given"dave/test.exs"). (Elixir)
String.split("chapter_6/6_exercise.exs", ".") |> List.last
Path.extname("chapter_6/6_exercise.exs")

# Return the process’s current working directory. (Elixir)
System.cwd

# Convert a string containing JSON into Elixir data structures. (Just find; don’t install.)
# eg. Poison

# Execute a command in your operating system’s shell.
System.cmd("echo", ["hello"])
