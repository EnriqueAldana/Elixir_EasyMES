defmodule MesPhoenix.ActionTest do
  use MesPhoenix.ModelCase

  alias MesPhoenix.Action

  @valid_attrs %{action_description: "some content", action_name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Action.changeset(%Action{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Action.changeset(%Action{}, @invalid_attrs)
    refute changeset.valid?
  end
end
