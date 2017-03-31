defmodule Chain do

  def counter(next_pid) do
    receive do
      n ->
        send next_pid, n + 1
    end
  end

  def create_process(n) do
    # build the chain of process waiting for incoming message
    last = Enum.reduce 1..n, self(),
            fn(_, current_counter) ->
              spawn(Chain, :counter, [current_counter])
            end

    # send a message to the last process, passing the count through the chain and back again
    send last, 0

    receive do
      final_answer when is_integer(final_answer) ->
        "Result is #{inspect(final_answer)}"
    end
  end

  def run(n) do
    IO.puts inspect :timer.tc(Chain, :create_process, [n])
  end

end
