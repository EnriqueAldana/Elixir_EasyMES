# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config


# Configures the endpoint
config :mes_phoenix, MesPhoenix.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "tSVlHXMS42/ycOtOZqF9rJpuqKJ+/UHS4a/AB7q1/7rVm3sgVIO04ezHQc6cWvWv",
  render_errors: [view: MesPhoenix.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MesPhoenix.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


# In your config/config.exs file
# https://elixirschool.com/lessons/specifics/ecto/
# https://github.com/Nebo15/ecto_mnesia
# https://hexdocs.pm/ecto_mnesia/readme.html
# ECTO - Mnesia Configurations
# JEAS
config :ecto_mnesia,
  host: {:system, :atom, "MNESIA_HOST", Kernel.node()},
  storage_type: {:system, :atom, "MNESIA_STORAGE_TYPE", :disc_copies}
# Optionally set custom Mnesia data dir (don't forget to create it):
# JEAS
config :mnesia,
  dir: 'priv/data/mnesia' # Make sure this directory exists

# ECTO Configuration Database
# Use EctoMnesia.Adapter as your Ecto.Repo adapter:
# JEAS
# config :mes_phoenix, Mes_phoenix.Repo,
#  adapter: EctoMnesia.Adapter,
#  database: "mes_phoenix_DB",
#  hostname: "localhost"

# Postgres Configuration
  config :mes_phoenix, Mes_phoenix.Repo,
    adapter:     Ecto.Adapters.Postgres,
    username:    "postgres",
    password:    "postgres",
    database:    "easy_mes_phoenix_DB_dev",
    hostname:   "localhost",
    port: 5432,
    pool_size:   10

#config :mes_phoenix, Mes_phoenixMySQL.Repo,
#adapter: Ecto.Adapters.MySQL,
#username: "root",
#password: "Carolina1937",
#database: "mes_phoenix_DB_dev"
# This tells our application about the repo,
# which will allow us to run commands such as
# mix ecto.create very soon.

config :mes_phoenix, ecto_repos: [Mes_phoenix.Repo]

#config :mes_phoenix, ecto_repos: [Mes_phoenixMySQL.Repo]

#config :mes_phoenix, Mes_phoenixMySQL.Repo, migration_source: "my_migrations_version_table"
