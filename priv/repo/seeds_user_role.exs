alias Mes_phoenix.Repo
alias MesPhoenix.User
alias MesPhoenix.Role
alias Ecto.Changeset

user = Repo.get_by(User, user_name: "Admin")
IO.inspect user
role = Repo.get_by(Role, key_role: "Admin")
IO.inspect role
role1 = Repo.get_by(Role, key_role: "View")
IO.inspect role1
role_params = %{ key_role: "Admin_Role",
                    description: "Administrator"}

  changeset = Role.changeset(%Role{}, role_params)
  Repo.insert(changeset)
