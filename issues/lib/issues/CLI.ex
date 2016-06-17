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

  def process({user, project, count}) do
    Issues.Github.fetch(user, project)
    # TODO temp
    :ok
  end

  def process(:help) do
    IO.puts "will fetch issues from a github repo"
    IO.puts "usage: issues user project [count | #{@default_count}]"
    System.halt(0)
  end

end
