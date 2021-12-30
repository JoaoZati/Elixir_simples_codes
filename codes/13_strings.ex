string = <<104,101,108,108,111>> #Hello
string <> <<0>> |> IO.puts()
# <<104, 101, 108, 108, 111, 0>> #<<>> these sybols are bytes

'Hełło' |> IO.puts()

?Z |> IO.puts()

string = "\u0061\u0301"
IO.puts(string)

String.codepoints string |> IO.inspect()
String.graphemes string |> IO.inspect()

#Functions
String.length "Hello"
String.replace("Hello", "e", "a")
String.duplicate("Oh my ", 3)
String.split("Hello World", " ")

