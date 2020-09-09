defmodule Playground.GenericServerBehaviour do
  @callback init() :: any
  @callback handle_call(any, any) :: any
  @callback handle_cast(any, any) :: any
end
