defmodule Issues.Github do

  @browser_option [ {"User-Agent", "Elixir Fetcher"} ]

  @github_url Application.get_env(:issues, :github_url)

  def fetch(user, project) do
    url(user, project)
    |> HTTPoison.get(@browser_option)
    |> handle_response
  end

  def url(user, project) do
    "#{@github_url}/#{user}/#{project}/issues"
  end

  def handle_response({:ok, %{status_code: 200, body: body}}) do
    { :ok, parse_json(body) }
  end

  def handle_reponse({_, %{status_code: _, body: body}}) do
    { :error, parse_json(body) }
  end

  def parse_json(body) do
    Poison.Parser.parse!(body)
  end

end
