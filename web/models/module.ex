defmodule MesPhoenix.Module do
  use MesPhoenix.Web, :model
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query

  schema "modules" do
    field :module_name, :string
    field :module_description, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:module_name, :module_description])
    |> validate_required([:module_name, :module_description])
    |> module_name_capitalize
    |> unique_constraint(:module_name,
      name: :modules_module_name_index,
      message: "There is another Module with the same Module name. Try with other Module name")

  end

  def  changeset_delete(struct, params \\ %{}) do
      struct
      |> cast(params, [:id])
      |> validate_required([:id])
      |> foreign_key_constraint(:id,
        name: :rights_module_id_fkey,
        message: "This module is used with a right. Try to undo right and module relationship first")
  end
  defp module_name_capitalize(changeset) do
      case changeset do
        # It is a new changeset with another values to return 
      %Ecto.Changeset{valid?: true,
                      changes: %{module_name: module_name}} ->
        put_change(changeset,
                   :module_name,
                   String.capitalize(String.trim(module_name)))
      _ ->
        changeset
    end
  end

  def alphabetical(query) do
    from c in query, order_by: c.module_name
  end
  def names_and_ids(query) do
    from c in query, select: {c.module_name, c.id}
  end
  def by_ids(query,ids) when is_nil(ids) or byte_size(ids) == 0 do
    query
  end
  def by_ids(query,ids) do
    from module in query,
    where: module.id in ^ids
  end
end
