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

end
