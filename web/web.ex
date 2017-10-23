defmodule MesPhoenix.Web do
  @moduledoc """
  A module that keeps using definitions for controllers,
  views and so on.

  This can be used in your application as:

      use MesPhoenix.Web, :controller
      use MesPhoenix.Web, :view

  The definitions below will be executed for every view,
  controller, etc, so keep them short and clean, focused
  on imports, uses and aliases.

  Do NOT define functions inside the quoted expressions
  below.
  """

  def model do
    quote do
      # Define common model functionality
    end
  end

  def controller do
    quote do
      use Phoenix.Controller
      alias Mes_phoenix.Repo
      import MesPhoenix.Router.Helpers
      import MesPhoenix.Gettext
      import MesPhoenix.Auth , only: [authenticate_user: 2 , authorization_user: 2] # Authentication aliases

    end
  end

  def view do
    quote do
      use Phoenix.View, root: "web/templates"

      # Import convenience functions from controllers
      import Phoenix.Controller, only: [get_csrf_token: 0, get_flash: 2, view_module: 1]

      # Use all HTML functionality (forms, tags, etc)
      use Phoenix.HTML

      import MesPhoenix.Router.Helpers
      import MesPhoenix.ErrorHelpers
      import MesPhoenix.Gettext
    end
  end

  def router do
    quote do
      use Phoenix.Router
      import MesPhoenix.Auth , only: [authenticate_user: 2] # Authentication aliases

    end
  end

  def channel do
    quote do
      use Phoenix.Channel
      import MesPhoenix.Gettext
    end
  end

  @doc """
  When used, dispatch to the appropriate controller/view/etc.
  """
  defmacro __using__(which) when is_atom(which) do
    apply(__MODULE__, which, [])
  end
end
