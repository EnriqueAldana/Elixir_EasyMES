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
    |> unique_constraint(:module_name,
      name: :modules_module_name_index,
      message: "There is another Module with the same Module name. Try with other Module name")

  end

  def alphabetical(query) do
    from c in query, order_by: c.module_name
  end
  def names_and_ids(query) do
    from c in query, select: {c.module_name, c.module_name}
  end
end
