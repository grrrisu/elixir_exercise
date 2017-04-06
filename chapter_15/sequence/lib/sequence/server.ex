defmodule Sequence.Server do
  use GenServer

  def handle_call(:next_number, _client_pid, current_number) do
    # reply with 2nd argument, set the new state as 3rd argument
    { :reply, current_number, current_number + 1 }
  end

  def handle_call({:set_number, new_number}, _client_pid, _current_number) do
    { :reply, {:ok, new_number}, new_number }
  end

  def handle_cast({:increment, delta}, current_number) do
    # does not reply, set the new state to the second argument
    { :noreply, current_number + delta }
  end

  # def init(start_arguments) do
  #   {:ok, state}
  #   {:stop, reason}
  # end
  #
  # def info(info, state) do
  #
  # end
  #
  # def terminate(reason, state) do
  #
  # end
  #
  # def code_change(from_version, state, extra) do
  #
  # end
  #
  # def format_status(reason, [pdict, state]) do
  #
  # end

  # External API
  def start_link(current_number) do
    GenServer.start_link(__MODULE__, current_number, name: __MODULE__)
  end

  def next_number do
    GenServer.call(__MODULE__, :next_number)
  end

  def increment_number(delta) do
    GenServer.call(__MODULE__, {:increment_number, delta})
  end

end

# {:ok, pid} = GenServer.start_link(Sequence.Server, 100, name: :seq, debug: [:trace, :statistics])
# GenServer.call(:seq, :next_number)
# 100
# GenServer.call(:seq, :next_number)
# 101
# GenServer.call(:seq, :next_number)
# 102
# GenServer.call(:seq, {:set_number, 999})
# {:ok, 999}
# GenServer.call(:seq, :next_number)
# 999

# with exteranl API
# {:ok, _pid} = Sequence.Server.start_link 100
# Sequence.Server.next_number
# 100
# Sequence.Server.increment_number 50
# 150
