defmodule Mes_phoenix.Repo.Migrations.AddAutoincrementToRoleRight do
  use Ecto.Migration

  def change do

    alter table(:roles_rights) do
      modify :id, :integer,null: false, autogenerate: true
    end
  end
end
