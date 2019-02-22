defmodule Todo.Queries do
  @moduledoc false

  import Ecto.Query, only: [from: 2, where: 3, select: 3]

  def get_all(%Todo.Struct{}) do
    query = from el in Todo.Struct, select: el

    Todo.Repo.all(query)
  end

  def get_todo(%Todo.Struct{}, id) do
    Todo.Repo.get(Todo.Struct, id)
  end

  def get_todos_by_date(%Todo.Struct{}, date) do
    query = from el in Todo.Struct, where: el.date == ^date, select: el
    Todo.Repo.all(query)
  end

end
