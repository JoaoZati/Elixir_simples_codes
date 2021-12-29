# all colections except tuples
# 70 functions and is core to functional programing

Enum.__info__(:functions) |> Enum.each(fn({function, arity}) ->
  IO.puts "#{function}/#{arity}"
end)

# all? function
IO.puts "#{Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) == 3 end)}"
IO.puts "#{Enum.all?(["foo", "bar", "hello"], fn(s) -> String.length(s) >= 3 end)}"

# any?
small_list = Enum.any?([4, 5, 7], fn(s) -> rem(s, 2) == 0 end)
IO.puts "#{small_list}"

# chunk every (separete into small pieces)
chunk_list = Enum.chunk_every([4, 5, 7], 2)
IO.inspect chunk_list

# chunk by
chunk_by = Enum.chunk_by(["one", "two", "three", "four", "five"], fn(x) -> String.length(x) end)
IO.inspect chunk_by
IO.puts "the list is: #{inspect(chunk_by)}"

# Join
IO.puts(["list is ", Enum.join([1, 2, 3], " ")])

# Apply function every three items
list_map_every = Enum.map_every([1, 2, 3, 4, 5, 6, 7, 8], 3, fn x -> x + 1000 end)
IO.inspect(list_map_every)

# Each, interating without create new value
Enum.each(["one", "two", "three"], fn(s) -> IO.puts(s) end)

# map
map_list = Enum.map([0, 1, 2, 3], fn(x) -> x - 1 end)
IO.inspect(map_list)

# min 
minim = Enum.min([5, 3, 0, -1])
IO.puts "#{minim}"

# max
max = Enum.max [5, 3, 10, -1]
IO.puts "#{max}"

# Filter
filter = Enum.filter([1, 2, 3, 4], fn(x) -> rem(x, 2) == 0 end)
IO.puts "#{inspect(filter)}"

#reduce
Enum.reduce([1, 2, 3], 10, fn(x, acc) -> x + acc end)
Enum.reduce(["a","b","c"], "1", fn(x,acc)-> x <> acc end)

#sort
Enum.sort([5, 6, 1, 3, -1, 4])
Enum.sort([%{:val => 4}, %{:val => 1}], fn(x, y) -> x[:val] > y[:val] end)
Enum.sort([%{:count => 4}, %{:count => 1}])
Enum.sort([1, 2, 3], &(&1 >= &2))
Enum.sort(["some", "kind", "of", "monster"], &(byte_size(&1) <= byte_size(&2)))
Enum.sort([2, 3, 1], :desc)

#uniq (eliminate duplicates)
Enum.uniq([1, 2, 3, 2, 1, 1, 1, 1, 1])
Enum.uniq_by([%{x: 1, y: 1}, %{x: 2, y: 1}, %{x: 3, y: 3}], fn coord -> coord.y end)

#sum
Enum.sum([1, 2, 3, 4])

#count
Enum.count([1, 2, 3, 4, 5])

# Create numbers (similar to range)
Enum.to_list(1..10)
Enum.filter(Enum.to_list(2..20), fn(n) -> rem(n, 2) == 0 end)
Enum.to_list(1..3//2)
Enum.to_list(10..1//-1)
Enum.to_list(0..10//-1)
range = 1..9//2
first..last//step = range

# Using capture operator
Enum.map([1,2,3], fn number -> number + 3 end)
# [4, 5, 6]
Enum.map([1,2,3], &(&1 + 3))
# [4, 5, 6]
plus_three = &(&1 + 3)]
Enum.map([1,2,3], plus_three)
# [4, 5, 6]

# Using the capture operator with a named function
defmodule Adding do
  def plus_three(number) do
    number + 3
  end
end

Adding.plus_three(5)
# 8
Enum.map([1,2,3], fn number -> Adding.plus_three(number) end)
# [4, 5, 6]
Enum.map([1,2,3], &Adding.plus_three(&1))
# [4, 5, 6]
Enum.map([1,2,3], &Adding.plus_three/1)
# [4, 5, 6]
