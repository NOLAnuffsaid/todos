defmodule TodoTest do
  use ExUnit.Case
  doctest Todo

  setup do
    :ok = Ecto.Adapters.SQL.Sandbox.checkout(MyApp.Repo)
  end

  test "greets the world" do
    assert Todo.hello() == :world
  end
end
