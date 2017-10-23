# priv/repo/seeds.exs
alias Mes_phoenix.Repo
alias MesPhoenix.User
admin_params = %{ user_name: "Admin",
                  first_name: "Administrator",
                  last_name: "Administrator",
                  email: "admin@admin.com",
                  password: "Admin678",
                  password_confirmation: "Admin678",
                  is_admin: true}
unless Repo.get_by(User, email: admin_params[:email]) do
  %User{}
  |> User.registration_changeset(admin_params)
  |> Repo.insert!
end

# mix run priv/repo/seeds_add_admin.exs
# Test get a new User
# User |> Repo.get_by(email: "admin@test.com")
# running on iex console
# alias Mes_phoenix.Repo
#alias MesPhoenix.User
admin_params = %{ user_name: "Admin2",
                  first_name: "Administrator",
                  last_name: "Administrator",
                  email: "admin@admin.net",
                  password: "Admin678",
                  password_confirmation: "Admin678",
                  is_admin: :true}
# %User{} |> User.registration_changeset(admin_params) |> Repo.insert!
