defmodule Mes_phoenixMySQL.Repo.Migrations.InicialMySQL do
  use Ecto.Migration

# Documentation
# https://hexdocs.pm/ecto/Ecto.Migration.html
  # where up/0 is used to update your database
  def up do
# Examples
# create index(:posts, [:name], comment: "Index Comment")
# create constraint(:products, "price_must_be_positive", check: "price > 0", comment: "Index Comment")
# create table(:weather, prefix: "north_america", comment: "Table Comment") do
#    add :city, :string, size: 40, comment: "Column Comment"
#    timestamps()
# end
  create_if_not_exists table(:users ) do
  #,  primary_key: false, comment: "Table of Users") do # It into Postgres does not built autoincrement
    # By default, a schema will automatically
    # generate a primary key which is named id
    # and of type :integer.
    #  add :user_id, :integer, primary_key: true, autogenerate: true # It into Postgres does not built autoincrement
      add :user_name, :string , size: 25 , comment: "User name "
      add :first_name, :string , size: 25
      add :last_name, :string , size: 25
      add :email, :string, size: 250 ,null: false
      add :is_admin, :boolean, default: false, null: false
      add :encrypted_password, :string , size: 250
      add :confirmed, :boolean, default: false
      add :cell_phone, :string , size: 25 , comment: "User cell phone"
      add :phone , :string , size: 25 , comment: "User cell phone"
      add :mobil_phone , :string , size: 25 , comment: "User mobil cell phone"
      add :street_fieldress , :string
      add :birth_day , :date , comment: "User birth day"
      add :home_phone , :string , size: 25 , comment: "User Home phone"
      add :work_phone , :string , size: 25 , comment: "User Work phone"
      add :personal_titule , :string , size: 10 , comment: "User Personal title"
      add :job_title , :string , size: 25 , comment: "User Job title"
      add :employee_num , :string , size: 25 , comment: "User employee number"
      add :work_type , :string , size: 25 , comment: "User Work type"
      add :work_category , :string , size: 25 , comment: "User Category"
      add :work_sub_category , :string , size: 25 , comment: "User Sub Category"
      add :work_vendor , :string , size: 25 , comment: "User Vendor"
      add :department , :string , size: 25 , comment: "User Department"
      add :sub_department , :string , size: 25 , comment: "User Sub department"
      add :division , :string , size: 25 , comment: "User Division"
      add :assistant , :string , size: 25 , comment: "User assistant"
      add :manager , :string , size: 25 , comment: "User Manager"
      add :cost_center , :string , size: 25 , comment: "User Cost Center"
      add :location , :string , size: 25 , comment: "User Location"
      add :building , :string , size: 25 , comment: "User Building"
      add :floor , :string , size: 25 , comment: "User Floor"
      add :seat_numbers , :string , size: 25 , comment: "Seat number"
      add :street_address , :string , size: 25 , comment: "User street address"
      add :city , :string , size: 25 , comment: "User City"
      add :postal_code , :string , size: 25 , comment: "User post code"
      add :state , :string , size: 25 , comment: "User State"
      add :country , :string , size: 25 , comment: "User Country"
      add :region , :string , size: 25 , comment: "User Region"
      add :created_at, :naive_datetime, default: fragment("now()") , comment: "This field is updated automaticaly "
      add :updated_at, :naive_datetime
    end
    create_if_not_exists unique_index(:users, [:email])
  end
  # where down/0 rolls back the prompted changes.
  # mix ecto.rollback
  def down do
    drop table(:users)
  end
end
