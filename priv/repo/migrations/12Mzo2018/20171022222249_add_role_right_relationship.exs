defmodule Mes_phoenix.Repo.Migrations.AddRoleRightRelationship do
  use Ecto.Migration

  def change do
    create_if_not_exists table(:roles_rights, primary_key: false) do
      add :id_role,references(:roles)
      add :id_right, references(:rights)

      timestamps()
    end
    
    create_if_not_exists index(:roles_rights , [:id_role] , comment: "Index to Role Id")
    create_if_not_exists index(:roles_rights,  [:id_right], comment: "Index to Right Id")
    create_if_not_exists unique_index(:roles_rights, [:id_role,:id_right], name: :roles_rights_role_right_index, comment: "Complex Index to Role Id and Right Id")
    end

    def down do
    drop table("roles_rights")
    end
end
