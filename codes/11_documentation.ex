# Inline documantation

# Outputs 'Hello, chum.' to the console.
IO.puts("Hello, " <> "chum.")


#Documenting Modules

defmodule Greeter do
    @moduledoc """
    Provides a function hello that greet a human by the name given
    """

    @doc """
    Prints a hello message.

    ## Parameters

    - name: String that represents the name of the person.

    ## Examples

        iex> Greeter.hello("Sean")
        "Hello, Sean"

        iex> Greeter.hello("pete")
        "Hello, pete"

    """

    @spec hello(String.t()) :: String.t()
    def hello(name) do
    "Hello #{name}"
    end
end

# in iex type h Greeter
# iex -S mix already load the modules

# Best pratice if dont want to document leave it blank
# Use markdown on @doc

defmodule Greeter2 do
  @moduledoc false

end

