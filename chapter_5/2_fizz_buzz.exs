fizz_buzz = fn
  (0, 0, _) -> "FizzBuzz"
  (0, _, _) -> "Fizz"
  (_, 0, _) -> "Buzz"
#  (_, _, a) -> a
end

IO.puts fizz_buzz.(0,0,6)
IO.puts fizz_buzz.(0,5,6)
IO.puts fizz_buzz.(1,0,6)
IO.puts fizz_buzz.(1,2,6)

rem_fizz_buzz = fn
  (n) -> fizz_buzz.(rem(n,3), rem(n,5), n)
end

IO.puts '----------------'

IO.puts rem_fizz_buzz.(10)
IO.puts rem_fizz_buzz.(11)
IO.puts rem_fizz_buzz.(12)
IO.puts rem_fizz_buzz.(13)
IO.puts rem_fizz_buzz.(14)
IO.puts rem_fizz_buzz.(15)
IO.puts rem_fizz_buzz.(16)
IO.puts rem_fizz_buzz.(17)
IO.puts rem_fizz_buzz.(18)
IO.puts rem_fizz_buzz.(19)
