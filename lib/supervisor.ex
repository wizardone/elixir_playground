defmodule Playground.Supervisor do
  use Supervisor

  def init(state) do
    IO.inspect("Starting named supervisor Playground.Supervisor")

    children = [
      {Playground.Children.ChildGenServer, [:wat_is_dat]},
      {Playground.Children.ChildTask, [:task_task]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
