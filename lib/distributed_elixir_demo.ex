defmodule DistributedElixirDemo do
  use Application
  @moduledoc """
  Documentation for DistributedElixirDemo.
  """
  alias DistrbutedElixirDemo.MarketData
  
  def start(_type, _args) do
    children = [
      {MarketData.Supervisor, []}
    ]

    opts = [strategy: :one_for_one, name: DistributedElixirDemo.Supervisor]
    
    Supervisor.start_link(children, opts)
  end
end
