# lib/my_app_web/controllers/fallback_controller.ex
defmodule MesPhoenix.FallbackController do
use MesPhoenix.Web, :controller

  def call(conn, {:error, :unauthorized}) do
    conn
    |> put_status(:forbidden)
    |> render(MesPhoenix.ErrorView, :"403")
  end
end
