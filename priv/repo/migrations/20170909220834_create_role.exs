defmodule MesPhoenix.Repo.Migrations.CreateRole do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:roles) do
      add :key_role, :string
      add :description, :text

      timestamps()
    end
    create unique_index(:roles,[:key_role])
  end

  def down do
    drop table("roles")
  end
end
