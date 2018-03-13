defmodule MesPhoenix.Mixfile do
  use Mix.Project

  def project do
    [app: :mes_phoenix,
     version: "0.1.0",
     elixir: "~> 1.5.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {MesPhoenix, []},
    # Ensure ecto_mnesia AND comeonin is started before your application:
    # JEAS
     applications: [:postgrex, :ecto_mnesia,:mariaex, :comeonin,:phoenix, :phoenix_pubsub, :phoenix_html, :cowboy, :logger, :gettext]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.2.3"},
     {:phoenix_pubsub, "~> 1.0.1"},
     {:phoenix_html, "~> 2.9.3"},
     {:phoenix_ecto, "~> 3.2.3"},
     {:phoenix_live_reload, "~> 1.0.8", only: :dev},
     {:gettext, "~> 0.13.1"},
     # ecto para manejar la persistenciala BD
     # JEAS
     {:ecto, "~> 2.1.4"},
     # dependencia de ecto 2.1.4
     {:db_connection, "~>1.1.2"},
     {:decimal, "~>1.3.1"},
     # Adapatador para MySql
     {:mariaex, "~> 0.8.0", override: true},
     {:postgrex, ">= 0.13.3"},
     # termina dep de ecto
     # la envoltura para manejar la BD Mnesia
     # {:amnesia, github: "meh/amnesia", tag: :master},
     # Adapatador para la BD Mnesia
     #JEAS
     {:ecto_mnesia, "~> 0.9.0"},
     # Encriptamiento de passsword
     {:comeonin, "~> 3.0.2"},
     # Authorization managment
     {:bodyguard, "~> 2.1.2"},
     {:cowboy, "~> 1.1.2"}]

  end
end
