defmodule MyList do

  def len([])              , do: 0
  def len([ _head | tail ]), do: 1 + len(tail)

  def square([])             , do: []
  def square([ head | tail ]), do: [ head * head | square(tail) ]

  def map([], _func)            , do: []
  def map([ head | tail ], func), do: [ func.(head) | map(tail, func) ]

  # public method where we don't have to pass the initial value to start
  def sum_1(list)                    , do: _sum(list, 0)

  # private methods
  defp _sum([], total)             , do: total
  defp _sum([ head | tail ], total), do: _sum(tail, head + total)

  def sum([])             , do: 0
  def sum([ head | tail ]), do: head + sum(tail)

  def reduce([], memo, _func), do: memo
  def reduce([ head | tail ], memo, func), do: reduce(tail, func.(head, memo), func)

  def max([ head | tail ]), do: _max(tail, head)

  def _max([], max), do: max

  def _max([ head | tail ], max) when head > max do
    _max(tail, head)
  end

  def _max([ _head | tail ], max) do
    _max(tail, max)
  end

  def mapsum([], _func), do: 0
  def mapsum([ head | tail ], func), do: func.(head) + mapsum(tail, func)

  def span(from, to) when from > to do
    []
  end
  def span(from, to) do
    [ from | span(from + 1, to)]
  end

end
