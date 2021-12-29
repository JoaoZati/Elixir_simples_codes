defmodule Example.Greetings do
    def morning(name) do
        "Good morning #{name}."
    end 

    def evening(name) do
        "Good night #{name}."
    end
end

Example.Greetings.morning("Sean") |> IO.puts()

#Module atributes
defmodule MyServer do
  @initial_state %{host: "147.0.0.1", port: 3456}
  IO.inspect @initial_state
end

defmodule Example2 do
  @greeting "Hello"

  def greeting(name) do
    ~s(#{@greeting} #{name}.)
  end
end

Example2.greeting("Sean") |> IO.puts()

# Strucs
# Structs are special maps with a defined set of keys and default values. 

defmodule Example.User do
    defstruct name: "Sean", roles: []
end

# steve = %Example.User{name: "Steve"}
# Dont work in same file!!!
# %Example.User{name: "Steve"}
# Can change

defmodule Example.User do
  @derive {Inspect, only: [:name]}
  defstruct name: nil, roles: []
end
# in inspect dont show roles

# COMPOSITION
# interact with other modules

defmodule Sayings.Greetings do
  def basic(name), do: "Hi, #{name}"
end

defmodule Example do
  alias Sayings.Greetings

  def greeting(name), do: Greetings.basic(name)
end

Example.greeting("Joao") |> IO.puts()

# Without alias

defmodule Example do
  def greeting(name), do: Sayings.Greetings.basic(name)
end

Example.greeting("Joao") |> IO.puts()


defmodule Example do
  alias Sayings.Greetings, as: Hi

  def print_message(name), do: Hi.basic(name)
end

Example.print_message("Joao") |> IO.puts()

defmodule Example do
  alias Sayings.{Greetings, Farewells}
end

# import functions

import List

last([1, 2, 3]) |> IO.puts()

import List, only: [last: 1] # only last function
import List, except: [last: 1] # all functions except last

# Only functions or macros 

import List, only: :functions
import List, only: :macros

"
defmodule Example do
  require SuperMacros

  SuperMacros.do_stuff
end
"

defmodule Hello do
  defmacro __using__(_opts) do
    quote do
      def hello(name), do: "Hi, #{name}"
    end
  end
end

defmodule Example do
  use Hello
end

Example.hello("Sean") |> IO.puts()