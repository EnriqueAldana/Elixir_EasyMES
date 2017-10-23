alias Mes_phoenix.Repo
alias MesPhoenix.User
alias MesPhoenix.Role
alias Ecto.Changeset
alias MesPhoenix.User_Role
user = Repo.get_by(User, user_name: "Admin")
IO.inspect user
role = Repo.get_by(Role, key_role: "Admin")
IO.inspect role
role1 = Repo.get_by(Role, key_role: "View")
IO.inspect role1
# user_role= Repo.all(User_Role)
 changeset = user
  |> Repo.preload(:roles)
  |> Ecto.Changeset.change
  |> Ecto.Changeset.put_assoc(:roles, [role,role1])

  user = Repo.update!(changeset)
  IO.inspect user
# user_role= Repo.all(User_Role)
  # Inserting
  #changeset =
  #  user
  #  |> Ecto.Changeset.change
  #  |> Ecto.Changeset.put_assoc(:categories, [c1, c2])
  #post = Repo.insert!(changeset)
  #IO.inspect post

# No funciono
# user
#  |> Repo.preload(:roles)
#  |> User.changeset(%{})
#  |> Changeset.put_assoc(:roles, [role])
#  |> Repo.update!

# running with mix run priv/repo/seeds_user_role.exs
