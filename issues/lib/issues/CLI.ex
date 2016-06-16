defmodule CLI do

  def run(argv) do
    parse(OptionParser.parse(argv, switches: [help: :boolean], aliases: [:h, :help] ))
  end

  def parse([help: true], _ , _ ) do
    IO.puts "help me!"
  end

  def parse(_, [user, project, count], _) do
    IO.puts "got #{user} #{project} #{count}"
  end

  def parse(_, [user, project], _) do
    IO.puts "got #{user} #{project}"
  end

  def parse(_, _, error) do
    IO.puts "error #{error}"
    IO.puts "usage: myapp user project <count>"
  end

  def parse(one) do
    IO.puts "One: #{one}"
  end

end
