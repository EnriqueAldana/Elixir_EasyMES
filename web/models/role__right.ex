defmodule MesPhoenix.Role_Right do
  use Ecto.Schema
  import Ecto.Changeset
    import Ecto.Query
  use MesPhoenix.Web, :model
alias Mes_phoenix.Repo
 # embedded_schema do
  #  field :id_role
  #  field :id_right
  #end
  schema "roles_rights" do
    belongs_to :id_role, MesPhoenix.Role
    belongs_to :id_right, MesPhoenix.Right
    timestamps()
  end

  @required_fields ~w(id_role id_right)

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast_assoc(params, [:id_role, :id_right])
    #|> validate_required(@required_fields)
  end

  def registration_changeset(struct, params \\ %{}) do
    struct
    |> cast_assoc(params, [:id_role, :id_right])
    |> validate_required(@required_fields)
    |> unique_constraint(:role_right_repeated,
      name: :roles_rights_role_right_index,
      message: "There is another Role Right combination with the same Role Key name  and Right name ")

    #put_change(changeset,:right_string , :module_name <> "_" <> :action_name )
  end
defp role_ship_changeset(changes) do
    %MesPhoenix.Role_Right{id_role: :id_role,
      id_right: :id_right}
  end
  def to_multi(params \\ %{}) do
     Ecto.Multi.new
       #|> Ecto.Multi.insert(:account, account_changeset(params))
       #|> Ecto.Multi.insert(:user, user_changeset(params))
       |> Ecto.Multi.run Role_Right, fn changes ->
         Repo.insert role_ship_changeset(changes)
       end
   end
end
