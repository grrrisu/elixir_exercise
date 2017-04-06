defmodule Sequence2 do
  use Application

  def start(_type, _args) do
    {:ok, _pid} = Sequence.Supervisor.start_link(100)
  end
  
end
