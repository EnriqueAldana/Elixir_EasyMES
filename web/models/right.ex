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
  
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:module_name, :action_name, :right_string])
  end
  def registration_changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:module_name, :action_name, :right_string])
    |> join_fields
    |> validate_required([:module_name, :action_name, :right_string])
    |> unique_constraint(:right_string_repeated,
      name: :rights_right_string_index,
      message: "There is another Right with the same Module name and Action name ")

    #put_change(changeset,:right_string , :module_name <> "_" <> :action_name )
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
end
