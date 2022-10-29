defmodule Bag do
  defstruct [:contents]

  def pack(contents) do
    %Bag{contents: contents}
  end

  def unpack(%Bag{contents: contents}) do
    contents
  end
end

sugar = 1
bag = Bag.pack(sugar)
contents = Bag.unpack(bag)
IO.inspect(contents)
