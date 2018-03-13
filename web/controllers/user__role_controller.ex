defmodule MesPhoenix.User_RoleController do
  use MesPhoenix.Web, :controller
  alias Mes_phoenix.Repo
  alias MesPhoenix.Role
  alias MesPhoenix.User
  require Logger
  plug :authenticate_user when action in [:index, :edit,:update]
  plug :authorization_user when action in [:index, :edit,:update]
  plug :load_roles when action in [:edit]

  defp load_roles(conn, _) do
    query =
    Role
    |> Role.alphabetical
    |> Role.names_and_ids

    roles = Repo.all query
    assign(conn, :roles, roles)
  end
  def index(conn, _params) do
    users_roles = Repo.all(User) |> Repo.preload(:roles)
    render(conn, "index.html", users_roles: users_roles)
  end
  def edit(conn,%{"id" => id}) do
    user = Repo.get!(User, id) |> Repo.preload(:roles)
    param_map = %{user_name: user.user_name, email: user.email}
    changeset = MesPhoenix.User.changeset(user,param_map)
    render(conn, "edit.html", user: user, changeset: changeset)
  end

  def update(conn, %{"id" => id, "user" => roles_params}) do
    user = Repo.get_by(User, id: id) |> Repo.preload(:roles)
    param_list= roles_params["roles_assigned"]
    param_list_num= Enum.map(param_list, fn(x) -> String.to_integer(x) end)
    roles = MesPhoenix.Role |> MesPhoenix.Role.by_ids(param_list_num) |> Repo.all |> Repo.preload(:users)
    changeset_user = Ecto.Changeset.change(user)
    changeset = MesPhoenix.User.changeset_user_role_create(changeset_user,roles)
    if changeset.valid? do
      case Mes_phoenix.Repo.update(changeset) do
          {:ok, _} ->
              conn
              |> put_flash(:info, "The User has been assigned with roles successfully.")
              |> redirect(to: user__role_path(conn, :index))
          {:error, _} ->
              conn
              |> redirect(to: user__role_path(conn, :index))
      end
    end
  end
  @doc """
    Updateing without roles selected
  """
  def update(conn, %{"id" => id}) do
    user = Repo.get_by(User, id: id) |> Repo.preload(:roles)
    param_list_num= []
    roles = MesPhoenix.Role |> MesPhoenix.Role.by_ids(param_list_num) |> Repo.all |> Repo.preload(:users)
    changeset_user = Ecto.Changeset.change(user)
    changeset = MesPhoenix.User.changeset_user_role_create(changeset_user,roles)
  if changeset.valid? do
      case Mes_phoenix.Repo.update(changeset) do
          {:ok, _} ->
              conn
              |> put_flash(:info, "User assigned with roles has been created successfully.")
              |> redirect(to: user__role_path(conn, :index))
          {:error, _} ->
            conn
              |> redirect(to: user__role_path(conn, :index))
      end
    end
  end

end
