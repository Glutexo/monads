defmodule Bag do
  defstruct [:content]

  def pack(content) do
    %Bag{content: content}
  end

  def unpack(%Bag{content: content}) do
    content
  end
end

sugar = 1
bag = Bag.pack(sugar)
content = Bag.unpack(bag)
IO.inspect(content)
