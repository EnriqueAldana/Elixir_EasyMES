defmodule Mes_phoenix.Repo.Migrations.ModifyRolesRightsTableChangeIdNames do
  use Ecto.Migration

  def change do

    create_if_not_exists table(:roles_rights, primary_key: false) do
      add :right_id , references(:rights)
      add :role_id , references(:roles)
      add :updated_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      add :inserted_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      end
      create unique_index(:roles_rights,[:right_id,:role_id],name: :roles_rights_role_right_index,comment: "Complex Index to Role Id and Right Id")

  end
end
