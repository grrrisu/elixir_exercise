defmodule SpawnPong do

  def pong do
    receive do
      {sender, msg} ->
        send sender, {:ok, "#{msg} Pong"}
        pong() # tail-recursion / wait again for the next incoming msg
    end
  end

  def ping do
    pid = spawn(SpawnPong, :pong, [])
    send pid, {self(), "Ping"}

    receive do
      {:ok, msg} ->
        IO.puts "Answer: #{msg}"
      after 500 ->
        IO.puts "No answer received after 500ms"
    end
  end

end
