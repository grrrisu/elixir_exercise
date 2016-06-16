# all?
defmodule MyEnum do

  def all?([], _func), do: true

  def all?([head | tail], func) do
    func.(head) && all?(tail, func)
  end

  def all?(collection, func) do
    all?(Enum.to_list(collection), func)
  end

end
