# Mach operator (from left to right)
x = 1
# 1
1 = x
# 1
2 = x
# ** (MatchError) no match of right hand side value: 1

# List
list = [1 , 2, 3]
[1 | tail] = list
tail
# [2, 3]

# Tuple
{:ok, value} = {:ok, "Successful"}
value
# Successful

#Pin operator
x = 1
^x = 1
# 1
^x = 2
# error 
{x, ^x} = {2, 1} # ( da erro se X != 1)
x
# 2

greeting = "Hello"
greet = fn 
    (^greeting, name) -> "Hi #{name}" 
    (greeting, name) -> "#{greeting} #{name}"
end
greet.("Hello", "Sean")
# Hi Sean
greet.("Mornin'", "Sean")
# Morning' Sean

