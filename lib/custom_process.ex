defmodule CustomProcess do

  def receive do
    receive do
      "WTF" -> "WTF"
      "FOO" -> "FOO"
      _ -> IO.puts("Some other argument")
    end
    receive()
  end

  def send(msg) do
    send(self(), msg)
  end
end

defmodule Sender do
  def start do
    pid = spawn_link(CustomProcess, :send, ["WTF"])
  end
end

defmodule Countdown do

  def timer do
    receive do
      :start ->
        send(self(), {:tick, 5})
      {:tick, 0} ->
        IO.puts("The end")
        exit(:done)
      {:tick, value} ->
        IO.puts(value)
        Process.sleep(1000)
        send(self(), {:tick, value - 1})
    end

    timer()
  end

  def watch do
    pid = spawn_link(&timer/0)
    send(pid, :start)
  end
end
