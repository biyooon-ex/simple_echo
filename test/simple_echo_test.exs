defmodule SimpleEchoTest do
  use ExUnit.Case
  doctest SimpleEcho

  test "greets the world" do
    assert SimpleEcho.hello() == :world
  end
end
