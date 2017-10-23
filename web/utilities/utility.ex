defmodule MesPhoenix.Utility do

  @doc """
  Sum all numerical list members.
  """
  def sum_list([head | tail], accumulator) do
      sum_list(tail, head + accumulator)
    end

    def sum_list([], accumulator) do
      accumulator
    end
    @doc """
    Search the value for a key word of the ones key word list given.
    """
  def search_into_list_of_key_word([head | tail], elem4find, msg) do
      if (elem(head,0) === elem4find) do
              mess= elem(head,1)
              msg= elem(mess,0)
      else
          search_into_list_of_key_word(tail,elem4find, msg)
      end
  end

  def search_into_list_of_key_word([], elem4find, msg) do
      msg
  end
end
