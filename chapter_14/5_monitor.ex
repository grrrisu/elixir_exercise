defmodule Monitor do
  import :timer, only: [sleep: 1]

  def boom do
    sleep 500
    exit(:boom)
  end


  def run_link do
    Process.flag(:trap_exit, true)
    spawn_link(Monitor, :boom, [])
    receive do
      msg ->
        IO.puts "Message received #{inspect msg}"
    after 1000 ->
      IO.puts "nothing happened"
    end
  end

  def run_monitor do
    spawn_monitor(Monitor, :boom, [])
    receive do
      msg ->
        IO.puts "Message received #{inspect msg}"
    after 1000 ->
      IO.puts "nothing happened"
    end
  end

end

# Process.flag(:trap_exit, true)
# parent process gets notified about the crash of the child process
# by receiving a :EXIT message
# Monitor.run_link

# spawn_monitor
# parent process gets notified about the crash of the child process
# by receiving a :DOWN message
# Monitor.run_monitor
# Message received {:DOWN, #Reference<0.0.6.343>, :process, #PID<0.87.0>, :boom}
