# Structs
defmodule Subscriber do

  defstruct name: "", paid: false, over_18: true

  def greet(%Attendee{name: name}) when name != "" do
    IO.puts "Welcome #{name}"
  end

  def greet(%Attendee{}) do
    raise "missing name for badge"
  end

end

s1 = %Subscriber{}                           # %Subscriber{name: "", over_18: true, paid: false}
s2 = %Subscriber{ name: "Dave" }             # %Subscriber{name: "Dave", over_18: true, paid: false}
s3 = %Subscriber{ name: "Mary", paid: true } # %Subscriber{name: "Mary", over_18: true, paid: true}
# update
s4 = %Subscriber{ s3 | name: "Marie"}        # %Subscriber{name: "Marie", over_18: true, paid: true}

Subscriber.greet(s1) # => raise
Subscriber.greet(s2) # => "Welcome Dave"
