defmodule Playground.Children.ChildTask do
  use Task, id: __MODULE__, restart: :permanent

  def start_link(state \\ []) do
    IO.inspect("Starting ChildTask start_link, state is")
    Task.start_link(__MODULE__, :run, state)
  end

  def run(state) do
    receive do
      _ -> IO.puts("received something")
    after
      30000 ->
        IO.puts("I'm doing something")
        run(state)
    end
  end
end
