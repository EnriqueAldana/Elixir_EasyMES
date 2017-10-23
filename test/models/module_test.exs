defmodule MesPhoenix.ModuleTest do
  use MesPhoenix.ModelCase

  alias MesPhoenix.Module

  @valid_attrs %{module_description: "some content", module_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Module.changeset(%Module{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Module.changeset(%Module{}, @invalid_attrs)
    refute changeset.valid?
  end
end
