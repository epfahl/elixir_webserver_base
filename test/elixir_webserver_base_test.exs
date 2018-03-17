defmodule ElixirWebserverBaseTest do
  use ExUnit.Case
  doctest ElixirWebserverBase

  test "greets the world" do
    assert ElixirWebserverBase.hello() == :world
  end
end
