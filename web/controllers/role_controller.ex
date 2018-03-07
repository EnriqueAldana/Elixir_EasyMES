defmodule MesPhoenix.RoleController do
  use MesPhoenix.Web, :controller
  plug :authenticate_user when action in [:index, :show, :new, :edit,:update,:delete]
  plug :scrub_params, "role" when action in [:create]
  plug :load_rights when action in [:new, :create, :edit, :update]

  alias MesPhoenix.Right
  alias MesPhoenix.Role
  alias Mes_phoenix.Repo

require Logger

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
    roles = Repo.all(Role)
    render(conn, "index.html", roles: roles)
  end

  def new(conn, _params) do
    changeset = Role.changeset(%Role{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"role" => role_params}) do
    changeset = Role.changeset(%Role{}, role_params)
    Logger.debug "Role Parameters trying to create: #{inspect(role_params)}"
    case Repo.insert(changeset) do
      {:ok, _role} ->
        conn
        |> put_flash(:info, "Role created successfully.")
        |> redirect(to: role_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    role = Repo.get!(Role, id)
    render(conn, "show.html", role: role)
  end

  def edit(conn, %{"id" => id}) do
    role = Repo.get!(Role, id)
    changeset = Role.changeset(role)
    render(conn, "edit.html", role: role, changeset: changeset)
  end

  def update(conn, %{"id" => id, "role" => role_params}) do
    role = Repo.get!(Role, id)
    IO.inspect role_params
    changeset = Role.changeset(role, role_params)

    case Repo.update(changeset) do
      {:ok, role} ->
        conn
        |> put_flash(:info, "Role updated successfully.")
        |> redirect(to: role_path(conn, :show, role))
      {:error, changeset} ->
        render(conn, "edit.html", role: role, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    role = Repo.get!(Role, id)
    changeset = Role.changeset_delete(role)
    case Repo.delete(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Role deleted successfully.")
        |> redirect(to: role_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "Role has not been deleted. The role with key named as #{role.key_role} has a right associated. ")
        |> redirect(to: role_path(conn, :index))
    end


  end
end
