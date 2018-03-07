defmodule MesPhoenix.Role do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  use MesPhoenix.Web, :model

  schema "roles" do
    field :key_role, :string
    field :description, :string
    many_to_many :rights, MesPhoenix.Right, join_through: "roles_rights", on_replace: :delete
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
  def changeset_create(struct, rights_list \\ %{}) do
    struct
      |> Ecto.Changeset.put_assoc(:rights, rights_list)
  end

  def  changeset_delete(struct, params \\ %{}) do
      struct
      |> cast(params, [:key_role, :description])
      |> foreign_key_constraint(:id,
        name: :roles_rights_role_id_fkey,
        message: "This role is relationed with a right. Try to undo role and right relationship first")
  end
  def alphabetical(query) do
    from c in query, order_by: c.key_role
  end

  def names_and_ids(query) do
    from c in query, select: {c.key_role, c.id}
  end

end
