defmodule SpawnBasic do

  def greet do
    IO.puts "hello from spawned process"
  end

end

# spawn(SpawnTest, :greet, [])
