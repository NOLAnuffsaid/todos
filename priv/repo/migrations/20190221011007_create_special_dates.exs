defmodule Todo.Repo.Migrations.CreateSpecialDates do
  use Ecto.Migration

  def change do
    create table(:special_dates, primary_key: true) do
      add :title, :string
    end
  end
end
