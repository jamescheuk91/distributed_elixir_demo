# DistributedElixirDemo

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `distributed_elixir_demo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:distributed_elixir_demo, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/distributed_elixir_demo](https://hexdocs.pm/distributed_elixir_demo).



## Running multiple nodes on a single computer

```elixir
% iex --sname node1
% iex --sname node2
% iex --sname node3
% iex(node1@your-computer-name)> Node.list
[]
% iex(node1@your-computer-name)> Node.connect :"node1@your-computer-name"
true
% iex(node1@your-computer-name)> Node.connect :"node3@your-computer-name"
true
% iex(node3@your-computer-name)> Node.list
[:"node1@your-computer-name", :"node2@your-computer-name"]
```

## Running multiple nodes on a single computer with mix

```elixir
% iex --sname node1 -S mix
% iex --sname node2 -S mix
% iex --sname node3 -S mix
% iex(node1@your-computer-name)> Node.connect :"node1@your-computer-name"
% iex(node1@your-computer-name)> Node.connect :"node3@your-computer-name"
% iex(node1@your-computer-name)> rate = %{
          cash_buy_rate: 1069.95,
          cash_sell_rate: 1108.05,
          symbol: "USD",
          tt_buy_rate: 1078.5,
          tt_sell_rate: 1099.5
        }
% iex(node1@your-computer-name)> DistrbutedElixirDemo.MarketData.RatesETSStore.insert("HKD", rate)
% iex(node1@your-computer-name)> DistrbutedElixirDemo.MarketData.RatesAgentStore.insert("HKD", rate)
% iex(node2@your-computer-name)> DistrbutedElixirDemo.MarketData.RatesETSStore.lookup("HKD")
```

DistrbutedElixirDemo.MarketData.RatesAgentStore.lookup("HKD")