# web/views/user_view.ex
defmodule MesPhoenix.UserView do
  use MesPhoenix.Web, :view
import Ecto.Changeset
alias MesPhoenix.Utility
alias MesPhoenix.ErrorHelpers

 def get_err(changeset)do
    ErrorHelpers.error_string_from_changeset(changeset)
 end

end
