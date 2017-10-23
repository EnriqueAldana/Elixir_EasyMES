defmodule MesPhoenix.Policy do
@behaviour Bodyguard.Policy
# Bodyguard callback
#def authorize(:update_post, user, post) do
  # Return :ok or true to permit
  # Return :error, {:error, reason}, or false to deny
#end
# Admin users can do anything
def authorize(_, %MesPhoenix.User{is_admin: is_admin}, _) do
  IO.puts("Entrando en authorize" )
  IO.puts(is_admin)
  if is_admin == true do
    :ok
  else
    {:error, :unauthorized}
  end
  #IO.puts(user.is_admin)

  #if %MesPhoenix.User.is_admin? do :true else :false

end
# Bodyguard callback
def authorize(action, %MesPhoenix.User{is_admin: is_admin}, _) when action in [:index, :show, :new,:update,:edit] do
    IO.puts("Entrando en authorize :index_user" )
    IO.puts(is_admin)
    if is_admin == 1 do
      true
    else
      false
    end
    # Return :ok or true to permit
    # Return :error, {:error, reason}, or false to deny
  end


  # Regular users can create posts
  #def authorize(:create_post, _, _), do: true

  # Regular users can modify their own posts
  #def authorize(action, %Blog.User{id: user_id}, %Blog.Post{user_id: user_id}})
  #  when action in [:update_post, :delete_post], do: true

# Catch-all: deny everything else
def authorize(_, _, _), do: false

end
