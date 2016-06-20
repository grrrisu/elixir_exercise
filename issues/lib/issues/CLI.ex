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

  def process({user, project, count}) do
    Issues.Github.fetch(user, project)
    |> decode_response
    |> convert_list_to_map
    |> sort_issues
    |> Enum.take(count)
    |> print_table
  end


  def decode_response({:ok, json}), do: json

  def decode_response({:error, json}) do
    {_, message} = List.keyfind(json, "message", 0)
    IO.puts "Error fetching from Github: #{message}"
    System.halt(2)
  end

  def convert_list_to_map(list) do
    list
    |> Enum.map(&Enum.into(&1, Map.new))
  end

  def sort_issues(list) do
    Enum.sort list,
      fn item1, item2 -> item1["created_at"] <= item2["created_at"] end
  end

  def print_table(list) do
    IO.puts "#{String.ljust("id", 3)}| #{String.ljust("created_at", 20)}| title"
    IO.puts "---------------------------------------------------------------------------------------"
    Enum.each list,
      fn item ->
        id    = String.ljust(Integer.to_string(item["number"]), 3)
        date  = String.ljust(item["created_at"], 20)
        title = item["title"]
        IO.puts "#{id}| #{date}| #{title}"
      end
  end

end
