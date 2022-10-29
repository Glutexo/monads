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

sugar = 1
bag = Bag.pack(sugar)
Bag.map(bag, &(&1 / 2))
|> IO.inspect()
#content = Bag.unpack(bag)
#IO.inspect(content)
