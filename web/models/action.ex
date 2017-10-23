defmodule MesPhoenix.Action do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  use MesPhoenix.Web, :model

  schema "actions" do
    field :action_name, :string
    field :action_description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:action_name, :action_description])
    |> validate_required([:action_name, :action_description])
    |> unique_constraint(:action_name,
     name: :actions_action_name_index,
     message: "There is an action with this name yet.")

  end

  def alphabetical(query) do
    from c in query, order_by: c.action_name
  end
  def names_and_ids(query) do
    from c in query, select: {c.action_name, c.action_name}
  end
end
