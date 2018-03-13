defmodule MesPhoenix.RightController do
  use MesPhoenix.Web, :controller
  plug :authenticate_user when action in [:index, :new,:create,:show,:edit,:update, :delete]
  plug :authorization_user when action in [:index, :new,:create,:show,:edit,:update, :delete]

  alias MesPhoenix.Right
  alias MesPhoenix.Action
  alias MesPhoenix.Module
  require Logger

  plug :load_actions when action in [:new, :create, :edit, :update]
  plug :load_modules when action in [:new, :create, :edit, :update]

  defp load_actions(conn, _) do
    query =
    Action
    |> Action.alphabetical
    |> Action.names_and_ids

    Logger.debug("load_actions query string #{inspect(query)}")
    actions = Repo.all query
    assign(conn, :actions, actions)
  end
  defp load_modules(conn, _) do
    query =
    Module
    |> Module.alphabetical
    |> Module.names_and_ids

    Logger.debug("load_modules query string #{inspect(query)}")
    modules = Repo.all query
    assign(conn, :modules, modules)
  end

  def index(conn, _params) do
    rights = Repo.all(Right)
    render(conn, "index.html", rights: rights)
  end

  def new(conn, _params) do
    changeset = Right.changeset(%Right{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"right" => right_params}) do

    module_id= right_params["module_id"]
    action_id= right_params["action_id"]
    IO.puts module_id
    module = Repo.get!(Module, module_id)
    IO.puts module.module_name
    action = Repo.get!(Action, action_id)
    right_params1= Map.put(right_params,"module_name",module.module_name)
    right_params2= Map.put(right_params1,"action_name",action.action_name)

    IO.inspect right_params2
    changeset = Right.registration_changeset(%Right{}, right_params2)

    case Repo.insert(changeset) do
      {:ok, _right} ->
        conn
        |> put_flash(:info, "Right created successfully.")
        |> redirect(to: right_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    right = Repo.get!(Right, id)
    render(conn, "show.html", right: right)
  end

  def edit(conn, %{"id" => id}) do
    right = Repo.get!(Right, id)
    changeset = Right.changeset(right)
    render(conn, "edit.html", right: right, changeset: changeset)
  end

  def update(conn, %{"id" => id, "right" => right_params}) do
    right = Repo.get!(Right, id)
    changeset = Right.changeset(right, right_params)

    case Repo.update(changeset) do
      {:ok, right} ->
        conn
        |> put_flash(:info, "Right updated successfully.")
        |> redirect(to: right_path(conn, :show, right))
      {:error, changeset} ->
        render(conn, "edit.html", right: right, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    right = Repo.get!(Right, id)

    # roles_rights_right_id_fkey
    changeset = Right.changeset_delete(right)
    case Repo.delete(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Right deleted successfully.")
        |> redirect(to: right_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "Right has not been deleted. The right  with right_string named as #{right.right_string} has a role associated. ")
        |> redirect(to: right_path(conn, :index))
    end



    # it to always work (and if it does not, it will raise).
    Repo.delete!(right)

    conn
    |> put_flash(:info, "Right deleted successfully.")
    |> redirect(to: right_path(conn, :index))
  end
end
