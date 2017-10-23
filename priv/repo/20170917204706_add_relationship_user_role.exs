defmodule Mes_phoenix.Repo.Migrations.AddRelationshipUserRole do
  use Ecto.Migration

  def change do
     create table(:users_roles, primary_key: false) do
      add :user_uuid, :uuid , references(:users, on_delete: :delete_all)
      add :role_id, references(:roles, on_delete: :delete_all)
      timestamps()
    end
  end
end
