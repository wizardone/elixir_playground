defmodule Statesman do
  def run do
    case Agent.start_link(fn -> [] end, name: __MODULE__) do
      {:ok, agent} ->
        get_prices(agent)
      {:error, {:already_started, agent}} ->
        Agent.stop(agent)
        Statesman.run
    end
  end

  def get_prices(agent) do
    tasks = cryptos()
      |> Enum.each(fn(crypto) ->
        Task.async(get_price(crypto))
      end)
    Task.yield_many(tasks)
  end

  defp get_price(crypto) do
    fn ->
      HTTPoison.get!("https://coinbin.org/#{crypto}")
      |> IO.inspect()
    end
  end

  defp cryptos do
    ["btc", "eth", "xrp", "bch", "ltc", "ada", "xlm", "neo", "xmr", "miota", "dash",
     "xem", "etc", "qtum", "xvg", "lsk", "btg", "zec", "nano", "steem", "wan", "bcn",
     "sc", "bts", "strat", "dcr", "doge", "waves", "bcd", "kmd", "ardr", "hsr", "ark"]
  end
end
