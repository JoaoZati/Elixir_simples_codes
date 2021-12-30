~c/2 + 7 = #{2 + 7}/ # (interpolate the calculation)
~C/2 + 7 = #{2 + 7}/

re = ~r/elixir/
"Elixir" =~ re # false
"elixir" =~ re # true

re = ~r/elixir/i
"Elixir" =~ re # true

string = "100_000_000"
Regex.split(~r/_/, string) |> IO.inspect()

#string
~s/the cat in the hat on the mat/
~S/the cat in the hat on the mat/

~s/welcome to elixir #{String.downcase "SCHOOL"}/
~S/welcome to elixir #{String.downcase "SCHOOL"}/ # (dont interpolate)

~w/i love elixir school/ # ["i", "love", "elixir", "school"]
~w/i love #{'e'}lixir school/ # ["i", "love", "elixir", "school"]
~W/i love #{'e'}lixir school/ # ["i", "love", "\#{'e'}lixir", "school"]

NaiveDateTime.from_iso8601("2015-01-23 23:50:07") == {:ok, ~N[2015-01-23 23:50:07]}
# true
DateTime.from_iso8601("2015-01-23 23:50:07-0600") == {:ok, ~U[2015-01-24 05:50:07Z], -21600}
# true

# creating sigls

defmodule MySigils do
    def sigil_p(string, []), do: String.upcase(string)
end

# import MySigils

# ~p/elixir school/ |> IO.puts()
