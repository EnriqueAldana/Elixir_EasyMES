defmodule MesPhoenix.RightControllerTest do
  use MesPhoenix.ConnCase

  alias MesPhoenix.Right
  @valid_attrs %{action_name: "some content", module_name: "some content", right_string: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, right_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing rights"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, right_path(conn, :new)
    assert html_response(conn, 200) =~ "New right"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, right_path(conn, :create), right: @valid_attrs
    assert redirected_to(conn) == right_path(conn, :index)
    assert Repo.get_by(Right, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, right_path(conn, :create), right: @invalid_attrs
    assert html_response(conn, 200) =~ "New right"
  end

  test "shows chosen resource", %{conn: conn} do
    right = Repo.insert! %Right{}
    conn = get conn, right_path(conn, :show, right)
    assert html_response(conn, 200) =~ "Show right"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, right_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    right = Repo.insert! %Right{}
    conn = get conn, right_path(conn, :edit, right)
    assert html_response(conn, 200) =~ "Edit right"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    right = Repo.insert! %Right{}
    conn = put conn, right_path(conn, :update, right), right: @valid_attrs
    assert redirected_to(conn) == right_path(conn, :show, right)
    assert Repo.get_by(Right, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    right = Repo.insert! %Right{}
    conn = put conn, right_path(conn, :update, right), right: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit right"
  end

  test "deletes chosen resource", %{conn: conn} do
    right = Repo.insert! %Right{}
    conn = delete conn, right_path(conn, :delete, right)
    assert redirected_to(conn) == right_path(conn, :index)
    refute Repo.get(Right, right.id)
  end
end
