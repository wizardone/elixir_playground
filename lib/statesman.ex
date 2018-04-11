defmodule Statesman do
  import HTTPoison
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
    cryptos
    |> Enum.each(fn(crypto)-> get_price(crypto) end)
  end

  defp get_price(crypto) do
    response = HTTPoison.get!("https://coinbin.org/#{crypto}")
    IO.inspect(response)
  end

  defp cryptos do
    ["btc", "eth", "xrp", "bch", "ltc", "ada", "xlm", "neo", "xmr", "miota"]
  end
end
