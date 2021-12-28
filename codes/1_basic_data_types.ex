# Basic calculation
a = 2
b = 3
c = a + b

# Bool
boolean = true
bool_sum = 2 + 3 == 5

# Float
float = 3.14

# Atom
atom = :foo
is_atom(true)
is_boolean(:true)
is_atom(MyApp.MyModule)
:crypto.strong_rand_bytes 3 # reference from Erlang library

# Strings
hello = "Hello"
breakline = "Foo\nBar"

# Aritmetic
sum = 2 + 5
sub = 2 - 5
dot = 2 * 5
div = 2 / 5 # return number

#Integer division
num_div = div(10, 5) # numero de vezes dividido (Can be div 10, 5)
num_rem = rem(10, 3) # Retorna o resto

# Boolean
or_type = -20 || true
or_type_or = true or 20
or_type_or_2 = true or false
or_type_2 = true || false
or_type_3 = false || 42

and_type = 42 && true
and_type_2 = 42 && nil
and_type_3 = true and 42 #need to be boolan first

not_type = !42
not_type_2 = !false
not_type_3 = not false

# Comparation
comp_1 = 1 > 2
comp_2 = 1 != 2
comp_3 = 2 == 2
comp_4 = 2 <= 3

true_comp = 2 == 2.0
false_comp = 2 === 2.0

comp_5 = :hello > 999
comp_6 = {:hello, :word} > [1, 2, 3]

# String interpolation

name = "Sean"
full_name = "Hello #{name}"

IO.puts String.length("The quick brown fox jumps over the lazy dog")
