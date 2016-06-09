# Anonymous Functions

handle_open = fn
  {:ok, file} -> IO.puts "Read file: #{IO.read(file, :line)}"
  { _, error} -> IO.puts "Error: #{:file.format_error(error)}" # :file references the Erlang file module
end

handle_open.(File.open("../chapter_1/hello.exs")) # File references the Elixir File module
handle_open.(File.open("unknown_file"))
