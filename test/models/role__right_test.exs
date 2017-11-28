defmodule MesPhoenix.Role_RightTest do
  use ExUnit.Case

  alias MesPhoenix.Role_Right

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Role_Right.changeset(%Role_Right{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Role_Right.changeset(%Role_Right{}, @invalid_attrs)
    refute changeset.valid?
  end
end
