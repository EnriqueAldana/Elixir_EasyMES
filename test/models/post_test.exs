defmodule MesPhoenix.PostTest do
  use ExUnit.Case

  alias MesPhoenix.Post

  @valid_attrs %{body: "some content", word_count: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Post.changeset(%Post{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Post.changeset(%Post{}, @invalid_attrs)
    refute changeset.valid?
  end
end
