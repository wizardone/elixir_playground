defmodule Playground.Macros do
  defmacro basic(expression) do
    quote do
      unquote(expression)
    end
  end

  defmacro generate_module(name) do
    quote do
      defmodule unquote(Module.concat([Playground, name])) do
        @after_compile __MODULE__
        def print do
          IO.puts("I'm inside #{unquote(Playground)}.#{unquote(name)}!")
        end

        def __after_compile__(env, _) do
          IO.puts("I've just compiled")
        end
      end
    end
  end

  def print do
    IO.puts("I'm in print")
  end
end
