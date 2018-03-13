defmodule Mes_phoenix.Repo.Migrations.ModifyInsertedUpdatedAddTo do
  use Ecto.Migration

  def change do
    alter table(:actions) do
      modify :inserted_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      modify :updated_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      end
    alter table(:modules) do
      modify :updated_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      modify :inserted_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
    end
    alter table(:rights) do
      modify :updated_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      modify :inserted_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
    end
    alter table(:roles) do
      modify :updated_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      modify :inserted_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
    end
    alter table(:users) do
      modify :created_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      modify :updated_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
    end

    alter table(:users_roles) do
      modify :updated_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      modify :inserted_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
    end
    
end
end
