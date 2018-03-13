defmodule MesPhoenix.Router do
  use MesPhoenix.Web, :router
  alias Mes_phoenix.Repo


  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :auth do
    plug MesPhoenix.Auth, repo: Repo
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # public routes via the browser
  scope alias: MesPhoenix do
      pipe_through :browser


      # ...
  end

  # private routes via the browser
  scope alias: MesPhoenix do
      pipe_through [:browser, :auth]

      get "/", PageController, :index
      get "/home", PageController, :home
      get "/no_right", PageController, :no_right
      get "/homes", HomeController, :index
      resources "/users", UserController, only: [:index,:show, :new, :create, :edit,:update]
      resources "/sessions", SessionController, only: [:new, :create, :delete,:home]
      resources "/roles", RoleController
      resources "/user_roles", User_RoleController
      resources "/rights", RightController
      resources "/role_rights", Role_RightController
      resources "/actions", ActionController
      resources "/modules", ModuleController
     # This redirect controller should be here at finish scope
      get "/*path", RedirectController, :redirector_to_home
  end

# Public routes via the api
scope "api/v1" , alias: MesPhoenix do
    pipe_through :api

    # ...
end

# Private routes via the api
scope "api/v1" , alias: MesPhoenix do
    pipe_through [:api, :auth]

    # ...
end

end
