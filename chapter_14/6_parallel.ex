defmodule Parallel do

  def pmap(collection, func) do
    me = self() # send all results back to me (first process)
    collection
    |> Enum.map(fn (element) ->
        spawn_link fn -> (send me, { self(), func.(element)}) end
      end)
    |> Enum.map(fn (pid) ->
        receive do
          {^pid, result} -> result # ^pid keeps results in order
        end
      end)
  end

end
