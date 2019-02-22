defmodule Todo.Repo.Migrations.CreateTodos do
  use Ecto.Migration

  def change do
    create table(:todos, primary_key: true) do
      add :date, :date
      add :description, :string
      add :is_completed, :boolean
      add :special_date_id, :id
    end
  end
end
