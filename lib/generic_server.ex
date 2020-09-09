defmodule Playground.GenericServer do

  def start(module) do
    spawn(fn ->
      initial_state = module.init()
      loop(module, initial_state)
    end)
  end

  def loop(module, state) do
    IO.inspect(state)
    state = 
      receive do
        {:cast, from, data} ->
          module.handle_cast()
        {:call, from, data} ->
          Process.sleep(100)
          {:reply, value, new_state} = module.handle_call(state, data)
          new_state
        {:stop, from, reason} -> Process.exit(self(), reason)
      end
    loop(module, state)
  end
end
