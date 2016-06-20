defmodule CLITest do
  use ExUnit.Case
  doctest Issues

  import Issues.CLI

  test "parse argv with help" do
    assert Issues.CLI.parse_args({[help: true], [], []}) == :help
  end

  test "parse argv with project and user" do
    assert Issues.CLI.parse_args({[], ["grrrisu", "dawning", "100"], []}) == {"grrrisu", "dawning", 100}
    assert Issues.CLI.parse_args({[], ["grrrisu", "dawning"], []})        == {"grrrisu", "dawning", 5}
  end

  # test "process with help" do
  #   assert CLI.process(:help) == System.halt(0)
  # end
  #
  # test "process with user and project" do
  #   assert CLI.process(:help) == END RESULT
  # end

  test "sort issue list ascending" do
    list = [
      %{"name" => "a", "created_at" => "2016-06-21T22:08:17Z"},
      %{"name" "b", "created_at" => "2016-01-21T22:08:17Z"},
      %{"name" "c", "created_at" => "2017-01-21T22:08:17Z"}
    ]
    sorted_list = Issues.CLI.sort_issues(list)
    assert  Enum.map(sorted_list, &(&1["name"])) == ["b", "a", "c"]
  end

end
