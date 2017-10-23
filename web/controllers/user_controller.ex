# web/controllers/user_controller.ex

defmodule MesPhoenix.UserController do
  use MesPhoenix.Web, :controller
plug :authenticate_user when action in [:index, :show, :new,:update,:edit]
#plug :fallbackcontroller when action in [:index, :show, :new,:update,:edit]
#plug :authorization_user,[mod_name: :UserController, act_name: [:index, :show, :new,:create, :update,:edit]] when action in [:index, :show, :new,:update,:edit]
plug :authorization_user when action in [:index, :show, :new,:create,:update,:edit]

plug :scrub_params, "user" when action in [:create]

alias MesPhoenix.User
alias MesPhoenix.Console
require Logger

  def index(conn, _params) do
    user = conn.assigns.current_user
    users= Mes_phoenix.Repo.all(User)
    render conn, "index.html", users: users

  end

  def show(conn, %{"id" => id}) do
    user = conn.assigns.current_user
      user = Mes_phoenix.Repo.get_by(User, id: id)
        render(conn, "show.html", user: user)
  end

  def new(conn, _params) do
    user = conn.assigns.current_user
    changeset = User.changeset(%User{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"user" => user_params}) do

     changeset = %User{} |> User.registration_changeset(user_params)

     try do
            case Mes_phoenix.Repo.insert(changeset) do
                {:ok, model} ->
                conn
                |> put_flash(:info, "#{model.user_name} created!")
                |> redirect(to: user_path(conn, :index, model))
                {:error, changeset} ->
                    render(conn, "new.html", changeset: changeset)
                #{:unique_constraint_user_name_email_index,changeset} ->
                _ ->
                raise " Has been one error on insert records on User table"
            end
     rescue
        e in RuntimeError -> Console.write_line("An error occurred: " <> e.message)
     after
       Console.write_line("The end of User create - Insert record on Users table!")

     end
  end

  def edit(conn, %{"id" => id}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Repo.get!(User, id)
    changeset = User.changeset(user, user_params)

    case Repo.update(changeset) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: user_path(conn, :show, user))
      {:error, changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset)
    end
  end



end
