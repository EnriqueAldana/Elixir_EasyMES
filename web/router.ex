defmodule MesPhoenix.Router do
  use MesPhoenix.Web, :router
  alias Mes_phoenix.Repo

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug MesPhoenix.Auth, repo: Repo

  end

  pipeline :api do
    plug :accepts, ["json"]
  end


    scope "/", MesPhoenix do
      pipe_through :browser
      get "/", PageController, :index
      get "/home", PageController, :home
      get "/no_right", PageController, :no_right
      get "/homes", HomeController, :index
      resources "/users", UserController, only: [:index,:show, :new, :create, :edit,:update]
      resources "/sessions", SessionController, only: [:new, :create, :delete,:home]
      resources "/roles", RoleController
      resources "/rights", RightController
      resources "/role_rights", Role_RightController
      resources "/actions", ActionController
      resources "/modules", ModuleController
     # This redirect controller should be here at finish scope
     get "/*path", RedirectController, :redirector_to_home

    end
    scope "/manage", MesPhoenix do
      pipe_through [:browser, :authenticate_user]

      #resources "/videos", VideoController
    end
  # Other scopes may use custom stacks.
  # scope "/api", MesPhoenix do
  #   pipe_through :api
  # end
end
