defmodule MesPhoenix.RightTest do
  use ExUnit.Case

  alias MesPhoenix.Right

  @valid_attrs %{action_name: "some content", module_name: "some content", right_string: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Right.changeset(%Right{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Right.changeset(%Right{}, @invalid_attrs)
    refute changeset.valid?
  end
end
