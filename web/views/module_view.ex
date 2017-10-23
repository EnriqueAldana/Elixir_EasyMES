defmodule MesPhoenix.ModuleView do
  use MesPhoenix.Web, :view
  import Ecto.Changeset
  alias MesPhoenix.ErrorHelpers

def get_err(changeset)do
   ErrorHelpers.error_string_from_changeset(changeset)
end

end
