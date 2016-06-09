defmodule Chop do

  def guess(actual, range) do
    try(actual, div(range.last, 2), range)
  end

  def next_guess(min, max) do
    min + div(max - min, 2)
  end

  def try(actual, guess, _) when actual === guess do
    IO.puts "Success found #{guess}"
  end

  def try(actual, guess, range) when actual < guess do
    IO.puts "guess #{guess} too high"
    next_guess = next_guess(range.first, guess)
    try(actual, next_guess, range.first..guess)
  end

  def try(actual, guess, range) when actual > guess do
    IO.puts "guess #{guess} too low"
    next_guess = next_guess(guess, range.last)
    try(actual, next_guess, guess..range.last)
  end

end

Chop.guess(273, 1..1000)
