defmodule DistrbutedElixirDemo.MarketData.RatesAgentStore do
  use Agent

  def start_link(_) do
    Agent.start_link(fn -> MapSet.new end, name: __MODULE__)
  end


  def insert(key, value) do
    item = {key, value}
    Agent.update(__MODULE__, &MapSet.put(&1, item))
  end

  def lookup(key) do
    Agent.get(__MODULE__, fn(mapset) -> 
      mapset
      |> Enum.find(fn({item_key, _}) -> item_key == key end)
    end)
  end
end
  
