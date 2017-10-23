defmodule MesPhoenix.RedirectController do
  use MesPhoenix.Web, :controller
  @send_to "/"

  def redirector_to_home(conn, _params), do: redirect(conn, to: @send_to)

end
