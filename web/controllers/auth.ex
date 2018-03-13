defmodule MesPhoenix.Auth do
import Plug.Conn
import Phoenix.Controller
alias MesPhoenix.Console
alias MesPhoenix.Uri
alias MesPhoenix.Utility
alias MesPhoenix.Role
alias Mes_phoenix.Repo
# This Console function is our located on utilities folder
#Console.write_line("The end of User create - Insert record on Users table!")

alias MesPhoenix.Router.Helpers

require Logger
# Logger.info  "Logging this text!"
# Logger.debug "Var value: #{inspect(var)}"
#Logger.debug "hello?"
#Logger.debug fn -> "expensive to calculate debug" end
#Supported levels are:
# :debug - for debug-related messages
#:info - for information of any kind
#:warn - for warnings
#:error - for errors


def authenticate_user(conn, _opts) do
  Console.write_line("Entrance into authenticate_user")
  Console.write_line(conn.path_info)

  if conn.assigns.current_user do
    conn
  else
    conn
    |> put_flash(:error, "You must be logged in to access that page")
    |> redirect(to: Helpers.page_path(conn, :index))
    |> halt()
  end
end

# Always plug functions receive the into first  parameter the conn value
# And into second parameter a set of the options
def authorization_user(conn, opts) do
  Console.write_line("Entrance in authorization_user")
  Logger.debug "opts value: #{inspect(opts)}"
  # conn.private is a Map
  ctl_name= conn.private[:phoenix_controller]
  Logger.debug "ctl_name value: #{inspect(ctl_name)}"

  #controller_name= String.slice(ctl_name, 1..-18)
  Logger.debug "ctl_name is #{ctl_name}"
  array_ctl_name = String.split(inspect(ctl_name), ".")
  Logger.debug "array_ctl_name #{array_ctl_name}"
  [_,controller_name_complete]= array_ctl_name
  controller_name = String.slice(controller_name_complete, 0..-11)
  action_name= conn.private[:phoenix_action]
  is_admin= conn.assigns.current_user.is_admin
  rights_string= get_session(conn, :rights_user)
  Logger.debug "rights_string value: #{inspect(rights_string)}"

    #conn.assigns.rights_user
  Logger.debug "Is the User admin ? #{is_admin}"
  Logger.debug "Controller name is #{controller_name}"
  Logger.debug "Action name is #{action_name}"
  controller_action_accessed = Enum.join([controller_name, action_name], "_")
  Logger.debug "Controller Action Accessed is #{controller_action_accessed}"
  url_path_source= conn |> get_req_header("referer")
    #"http://localhost:4000/users"
    #conn |> get_req_header("referer")
  Logger.debug "url_path_source value: #{inspect(url_path_source)}"
  {:ok,path}= Uri.get_path(url_path_source)
  url_path_target= conn.path_info
  Logger.debug "Try to go at : #{url_path_target}"
  Logger.debug "back_url value: #{inspect(path)}"
  #Console.write_line(Enum.join(["url origen " , path],""))
  #Console.write_line(Enum.join(["url path info " , url_path_target],""))

  if (String.contains?(rights_string, controller_action_accessed) || is_admin) do
    Logger.debug "Your rights to access is enough"
    conn
  else
    #To get the URL including the host you can use
    #MyApp.Router.Helpers.url(conn) <> conn.request_path
    # which would return a result like "http://localhost:4000/users/1".
    Logger.debug "Your rights do not enough to access "
    conn
    |> put_session(:url_path_source, path)
    |> put_flash(:error, "Your rights do not enough to access that part of the page")
    |> redirect(to: Helpers.page_path(conn, :no_right))
    |> halt()

  end
end



  def init(opts) do
    # Shoot exception if :repo variable is absent when the plug is started
    Keyword.fetch!(opts, :repo)
  end

# The call function receive second parameter from init function
  def call(conn, repo) do
    #Improving this ask to DB is not necesary
    # The current_user should be store on session encrypted when user is logged

    IO.puts("Entrance into call from auth.ex")
    user_id = get_session(conn, :user_id)
    IO.puts(Enum.join(["Getting user from session ", user_id],""))
    user    = user_id && repo.get(MesPhoenix.User, user_id)
    # We are storing the user object on :current_user atom on session
    # that is conn.assign.current_user
    # and it is available on all views
    conn
    |> assign(:current_user, user)

  end
  defp load_user_rights(id) do
    query =
    Role
    |> Role.get_rights_by_user(id)
    Repo.all query

  end
  def login(conn, user) do
    Logger.debug "Entrance into login. Put User Id on session and current_user on assign"
    rights_user = load_user_rights(user.id)
    rights_string = Utility.list_to_string_separated_by_space(rights_user,"")
      #{}"UserController_ UserController_index UserController_update UserController_new"
    Logger.debug "rights_user value #{rights_string}"
    conn
    |> configure_session(renew: true)
    |> put_session(:rights_user, rights_string)
    |> assign(:current_user, user)
    |> put_session(:user_id, user.id)

  end

  def logout(conn) do
    Logger.debug "Entrance into logout. Drop session"
    #user_id = get_session(conn, :user_id)
    # si queremos mantener la sesion deberiamos borrar solo el usuario
    #delete_session(conn,user_id)
    configure_session(conn, drop: true)


  end

  import Comeonin.Bcrypt, only: [checkpw: 2, dummy_checkpw: 0]

  def login_by_username_and_pass(conn, email, given_pass, opts) do
    repo = Keyword.fetch!(opts, :repo)
    user = repo.get_by(MesPhoenix.User, email: email)

    cond do
      user && checkpw(given_pass, user.encrypted_password) ->
        {:ok, login(conn, user)}
      user ->
        {:error, :unauthorized, conn}
      true ->
        dummy_checkpw()
        {:error, :not_found, conn}
    end
  end

end
