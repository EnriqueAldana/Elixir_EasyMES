defmodule MesPhoenix.Repo.Migrations.CreateAction do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:actions) do
      add :action_name, :string
      add :action_description, :text

      timestamps()
    end
    create unique_index(:actions,[:action_name])
    
  end
  def down do
    drop table(:actions)
  end
end
