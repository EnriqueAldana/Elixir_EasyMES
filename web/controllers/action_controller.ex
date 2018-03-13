defmodule MesPhoenix.ActionController do
  use MesPhoenix.Web, :controller

  alias MesPhoenix.Action
  plug :authenticate_user when action in [:index, :new,:create,:show,:edit,:update, :delete]
  plug :authorization_user when action in [:index, :new,:create,:show,:edit,:update, :delete]

  def index(conn, _params) do
    actions = Repo.all(Action)
    render(conn, "index.html", actions: actions)
  end

  def new(conn, _params) do
    changeset = Action.changeset(%Action{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"action" => action_params}) do
    #IO.puts action_params
    changeset = Action.changeset(%Action{}, action_params)

    case Repo.insert(changeset) do
      {:ok, _action} ->
        conn
        |> put_flash(:info, "Action created successfully.")
        |> redirect(to: action_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    action = Repo.get!(Action, id)
    render(conn, "show.html", action: action)
  end

  def edit(conn, %{"id" => id}) do
    action = Repo.get!(Action, id)
    changeset = Action.changeset(action)
    render(conn, "edit.html", action: action, changeset: changeset)
  end

  def update(conn, %{"id" => id, "action" => action_params}) do
    action = Repo.get!(Action, id)
    changeset = Action.changeset(action, action_params)

    case Repo.update(changeset) do
      {:ok, action} ->
        conn
        |> put_flash(:info, "Action updated successfully.")
        |> redirect(to: action_path(conn, :show, action))
      {:error, changeset} ->
        render(conn, "edit.html", action: action, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    action = Repo.get!(Action, id)
    changeset = Action.changeset_delete(action)
    case Repo.delete(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Action deleted successfully.")
        |> redirect(to: action_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "Action has not been deleted. The action with key named as #{action.action_name} has a right associated. ")
        |> redirect(to: action_path(conn, :index))
    end
  end
end
