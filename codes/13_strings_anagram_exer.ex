# A and B are considered anagrams if there’s a way to rearrange A or B making them equal. For example:
# A = super
# B = rerus

defmodule Anagram do
    def short_string(string) do
        string = String.downcase(string)
        string = String.graphemes(string)
        Enum.sort(string)
    end

    def is_anagram(a, b) do
        short_string(a) == short_string(b)
    end
end

s = "Joao Guilherme"
s2 = "Guilherme joao"

Anagram.short_string(s) |> IO.inspect()
Anagram.is_anagram(s,s2)|> IO.puts()

# Made by the Elixir School

defmodule Anagram2 do
  def anagrams?(a, b) when is_binary(a) and is_binary(b) do
    sort_string(a) == sort_string(b)
  end

  def sort_string(string) do
    string
    |> String.downcase()
    |> String.graphemes()
    |> Enum.sort()
  end
end