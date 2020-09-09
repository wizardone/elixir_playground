defmodule Playground.GenericServerClient do

  @behaviour Playground.GenericServerBehaviour

  def push(pid, value) do
    send(pid, {:call, self(), {:push, value}})
  end

  def pop(pid) do
    send(pid, {:call, self(), :pop})
  end

  @impl true
  def init() do
    [:a, :b, :c]
  end

  @impl true
  def handle_call(state, {:push, value}) do
    {:reply, value, state ++ [value]}
  end

  @impl true
  def handle_call(state, :pop) do
    [head | tail] = state
    {:reply, head, tail}
  end
end
