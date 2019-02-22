# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
use Mix.Config


# Db Config
import_config "#{Mix.env}_db.exs"

config :todo,
       ecto_repos: [Todo.Repo]
