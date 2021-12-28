# if and Useless
# (only false is nil and false)

if String.valid?("Hello") do
  "Valid string!"
else
  "Invalid string."
end
# Valid string!
if "a string value" do
  "Truthy"
end
# Truthy

# Useless is if ao contrário
unless is_integer("hello") do
  "Not an Int"
end
# "Not an Int"

# Multiple cases
case {:ok, "Hello World"} do
  {:ok, result} -> result
  {:error} -> "Uh oh!"
  _ -> "Catch all"
end
# Hello World

# '_' is important case not macht (else)
case :even do
  :odd -> "Odd"
  _ -> "Not Odd"
end
# Not Odd

case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    "Will match"
  _ ->
    "Won't match"
end
# Will match

# cound (else if, elif)
cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    "But this will"
end
# "But this will"

cond do
  7 + 1 == 0 -> "Incorrect"
  true -> "Catch all"
end
# "Catch all"

#with (to handle errors)
import Integer

m = %{a: 6, c: 3}

a = with {:ok, number} <- Map.fetch(m, :a),
true <- is_even(number) do
    IO.puts "#{number} divided by 2 is #{div(number, 2)}"
    :even
else
:error ->
    IO.puts("We don't have this item in map")
    :error

_ ->
    IO.puts("It is odd")
    :odd
end

IO.puts "#{a}"
