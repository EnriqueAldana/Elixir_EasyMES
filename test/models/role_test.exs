defmodule MesPhoenix.RoleTest do
  use ExUnit.Case

  alias MesPhoenix.Role

  @valid_attrs %{description: "some content", key_role: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Role.changeset(%Role{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Role.changeset(%Role{}, @invalid_attrs)
    refute changeset.valid?
  end
end
