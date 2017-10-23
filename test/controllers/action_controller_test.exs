defmodule MesPhoenix.ActionControllerTest do
  use MesPhoenix.ConnCase

  alias MesPhoenix.Action
  @valid_attrs %{action_description: "some content", action_name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, action_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing actions"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, action_path(conn, :new)
    assert html_response(conn, 200) =~ "New action"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, action_path(conn, :create), action: @valid_attrs
    assert redirected_to(conn) == action_path(conn, :index)
    assert Repo.get_by(Action, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, action_path(conn, :create), action: @invalid_attrs
    assert html_response(conn, 200) =~ "New action"
  end

  test "shows chosen resource", %{conn: conn} do
    action = Repo.insert! %Action{}
    conn = get conn, action_path(conn, :show, action)
    assert html_response(conn, 200) =~ "Show action"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, action_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    action = Repo.insert! %Action{}
    conn = get conn, action_path(conn, :edit, action)
    assert html_response(conn, 200) =~ "Edit action"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    action = Repo.insert! %Action{}
    conn = put conn, action_path(conn, :update, action), action: @valid_attrs
    assert redirected_to(conn) == action_path(conn, :show, action)
    assert Repo.get_by(Action, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    action = Repo.insert! %Action{}
    conn = put conn, action_path(conn, :update, action), action: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit action"
  end

  test "deletes chosen resource", %{conn: conn} do
    action = Repo.insert! %Action{}
    conn = delete conn, action_path(conn, :delete, action)
    assert redirected_to(conn) == action_path(conn, :index)
    refute Repo.get(Action, action.id)
  end
end
