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

defmodule Peanuts do
  defstruct properties: []

  def weigh() do
    %Peanuts{}
  end

  def roast(peanuts = %Peanuts{}) do
    _modify(peanuts, :roasted)
  end

  def salt(peanuts = %Peanuts{}) do
  	_modify(peanuts, :salted)
  end

  def _modify(%Peanuts{properties: original}, property) do
    extended = [property | original]
    %Peanuts{properties: extended}    
  end
end

defmodule Identity do
  def identity(value) do
  	value
  end
end

sugar = Sugar.weigh(1)
IO.inspect(sugar)

bag = Bag.pack(sugar)
IO.inspect(bag)

identified = Bag.map(bag, &Identity.identity(&1))
IO.inspect(identified)
IO.inspect(identified == bag)

halved = Bag.map(bag, &(Sugar.halve(&1)))
IO.inspect(halved)
IO.inspect(halved == bag)

content = Bag.unpack(bag)
IO.inspect(content)

peanuts = Peanuts.weigh()
IO.inspect(peanuts)
roasted = Peanuts.roast(peanuts)
IO.inspect(roasted)
salted = Peanuts.salt(roasted)
IO.inspect(salted)

peanuts_bag = Bag.pack(peanuts)
IO.inspect(peanuts_bag)

roasted_salted_map =
  peanuts_bag
  |> Bag.map(&Peanuts.roast(&1))
  |> Bag.map(&Peanuts.salt(&1))
IO.inspect(roasted_salted_map)

roasted_salted_composed =
  Bag.map(
    peanuts_bag,
	fn bag ->
	  bag
	  |> Peanuts.roast()
	  |> Peanuts.salt()
	end
  )
IO.inspect(roasted_salted_composed)

IO.inspect(roasted_salted_map == roasted_salted_composed)
