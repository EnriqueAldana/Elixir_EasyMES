defmodule MesPhoenix.Right do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  use MesPhoenix.Web, :model
  @primary_key {:id, :id, autogenerate: true}
  @derive {Phoenix.Param, key: :id}
  schema "rights" do
    field :module_name, :string
    field :action_name, :string
    field :right_string, :string
    field :module_id, :integer
    field :action_id, :integer
    many_to_many :roles, MesPhoenix.Role, join_through: "roles_rights"

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:module_name,:module_id, :action_name,:action_id ,:right_string])
  end
  def registration_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:module_id,:module_name, :action_id,:action_name, :right_string])
    |> join_fields
    |> validate_required([:module_name, :action_name, :right_string])
    |> unique_constraint(:right_string_repeated,
      name: :rights_right_string_index,
      message: "There is another Right with the same Module name and Action name ")
  end
  def  changeset_delete(struct, params \\ %{}) do
      struct
      |> cast(params, [:id])
      |> validate_required([:id])
      |> foreign_key_constraint(:id,
        name: :roles_rights_right_id_fkey,
        message: "This right is used with a role. Try to undo right and role relationship first")
  end
  def join_fields(struct) do
     mod_name=  get_field(struct, :module_name)
     act_name=  get_field(struct, :action_name)
     mod_act_name= Enum.join([mod_name, act_name], "_")
     put_change(struct, :right_string, mod_act_name)
  end

  def alphabetical(query) do
    from c in query, order_by: c.right_string
  end
  def names_and_ids(query) do
    from c in query, select: {c.right_string, c.id}
  end
  def by_ids(query,ids) when is_nil(ids) or byte_size(ids) == 0 do
    query
  end
  def by_ids(query,ids) do
    from right in query,
    where: right.id in ^ids
  end
end
