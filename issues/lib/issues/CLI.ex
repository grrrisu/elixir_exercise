defmodule Issues.CLI do

  @default_count 5

  def run(argv) do
    argv
    |> OptionParser.parse(switches: [help: :boolean], aliases: [h: :help] )
    |> parse_args
    |> process
  end

  def parse_args({[help: true], _, []}) do
    :help
  end

  def parse_args({[], [user, project, count], []}) do
    {user, project, String.to_integer(count)}
  end

  def parse_args({[], [user, project], []}) do
    {user, project, @default_count}
  end


  def process(:help) do
    IO.puts "will fetch issues from a github repo"
    IO.puts "usage: issues user project [count | #{@default_count}]"
    System.halt(0)
  end

  def process({user, project, _count}) do
    Issues.Github.fetch(user, project)
    |> decode_response
  end


  def decode_response({:ok, json}), do: json

  def decode_response({:error, json}) do
    {_, message} = List.keyfind(json, "message", 0)
    IO.puts "Error fetching from Github: #{message}"
    System.halt(2)
  end

end
