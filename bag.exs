defmodule Bag do
  defstruct [:content]

  def pack(content) do
    %Bag{content: content}
  end

  def unpack(%Bag{content: content}) do
    content
  end

  def map(bag, function) do
    bag
	|> unpack()
	|> function.()
	|> pack()
  end
end

defmodule Sugar do
  defstruct weight: 0

  def weigh(weight) do
    %Sugar{weight: weight}
  end

  def halve(%Sugar{weight: full}) do
    half = full / 2
    %Sugar{weight: half}
  end
end

sugar = Sugar.weigh(1)
IO.inspect(sugar)

bag = Bag.pack(sugar)
IO.inspect(bag)

Bag.map(bag, &(Sugar.halve(&1)))
|> IO.inspect()

content = Bag.unpack(bag)
IO.inspect(content)
