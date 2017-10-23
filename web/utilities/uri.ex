defmodule MesPhoenix.Uri do

  def get_path(uri_path) do

    #URI.parse("http://elixir-lang.org/")
    #%URI{scheme: "http", path: "/", query: nil, fragment: nil,
    #   authority: "elixir-lang.org", userinfo: nil,
    #   host: "elixir-lang.org", port: 80}
    # to delete some part of the URL
    #url= url_path_source |> URI.parse |> Map.put(:path, nil) |> URI.to_string
    # to get some part of the url
    if is_list uri_path do
      string_path= to_string uri_path
      IO.puts(string_path)
      {:ok,ruta}= string_path |> URI.parse |> Map.fetch(:path)
    else
      {:ok,ruta}= uri_path |> URI.parse |> Map.fetch(:path)
    end
  end
end
