defmodule Todo.Repo do
  use Ecto.Repo,
      otp_app: :todo,
      name: :todo_repo,
      adapter: Ecto.Adapters.Postgres
end
