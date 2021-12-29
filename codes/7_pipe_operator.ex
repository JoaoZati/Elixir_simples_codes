# Programing can be messy foo(bar(baz(new_function(other_function()))))
# so |> can be a simplification

# other_function() |> new_function() |> baz() |> bar() |> foo()

"Elixir rocks" |> String.split() |> IO.inspect()

"Elixir rocks" |> String.upcase() |> String.split() |> IO.inspect()

"elixir" |> String.ends_with?("ixir") |> IO.inspect()

"elixir" |> String.ends_with? "ixir" |> IO.inspect() # Best pratice use ()