defmodule MesPhoenix.Role_RightController do
  use MesPhoenix.Web, :controller
  alias Mes_phoenix.Repo
  alias MesPhoenix.Role_Right
  alias MesPhoenix.Role
  alias MesPhoenix.Right
require Logger
  plug :load_roles when action in [:new, :create, :edit, :update]
  plug :load_rights when action in [:new, :create, :edit, :update]

  defp load_roles(conn, _) do
    query =
    Role
    |> Role.alphabetical
    |> Role.names_and_ids

    Logger.debug("load_roles query string #{inspect(query)}")
    roles = Repo.all query
    assign(conn, :roles, roles)
  end
  defp load_rights(conn, _) do
    query =
    Right
    |> Right.alphabetical
    |> Right.names_and_ids

    Logger.debug("load_rights query string #{inspect(query)}")
    rights = Repo.all query
    assign(conn, :rights, rights)
  end
  def index(conn, _params) do
    role_rights = Repo.all(Role_Right)
#role_rights = []
    render(conn, "index.html", role_rights: role_rights)
  end

  def new(conn, _params) do
    changeset = Role_Right.changeset(%Role_Right{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"role__right" => role__right_params}) do
    changeset = Role_Right.changeset(%Role_Right{}, role__right_params)
if changeset.valid? do
  case Mes_phoenix.Repo.insert(changeset) do
      {:ok, model} ->
          conn
          |> put_flash(:info, "Role  right created successfully.")
          |> redirect(to: role__right_path(conn, :index))
        {:error, changeset} ->
          render(conn, "new.html", changeset: changeset)
  end
end
end
  defp copy_errors(from, to) do
    Enum.reduce from.errors, to, fn {field, {msg, additional}}, acc ->
      Ecto.Changeset.add_error(acc, field, msg, additional: additional)
    end
  end

  def show(conn, %{"id" => id}) do
    role__right = Repo.get!(Role_Right, id)
    render(conn, "show.html", role__right: role__right)
  end

  def edit(conn, %{"id" => id}) do
    role__right = Repo.get!(Role_Right, id)
    changeset = Role_Right.changeset(role__right)
    render(conn, "edit.html", role__right: role__right, changeset: changeset)
  end

  def update(conn, %{"id" => id, "role__right" => role__right_params}) do
    role__right = Repo.get!(Role_Right, id)
    changeset = Role_Right.changeset(role__right, role__right_params)

    case Repo.update(changeset) do
      {:ok, role__right} ->
        conn
        |> put_flash(:info, "Role  right updated successfully.")
        |> redirect(to: role__right_path(conn, :show, role__right))
      {:error, changeset} ->
        render(conn, "edit.html", role__right: role__right, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    role__right = Repo.get!(Role_Right, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(role__right)

    conn
    |> put_flash(:info, "Role  right deleted successfully.")
    |> redirect(to: role__right_path(conn, :index))
  end
end
