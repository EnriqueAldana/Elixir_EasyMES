defmodule MesPhoenix.User do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
#  import Comeonin.Bcrypt, only: [hashpwsalt: 1]

# alias MesPhoenix.Console
# we need tel to ECTO some definitions like
# this before the schema definitions
@primary_key {:id, :id, autogenerate: true}
@derive {Phoenix.Param, key: :id}
  schema "users" do
    # field :user_uuid, :binary_id
    # We need remove it becasue has been defined field :user_id , :integer
    field :user_name, :string
    field :first_name, :string
    field :last_name, :string
    field :is_admin, :boolean, default: false
    field :encrypted_password, :string
    field :email, :string
    field :confirmed, :boolean, default: true
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    field :created_at, :naive_datetime
    field :updated_at, :naive_datetime
    field :phone , :string
    field :mobil_phone , :string
    field :birth_day , :date
    field :home_phone , :string
    field :work_phone , :string
    field :personal_titule , :string
    field :job_title , :string
    field :employee_num , :string
    field :work_type , :string
    field :work_category , :string
    field :work_sub_category , :string
    field :work_vendor , :string
    field :department , :string
    field :sub_department , :string
    field :division , :string
    field :assistant , :string
    field :manager , :string
    field :cost_center , :string
    field :location , :string
    field :building , :string
    field :floor , :string
    field :seat_numbers , :string
    field :city , :string
    field :postal_code , :string
    field :state , :string
    field :country , :string
    field :region , :string
    #It does not need an MesPhoenix.UserRoles model.
    many_to_many :roles, MesPhoenix.Role, join_through: "users_roles", on_replace: :delete
  end
@required_fields ~w(user_name first_name last_name email password password_confirmation)
# Just the optional fields could be updated
@optional_fields ~w(is_admin)


def changeset(struct, params \\ %{}) do
   struct
    |> cast(params, @required_fields ++ @optional_fields)
    #|> unique_constraint(:user_name_and_email_repeated,
    #  name: :users_user_name_email_index,
    #  message: "There is another User with the same name and email")

end
def changeset_user_role_create(struct, role_list \\ %{}) do
  struct
    |> Ecto.Changeset.put_assoc(:roles, role_list)
end

def registration_changeset(user, params \\ :empty) do
user
    |> cast(params, @required_fields)
    |> validate_length(:password, min: 8, max: 12 )
    |> validate_password_confirmation()
    |> put_change(:is_admin , :false)
    #|> put_change(:user_uuid, Ecto.UUID.generate)
    |> hash_password
    |> unique_constraint(:email,
      name: :users_email_index,
      message: "There is another User with the same email. Try with other email")

  end

  defp validate_password_confirmation(changeset) do
    case get_change(changeset, :password_confirmation) do
      nil ->
        password_incorrect_error(changeset)
      confirmation ->
        password = get_field(changeset, :password)
        if confirmation == password, do: changeset, else: password_mismatch_error(changeset)
    end
  end

  defp password_mismatch_error(changeset) do
    add_error(changeset, :password_confirmation, "Passwords does not match")
  end

  defp password_incorrect_error(changeset) do
    add_error(changeset, :password, "is not valid")
  end

  defp hash_password(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true,
                      changes: %{password: password}} ->
        put_change(changeset,
                   :encrypted_password,
                   Comeonin.Bcrypt.hashpwsalt(password))
      _ ->
        changeset
    end
  end
  @doc """
  Get all roles assigned to the user id
  Example

        get_user_role_query(User,59)
  """
  defp get_user_role_query(query,id) do
    from u in query,
    join:  ur in assoc(u, :roles),
    where: u.id == ^id,
    select: %{user_id: u.id, user_name: u.user_name,role_id: ur.id}
  end


  def get_all_users(query) do
    from u in query,
    select: {u.id, u.user_name}
  end
  def get_user_by_id(query,id) do
    from u in query,
    where: u.id== ^id
  end

end
