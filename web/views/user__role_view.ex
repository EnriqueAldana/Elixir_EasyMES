defmodule MesPhoenix.User_RoleView do
  use MesPhoenix.Web, :view
  alias MesPhoenix.ErrorHelpers
  def get_err(changeset)do
     ErrorHelpers.error_string_from_changeset(changeset)
  end

end
