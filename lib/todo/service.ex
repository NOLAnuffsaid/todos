defmodule Todo.Service do
  @moduledoc false

  use GenServer

  require Logger

  def start_link(_state, _opts \\ []) do
    IO.puts "starting todo service"
    GenServer.start_link(__MODULE__, nil, name: :todo_service)
  end

  def init(_state) do
    {:ok, []}
  end

  def handle_call({:get_todos, date}, _from, state) do
    {:reply, {:ok, state, state}}
  end

  def handle_call({:get_all_todos}, _from, state) do
    todos = Todo.Queries.get_all(%Todo.Struct{})
    {:reply, todos, todos}
  end

  def handle_cast({:add_todo, {date, description}}, state) do
    with {:ok, todo} <- Todo.Struct.create(%{date: date, description: description}),
         {:ok, _} <- Todo.Repo.insert(todo) do
    else
      {:error, _} -> Logger.error("Database insert failed.")

      {err, _} -> Logger.error(err)
    end

    {:noreply, state}
  end

  def handle_cast({:complete_todo, _}, state) do
#    {:noreply, Map.update(state, date, [todo_msg], fn todo_msgs -> todo_msgs ++ todo_msg end)}
    {:noreply, state}
  end

  def handle_cast({:update_todo_date, _, _}, state) do
#    {:noreply, Map.update(state, date, [todo_msg], fn todo_msgs -> todo_msgs ++ todo_msg end)}
    {:noreply, state}
  end
end