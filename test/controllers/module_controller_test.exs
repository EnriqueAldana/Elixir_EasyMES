defmodule MesPhoenix.ModuleControllerTest do
  use MesPhoenix.ConnCase

  alias MesPhoenix.Module
  @valid_attrs %{module_description: "some content", module_name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, module_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing modules"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, module_path(conn, :new)
    assert html_response(conn, 200) =~ "New module"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, module_path(conn, :create), module: @valid_attrs
    assert redirected_to(conn) == module_path(conn, :index)
    assert Repo.get_by(Module, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, module_path(conn, :create), module: @invalid_attrs
    assert html_response(conn, 200) =~ "New module"
  end

  test "shows chosen resource", %{conn: conn} do
    module = Repo.insert! %Module{}
    conn = get conn, module_path(conn, :show, module)
    assert html_response(conn, 200) =~ "Show module"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, module_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    module = Repo.insert! %Module{}
    conn = get conn, module_path(conn, :edit, module)
    assert html_response(conn, 200) =~ "Edit module"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    module = Repo.insert! %Module{}
    conn = put conn, module_path(conn, :update, module), module: @valid_attrs
    assert redirected_to(conn) == module_path(conn, :show, module)
    assert Repo.get_by(Module, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    module = Repo.insert! %Module{}
    conn = put conn, module_path(conn, :update, module), module: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit module"
  end

  test "deletes chosen resource", %{conn: conn} do
    module = Repo.insert! %Module{}
    conn = delete conn, module_path(conn, :delete, module)
    assert redirected_to(conn) == module_path(conn, :index)
    refute Repo.get(Module, module.id)
  end
end
