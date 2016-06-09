defmodule Greeter do

  def for(name, greeting) do
    fn
      (^name) -> IO.puts "#{greeting} #{name}"
      (_)     -> IO.puts "I don't know you!"
    end
  end

end

mr_valim = Greeter.for("Valim", "Olà")

mr_valim.("Valim")
mr_valim.("Dave")
