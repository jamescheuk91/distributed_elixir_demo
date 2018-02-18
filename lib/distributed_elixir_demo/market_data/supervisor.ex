defmodule DistrbutedElixirDemo.MarketData.Supervisor do
  use Supervisor
  @ets_registry_name :rates_lookup

  alias DistrbutedElixirDemo.MarketData.RatesETSStore
  alias DistrbutedElixirDemo.MarketData.RatesAgentStore

  def start_link(args) do
    GenServer.start_link(__MODULE__, args, name: __MODULE__)
  end

  def init(_args) do
    ets = :ets.new(@ets_registry_name, [:set, :public, :named_table, {:read_concurrency, true}])
  
    children = [
      {RatesETSStore, [ets]},
      {RatesAgentStore, []}
    ]
  
    Supervisor.start_link(children, strategy: :one_for_one)
  end
end

