defmodule Playground.Macros do

  defmacro basic(arg1, arg2) do
    quote do
      unquote(print())
      unquote(arg1 + arg2)
    end
  end

  defmacro generate_module(name) do
    quote do
      defmodule unquote(Module.concat([Playground, name])) do
        @after_compile __MODULE__
        def print do
          IO.puts "I'm inside #{unquote(Playground)}.#{unquote(name)}!"
        end

        def __after_compile__(env, _) do
          IO.puts "I've just compiled, bitches"
        end
      end
    end
  end

  def print do
    IO.puts "I'm in print"
  end
end
