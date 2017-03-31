defmodule Parallel do

  def pmap(collection, func) do
    me = self()
    collection
    |> Enum.map(fn (element) ->
        spawn_link fn -> (send me, { self(), func.(element)}) end
      end)
    |> Enum.map(fn (pid) ->
        receive do
          {^pid, result} -> result
        end
      end)
  end

end
