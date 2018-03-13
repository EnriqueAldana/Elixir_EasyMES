defmodule Mes_phoenix.Repo.Migrations.AddUniqueIndexUserRoleAndRolesRight do
  use Ecto.Migration

# Mnesia does not  support unique index constraints.
  def change do
    create index(:users_roles , [:user_id] , comment: "Index to User Id")
    create index(:users_roles,  [:role_id], comment: "Index to Role Id")
    create_if_not_exists index(:roles_rights , [:role_id] , comment: "Index to Role Id")
    create_if_not_exists index(:roles_rights,  [:right_id], comment: "Index to Right Id")
    create_if_not_exists unique_index(:roles_rights,[:right_id, :role_id],name: :roles_rights_role_right_index, comment: "Complex Index to Role Id and Right Id")
    create_if_not_exists unique_index(:users_roles,[:user_id, :role_id],name: :users_roles_index,comment: "Complex Index to Role Id and User Id")

  end
end
