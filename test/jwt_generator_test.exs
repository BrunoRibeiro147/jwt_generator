defmodule JwtGeneratorTest do
  use ExUnit.Case
  doctest JwtGenerator

  test "greets the world" do
    assert JwtGenerator.hello() == :world
  end
end
