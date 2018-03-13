defmodule Mes_phoenix.Repo.Migrations.AddFieldsToRoleRight do
  use Ecto.Migration

  def change do

    alter table(:roles_rights) do
      add :id, :integer,null: false

    end
  end
end
