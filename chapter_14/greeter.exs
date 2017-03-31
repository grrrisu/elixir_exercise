defmodule Greeter do
  def greet do
    receive do
      {sender, message} ->
        send sender, {:ok, "Hello #{message}"}
        greet
    end
  end
end

pid = spawn Greeter, :greet, []
send pid, { self, "World"}

receive do
  {:ok, message} ->
    IO.puts message
  after 500 ->
    "call took too long"
end

send pid, { self, "Mars"}

receive do
  {:ok, message} ->
    IO.puts message
  after 500 ->
    "call took too long"
end
