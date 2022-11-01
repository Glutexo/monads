defmodule OptionalInteger do
  defstruct value: nil

  def create() do
    create(nil)
  end

  def create(nil) do
    %OptionalInteger{value: nil}
  end

  def create(value) when is_integer(value) do
  	%OptionalInteger{value: value}
  end

  def get(%OptionalInteger{value: value}) do
    value
  end

  def map(%OptionalInteger{value: nil}, _func) do
    create()
  end

  def map(%OptionalInteger{value: value}, func) do
    func.(value)
    |> create()
  end
end

IO.inspect(OptionalInteger.create(1))
IO.inspect(OptionalInteger.create(nil))
IO.inspect(OptionalInteger.create())
# IO.inspect(OptionalInteger.create("a"))

OptionalInteger.create(1)
|> OptionalInteger.map(fn int -> int * 2 end)
|> IO.inspect()

OptionalInteger.create(nil)
|> OptionalInteger.map(fn int -> int * 2 end)
|> IO.inspect()

# OptionalInteger.create(1)
# |> OptionalInteger.map(fn int -> "#{int}" end)
# |> IO.inspect()
