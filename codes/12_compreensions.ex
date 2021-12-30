list = [1, 2, 3, 4, 5]
for x <- list, do: x*x

for {_key, val} <- [one: 1, two: 2, three: 3], do: val
[1, 2, 3]

for <<c <- "hello">>, do: <<c>>

for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World"], do: val


list = [1, 2, 3, 4]
for n <- list, times <- 1..n do
  String.duplicate("*", times)
end
# ["*", "*", "**", "*", "**", "***", "*", "**", "***", "****"]

for n <- list, times <- 1..n, do: IO.puts "#{n} - #{times}"

import Integer
for x <- 1..10, is_even(x), do: x
# [2, 4, 6, 8, 10]

for x <- 1..100,
  is_even(x),
  rem(x, 3) == 0, do: x

# into
for {k, v} <- [one: 1, two: 2],
  into: %{}, do: {k, v}

for c <- [72, 101, 108, 108, 111], into: "", do: <<c>>
