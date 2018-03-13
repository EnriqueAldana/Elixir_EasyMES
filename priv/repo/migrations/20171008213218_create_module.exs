defmodule MesPhoenix.Repo.Migrations.CreateModule do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:modules) do
      add :module_name, :string
      add :module_description, :text

      timestamps()
    end
    create_if_not_exists unique_index(:modules,[:module_name])

  end
  def down do
    drop table("modules")
  end
end
