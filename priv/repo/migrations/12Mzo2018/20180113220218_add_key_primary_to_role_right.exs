defmodule Mes_phoenix.Repo.Migrations.AddKeyPrimaryToRoleRight do
  use Ecto.Migration

  def change do
    alter table(:roles_rights) do
      modify :id, :integer,null: false, autogenerate: true,primary_key: true
    end

  end
end
