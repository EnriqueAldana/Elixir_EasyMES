defmodule MesPhoenix.User_Role do
  use Ecto.Schema
  import Ecto.Changeset
  use MesPhoenix.Web, :model

schema "users_roles" do
  field :id_user, :integer
  field :id_role, :integer
  #belongs_to :users, MesPhoenix.User
  #belongs_to :roles, MesPhoenix.Role
  timestamps()

end

@required_fields ~w(id_user id_role)

def changeset(model, params \\ %{}) do
  model
  |> cast(params, @required_fields)
   |> assoc_constraint(:users)
   |> assoc_constraint(:roles)
   |> unique_constraint(:users_roles,
     name: :users_roles_user_role_index,
     message: "There is another User Id and Role Id with the same values.")


end

end
