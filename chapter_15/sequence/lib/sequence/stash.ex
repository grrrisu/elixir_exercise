defmodule Sequence.Stash do
  use GenServer

  def handle_call(:get_value, _client, value) do
    {:reply, value, value}
  end

  def handle_cast({:set_value, new_value}, _value) do
    {:noreply, new_value}
  end

  # External API
  def start_link(current_number) do
    {:ok, _pid} = GenServer.start_link(__MODULE__, current_number)
  end

  def get_value(pid) do
    GenServer.call(pid, :get_value)
  end

  def set_value(pid, value) do
    GenServer.cast(pid, {:set_value, value})
  end

end
