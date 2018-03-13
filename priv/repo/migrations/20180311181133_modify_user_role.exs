defmodule Mes_phoenix.Repo.Migrations.ModifyUserRole do
  use Ecto.Migration

  def change do

    create_if_not_exists table(:users_roles, primary_key: false) do
      add :user_id , references(:users)
      add :role_id , references(:roles)
      end
      #create_if_not_exists unique_index(:users_roles,[:user_id,:role_id],name: :users_roles_index,comment: "Complex Index to Role Id and User Id")

  end
end
