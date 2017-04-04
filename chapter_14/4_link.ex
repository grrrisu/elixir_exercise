defmodule Link do
  import :timer, only: [sleep: 1]

  def boom do
    sleep 500
    exit(:boom)
  end


  def run do
    spawn(Link, :boom, [])
    receive do
      msg ->
        IO.puts "Message received #{inspect msg}"
    after 1000 ->
      IO.puts "nothing happened"
    end
  end

  def run_link do
    spawn_link(Link, :boom, [])
    receive do
      msg ->
        IO.puts "Message received #{inspect msg}"
    after 1000 ->
      IO.puts "nothing happened"
    end
  end

end

# Link.run
# will output 'nothing happened' as it didn't get notified about
# the crash of the child process


# Link.run_link
# will also crash the parent process
# output: ** (EXIT from #PID<0.79.0>) :boom
