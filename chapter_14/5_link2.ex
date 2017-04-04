defmodule Link2 do
  import :timer, only: [sleep: 1]

  def boom do
    sleep 500
    exit(:boom)
  end


  def run do
    Process.flag(:trap_exit, true)
    spawn_link(Link2, :boom, [])
    receive do
      msg ->
        IO.puts "Message received #{inspect msg}"
    after 1000 ->
      IO.puts "nothing happened"
    end
  end

end

# Process.flag(:trap_exit, true)
# parent process get notified about the crash of the child process
# by receiving a :EXIT message
# Link2.run
