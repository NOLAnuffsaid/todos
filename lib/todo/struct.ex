defmodule Todo.Struct do
  use Ecto.Schema

  schema "todos" do
    field :date, :date
    field :description, :string
    field :is_completed, :boolean, default: false
  end

  def create(%{date: _, description: _} = params) do
    %Todo.Struct{}
    |> Ecto.Changeset.cast(params, [:date, :description, :is_completed])
    |> Ecto.Changeset.validate_required([:date, :description])
  end
end
