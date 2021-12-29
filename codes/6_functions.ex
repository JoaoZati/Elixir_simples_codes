# Anonymous function
# Just as the name implies, an anonymous function has no name. As we saw in the Enum lesson, these are frequently passed to other functions. To define an anonymous function in Elixir we need the fn and end keywords. Within these we can define any number of parameters and function bodies separated by ->.

sum = fn 
    (a, b) -> a + b 
    end

IO.puts "#{sum.(2,3)}"

#same 
sum = &(&1 + &2)
IO.puts "#{sum.(2,3)}"

#pattern maching
handle_result = fn
    {:ok, result} -> IO.puts "Handling result..."
    {:ok, _} -> IO.puts "This would be never run as previous will be matched beforehand."
    {:error} -> IO.puts "An error has occurred!"
end
some_result = 1

handle_result.({:ok, some_result})
handle_result.({:error})

# Named functions
# useful for building blocks to use in others codes

defmodule Greeter do
    def hello(name) do
    "Hello #{name}"
    end
end

IO.puts "#{Greeter.hello("Henry")}"

# Can be do in one line
defmodule Greeter2 do
    def hello(name), do: "Hello, " <> name
end

IO.puts "#{Greeter2.hello("Jerry")}"

# Recursion Exemple
defmodule Length do
    def of([]), do: 0
    def of([_ | tail]), do: 1 + of(tail)
end

IO.puts "#{Length.of([])}"
IO.puts "#{Length.of([1, 2, 3])}"

# Function Naming and Arity

defmodule Greeter3 do
  def hello(), do: "Hello, anonymous person!"   # hello/0
  def hello(name), do: "Hello, " <> name        # hello/1
  def hello(name1, name2), do: "Hello, #{name1} and #{name2}"
                                                # hello/2
end

IO.puts "" <> Greeter3.hello()
IO.puts "" <> Greeter3.hello("Joao")
IO.puts "" <> Greeter3.hello("Joao e Julia")

# Functions and pattern maching (ex accepting a map)

defmodule Mapper do
    def hello(%{name: person_name}) do
        IO.puts "Hello #{person_name}"
    end
end

fred = %{name: "Fred", age: "95", favorite_color: "Taupe"}

Mapper.hello(fred)

# Greeter1.hello(%{age: "95", favorite_color: "Taupe"}) # Error
%{name: person_name} = %{name: "Fred", age: "95", favorite_color: "Taupe"}
person_name
# Fred

defmodule Greeter3 do
  def hello(person = %{name: person_name}) do
    IO.puts "Hello, " <> person_name
    IO.inspect person
  end
end

# Change output

defmodule Greeter2 do
  def hello(%{name: person_name} = person) do
    IO.puts "Hello, " <> person_name
    IO.inspect person
  end
end

# Private Functions (Can only be called in your own module)
defmodule Greeter do
    def hello(name), do: phrase() <> name
    defp phrase, do: "Hello, "
end

# Default arguments
# If we want a default value for an argument we use the argument \\ value syntax:

defmodule Greeter do
    def hello(name, language_code \\ "en") do
        phrase(language_code) <> name
    end 
    defp phrase("en"), do: "Hello, "
    defp phrase("es"), do: "Hola, "
end

IO.puts "" <> Greeter.hello("Sean", "en")
IO.puts "" <> Greeter.hello("Sean")
IO.puts "" <> Greeter.hello("Sean", "es")

# Exemple hello
defmodule Greeter do
  def hello(names, language_code \\ "en")

  def hello(names, language_code) when is_list(names) do
    names
    |> Enum.join(", ")
    |> hello(language_code)
  end

  def hello(name, language_code) when is_binary(name) do
    phrase(language_code) <> name
  end

  defp phrase("en"), do: "Hello, "
  defp phrase("es"), do: "Hola, "
end

""""
Instead of:

    def foo(:first_clause, b \\ :default) do ... end
    def foo(:second_clause, b \\ :default) do ... end

one should write:

    def foo(a, b \\ :default)
    def foo(:first_clause, b) do ... end
    def foo(:second_clause, b) do ... end
""""