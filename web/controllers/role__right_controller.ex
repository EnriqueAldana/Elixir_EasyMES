defmodule MesPhoenix.Role_RightController do
  use MesPhoenix.Web, :controller
  alias Mes_phoenix.Repo
  alias MesPhoenix.Role
  alias MesPhoenix.Right
  require Logger

  plug :load_rights when action in [:edit]

  defp load_rights(conn, _) do
    query =
    Right
    |> Right.alphabetical
    |> Right.names_and_ids

    #Logger.debug("load_rights query string #{inspect(query)}")
    rights = Repo.all query
    assign(conn, :rights, rights)
  end
  def index(conn, _params) do
    role_rights = Repo.all(Role) |> Repo.preload(:rights)
    render(conn, "index.html", role_rights: role_rights)
  end

  def edit(conn,%{"id" => id}) do
    role = Repo.get!(Role, id) |> Repo.preload(:rights)
    param_map = %{key_role: role.key_role, description: role.description}
    changeset = MesPhoenix.Role.changeset(role,param_map)
    render(conn, "edit.html", role: role, changeset: changeset)
  end

  def update(conn, %{"id" => id, "role" => rights_params}) do
    roles = Repo.get_by(Role, id: id) |> Repo.preload(:rights)
    param_list= rights_params["rights_assigned"]
    param_list_num= Enum.map(param_list, fn(x) -> String.to_integer(x) end)
    rights = MesPhoenix.Right |> MesPhoenix.Right.by_ids(param_list_num) |> Repo.all |> Repo.preload(:roles)
    changeset_roles = Ecto.Changeset.change(roles)
    changeset = MesPhoenix.Role.changeset_create(changeset_roles,rights)
    if changeset.valid? do
      case Mes_phoenix.Repo.update(changeset) do
          {:ok, _} ->
              conn
              |> put_flash(:info, "The Role has been assigned with rights successfully.")
              |> redirect(to: role__right_path(conn, :index))
          {:error, changeset} ->
              render(conn, "edit.html", changeset: changeset)
      end
    end
  end
  @doc """
    Updateing without rights selected
  """
  def update(conn, %{"id" => id}) do
    roles = Repo.get_by(Role, id: id) |> Repo.preload(:rights)
    param_list_num= []
    rights = MesPhoenix.Right |> MesPhoenix.Right.by_ids(param_list_num) |> Repo.all |> Repo.preload(:roles)
    changeset_roles = Ecto.Changeset.change(roles)
    changeset = MesPhoenix.Role.changeset_create(changeset_roles,rights)
    if changeset.valid? do
      case Mes_phoenix.Repo.update(changeset) do
          {:ok, _} ->
              conn
              |> put_flash(:info, "Role assigned with rights has been created successfully.")
              |> redirect(to: role__right_path(conn, :index))
          {:error, changeset} ->
              render(conn, "edit.html", changeset: changeset)
      end
    end
  end

end
