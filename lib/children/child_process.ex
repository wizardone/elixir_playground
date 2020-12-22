defmodule Playground.Children.ChildGenServer do
  use GenServer

  def start_link(state \\ []) do
    IO.inspect("Starting ChildProcess start_link, state is")
    IO.inspect(state)
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def init(initial) do
    IO.inspect("Starting ChildProcess init")
    {:ok, initial}
  end

  def push(pid, el) do
    GenServer.cast(pid, {:push, el})
  end

  def pop(pid) do
    GenServer.cast(pid, :pop)
  end

  @impl true
  def handle_call(:pop, _from, [head | tail]) do
    {:reply, head, tail}
  end

  @impl true
  def handle_cast({:push, head}, tail) do
    {:noreply, [head | tail]}
  end
end
