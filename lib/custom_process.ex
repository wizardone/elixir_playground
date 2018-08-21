defmodule CustomProcess do

  def receive do
    IO.puts("Receiving")
    receive do
      "WTF" -> "WTF"
      "FOO" -> "FOO"
      _ -> "Some other argument"
    after
      1_000 -> "Nothing received"
    end
  end

  def send(msg) do
    send(self(), msg)
    IO.puts("after")
  end
end

defmodule Sender do
  def start do
    pid = spawn_link(CustomProcess, :send, ["WTF"])
  end
end
