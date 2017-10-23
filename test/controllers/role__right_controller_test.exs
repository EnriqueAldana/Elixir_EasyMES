defmodule MesPhoenix.Role_RightControllerTest do
  use MesPhoenix.ConnCase

  alias MesPhoenix.Role_Right
  @valid_attrs %{}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, role__right_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing role rights"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, role__right_path(conn, :new)
    assert html_response(conn, 200) =~ "New role  right"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, role__right_path(conn, :create), role__right: @valid_attrs
    assert redirected_to(conn) == role__right_path(conn, :index)
    assert Repo.get_by(Role_Right, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, role__right_path(conn, :create), role__right: @invalid_attrs
    assert html_response(conn, 200) =~ "New role  right"
  end

  test "shows chosen resource", %{conn: conn} do
    role__right = Repo.insert! %Role_Right{}
    conn = get conn, role__right_path(conn, :show, role__right)
    assert html_response(conn, 200) =~ "Show role  right"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, role__right_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    role__right = Repo.insert! %Role_Right{}
    conn = get conn, role__right_path(conn, :edit, role__right)
    assert html_response(conn, 200) =~ "Edit role  right"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    role__right = Repo.insert! %Role_Right{}
    conn = put conn, role__right_path(conn, :update, role__right), role__right: @valid_attrs
    assert redirected_to(conn) == role__right_path(conn, :show, role__right)
    assert Repo.get_by(Role_Right, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    role__right = Repo.insert! %Role_Right{}
    conn = put conn, role__right_path(conn, :update, role__right), role__right: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit role  right"
  end

  test "deletes chosen resource", %{conn: conn} do
    role__right = Repo.insert! %Role_Right{}
    conn = delete conn, role__right_path(conn, :delete, role__right)
    assert redirected_to(conn) == role__right_path(conn, :index)
    refute Repo.get(Role_Right, role__right.id)
  end
end
