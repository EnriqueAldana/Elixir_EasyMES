defmodule MesPhoenix.Repo.Migrations.CreateRight do
  use Ecto.Migration

  def change do
  create_if_not_exists table(:rights) do
      add :module_name, :string
      add :action_name, :string
      add :right_string, :string

      timestamps()
    end
create unique_index(:rights,[:right_string])
  end

  def down do
    drop table("rights")
  end
end
