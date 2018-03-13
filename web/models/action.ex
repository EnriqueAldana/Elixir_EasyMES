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
    |> action_name_downcase
    |> unique_constraint(:action_name,
     name: :actions_action_name_index,
     message: "There is an action with this name yet.")

  end

  def  changeset_delete(struct, params \\ %{}) do
      struct
      |> cast(params, [:id])
      |> validate_required([:id])
      |> foreign_key_constraint(:id,
        name: :rights_action_id_fkey,
        message: "This action is used with a right. Try to undo right and action relationship first")
  end

  defp action_name_downcase(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true,
                      changes: %{action_name: action_name}} ->
        put_change(changeset,
                   :action_name,
                   String.downcase(String.trim(action_name)))
      _ ->
        changeset
    end
  end
  def alphabetical(query) do
    from c in query, order_by: c.action_name
  end
  def names_and_ids(query) do
    from c in query, select: {c.action_name, c.id}
  end

  def by_ids(query,ids) when is_nil(ids) or byte_size(ids) == 0 do
    query
  end
  def by_ids(query,ids) do
    from action in query,
    where: action.id in ^ids
  end
end
