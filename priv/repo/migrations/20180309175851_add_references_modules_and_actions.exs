defmodule Mes_phoenix.Repo.Migrations.AddReferencesModulesAndActions do
  use Ecto.Migration

  def change do

    alter table(:rights) do
       add :module_id , references(:modules)
       add :action_id , references(:actions)
    end
  end
end
