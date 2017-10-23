defmodule MesPhoenix.Repo.Migrations.CreateRole_Right do
  use Ecto.Migration

  def change do
    create table(:role_rights) do
      add :role_id, references(:roles, on_delete: :delete)
      add :right_id, references(:rights, on_delete: :delete)

      timestamps()
    end
    create index(:role_rights_role_id, [:role_id])
    create index(:role_rights_right_id, [:right_id])

  end
end
