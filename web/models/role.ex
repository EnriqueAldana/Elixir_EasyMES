defmodule MesPhoenix.Role do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  use MesPhoenix.Web, :model

  schema "roles" do
    field :key_role, :string
    field :description, :string
    # belongs_to :user_uuid, MesPhoenix.UserUuid
    #It does not need an MesPhoenix.UserRoles model.
    # join_keys: [child_id: :id, parent_id: :user_uuid]
    #many_to_many :users, MesPhoenix.User, join_through: MesPhoenix.User_Role,join_keys: [child_id: :id, parent_id: :user_uuid]
    #many_to_many :rights, MesPhoenix.Right, join_through: MesPhoenix.Role_Right,join_keys: [child_id: :id, parent_id: :right_id]
      timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:key_role, :description])
    |> validate_required([:key_role, :description])
    |> unique_constraint(:key_role,
      name: :roles_key_role_index,
      message: "There is another Role with the same Key Role. Try with other Key Role")

  end

  def alphabetical(query) do
    from c in query, order_by: c.key_role
  end

  def names_and_ids(query) do
    from c in query, select: {c.key_role, c.id}
  end

end
