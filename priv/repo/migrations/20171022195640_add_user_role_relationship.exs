defmodule Mes_phoenix.Repo.Migrations.AddUserRoleRelationship do
  use Ecto.Migration

def change do
  create_if_not_exists table(:users_roles, primary_key: false) do
    add :id_user,references(:users)
    add :id_role, references(:roles)

    timestamps()
  end
  create index(:users_roles , [:id_user] , comment: "Index to User Id")
  create index(:users_roles,  [:id_role], comment: "Index to Role Id")
  create unique_index(:users_roles,[:id_user,:id_role],name: :users_roles_user_role_index,comment: "Complex Index to User Id and Role Id")
  end

  def down do
  drop table("users_roles")
  end
end
