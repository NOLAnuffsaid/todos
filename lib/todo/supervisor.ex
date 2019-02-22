defmodule Todo.Supervisor do
  @moduledoc false

  @children [Todo.Service, Todo.Repo]

  @impl true
  def start_link do
    IO.puts "starting supervisor"
    Supervisor.start_link(@children, [name: :super, strategy: :one_for_all])
  end

  @impl true
  def terminate(:normal, _state) do
    IO.puts "stopping super..."
    Process.alive?(:todo_repo)
  end
end