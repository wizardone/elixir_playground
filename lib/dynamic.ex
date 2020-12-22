defmodule Playground.Dynamic do
  @after_compile __MODULE__
  @states [:new, :progressing, :complete]

  # for state <- @states do
  #  def unquote(state)(), do: "#{Atom.to_string(unquote(state))} state"
  # end

  # Enum.each(states, fn state ->
  #  nil
  # end)

  def __after_compile__(env, _) do
    IO.inspect(@states)

    for state <- @states do
      IO.inspect(state)
      # def unquote(state)(), do: "#{Atom.to_string(unquote(state))} state"
    end
  end

  # defp states(), do: @states
end
