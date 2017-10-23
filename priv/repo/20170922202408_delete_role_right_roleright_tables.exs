defmodule Mes_phoenix.Repo.Migrations.DeleteRoleRightRolerightTables do
  use Ecto.Migration

  def up do
    drop table("roles")
    drop table("rights")
    drop table("role_rights")
  end
  def change do

  end
  def down do

  end
end
