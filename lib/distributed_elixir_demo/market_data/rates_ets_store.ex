defmodule DistrbutedElixirDemo.MarketData.RatesETSStore do
  use GenServer

  def start_link(state) do
    GenServer.start_link(__MODULE__, state, name: __MODULE__)
  end

  def lookup(key) do
    GenServer.call(__MODULE__, {:lookup, key})
  end

  def insert(key, value) do
    GenServer.cast(__MODULE__, {:insert, key, value})
  end


  def init(state) do
    {:ok, state}
  end

  def handle_call({:lookup, key}, _from, [ets_registry_name] = state) do
    result = case :ets.lookup(ets_registry_name, key) do
      [{^key, rate}] -> {:ok, rate}
      [] -> {:error, :rate_not_found}
    end
    
    {:reply, result, state}
  end

  def handle_cast({:insert, key, value}, [ets_registry_name] = state) do
    :ets.insert(ets_registry_name, {key, value})
    
    {:noreply, state}
  end
end
  
