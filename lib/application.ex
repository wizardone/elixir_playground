defmodule Playground.Application do
  use Application

  def start(:normal, _args) do
    # Supervisor.start_link(children(), strategy: :one_for_one)
    # Playground.Supervisor.start_link(name: Playground.Supervisor)
    Supervisor.start_link(Playground.Supervisor, [], name: MainSupervisor)
  end

  def stop(state) do
    IO.inspect(state)
    IO.puts("shutting down")
  end
end
