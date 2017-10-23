#---
# Excerpted from "Programming Phoenix",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material,
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose.
# Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
#---
defmodule MesPhoenix.SessionController do
  use MesPhoenix.Web, :controller
alias Mes_phoenix.Repo

  def new(conn, _) do
    render conn, "new.html"
  end
  def home(conn, _) do
    render conn, "home.html"
  end
  def create(conn, %{"session" => %{"email" => email, "password" =>
                                     pass}}) do
    case MesPhoenix.Auth.login_by_username_and_pass(conn, email, pass, repo:
                                               Repo) do
      {:ok, conn} ->
        conn
        |> put_flash(:info, "Welcome back!")
        |> redirect(to: page_path(conn, :home))
      {:error, _reason, conn} ->
        conn
        |> put_flash(:error, "Invalid username/password combination")
        |> render("new.html")
    end
  end

  def delete(conn, _) do
    conn
    |> MesPhoenix.Auth.logout()
    |> redirect(to: page_path(conn, :index))
  end


end
