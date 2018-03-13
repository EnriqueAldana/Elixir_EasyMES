defmodule MesPhoenix.PageController do
  use MesPhoenix.Web, :controller
#  plug :authenticate_user when action in [:home, :no_right]
alias MesPhoenix.Console

require Logger

@send_to "/"

  def index(conn, _params) do
    user = User
    conn
    |> assign(:current_user, user)
    render conn, "index.html"
  end
  def home(conn, _params) do
    render conn, "home.html"
  end
  def no_right(conn, _params) do
    #Logger.debug "conn value: #{inspect(conn)}"
    back_url= get_session(conn,:url_path_source)
    Logger.debug "back_url value: #{inspect(back_url)}"
    #back_url1= String.slice(back_url, 1..-1)
    #Logger.debug "back_url1 value: #{inspect(back_url1)}"
    #back_url2= String.slice(back_url1, 0..-1)
    #Logger.debug "back_url value: #{inspect(back_url2)}"

    redirect(conn, to: back_url)
    #render conn, "no_right.html",back_url: back_url

  end
end
