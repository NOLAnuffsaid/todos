defmodule Todo.ServiceCalls do
  @moduledoc false

  def get_todos(date) do
    GenServer.call(:todo_service, {:get_todos, date})
  end

  def get_all_todos do
    GenServer.call(:todo_service, {:get_all_todos})
  end

  def add_todo(todo) do
    GenServer.cast(:todo_service, {:add_todo, todo})
  end

  def complete_todo(todo) do
    GenServer.cast(:todo_service, {:complete_todo, todo})
  end

  def reschedule_todo(todo, date) do
    GenServer.cast(:todo_service, {:update_todo_date, todo, date})
  end
end
