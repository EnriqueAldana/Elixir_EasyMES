defmodule MesPhoenix.ModuleController do
  use MesPhoenix.Web, :controller

  alias MesPhoenix.Module
  plug :authenticate_user when action in [:index, :new,:create,:show,:edit,:update, :delete]
  plug :authorization_user when action in [:index, :new,:create,:show,:edit,:update, :delete]

  def index(conn, _params) do
    modules = Repo.all(Module)
    render(conn, "index.html", modules: modules)
  end

  def new(conn, _params) do
    changeset = Module.changeset(%Module{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"module" => module_params}) do
    changeset = Module.changeset(%Module{}, module_params)

    case Repo.insert(changeset) do
      {:ok, _module} ->
        conn
        |> put_flash(:info, "Module created successfully.")
        |> redirect(to: module_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    module = Repo.get!(Module, id)
    render(conn, "show.html", module: module)
  end

  def edit(conn, %{"id" => id}) do
    module = Repo.get!(Module, id)
    changeset = Module.changeset(module)
    render(conn, "edit.html", module: module, changeset: changeset)
  end

  def update(conn, %{"id" => id, "module" => module_params}) do
    module = Repo.get!(Module, id)
    changeset = Module.changeset(module, module_params)

    case Repo.update(changeset) do
      {:ok, module} ->
        conn
        |> put_flash(:info, "Module updated successfully.")
        |> redirect(to: module_path(conn, :show, module))
      {:error, changeset} ->
        render(conn, "edit.html", module: module, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    module = Repo.get!(Module, id)
    changeset = Module.changeset_delete(module)
    case Repo.delete(changeset) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Module deleted successfully.")
        |> redirect(to: module_path(conn, :index))
      {:error, _} ->
        conn
        |> put_flash(:error, "Module has not been deleted. The module with key named as #{module.module_name} has a right associated. ")
        |> redirect(to: module_path(conn, :index))
    end
  end
end
