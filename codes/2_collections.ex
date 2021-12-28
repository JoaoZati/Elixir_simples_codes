list = [3.14, :pie, "Apple"]

#apending fast
list_append = ["pi" | list]
# appending slow
list_append_2 = list ++ ["cherry"]

# concatenation (sum)
list_con = [1, 2] ++ [3, 4, 1]

#subtraction
list_sub = ["foo", :bar, 42] -- [42, "bar"]
# (Be mindful of duplicate values. For every element on the right, the first occurrence of it gets removed from the left:)
list_sub_2 = [1,2,2,3,2,3] -- [1,2,3,2]
# is strict
list_sub_3 = [2] -- [2.0]

#Head/Tail
head = hd([3.14, :pie, "Apple"])
tail = tl([3.14, 5, 10]) # two last
[head | tail] = [3.14, :pie, "Apple"] # head = 3.14, tail = [:pie, "Apple"]

#Tuples
#(fast for access, but expensive to change)
tuple = {3.14, :pie, "Apple"}
# most used as return of functions
file_content = File.read("path/to/unknowname/file")

#Keyword lists (special type with 2 elements tuple, must be atom the keys)
keyword = [foo: "bar", hello: "world"]
keyword_same = [{:foo, "bar"}, {:hello, "world"}]

# maps (same as dict in python)
map = %{:foo => "bar", "hello" => :world}
element_foo = map[:foo]
element_hello = map["hello"]
# maps keys are dinamics
key = "hello"
map_key = %{key => "world"}
# Special sintax for atomns only keys
map_atoms = %{foo: "bar", hello: "world"}
bool_true = %{foo: "bar", hello: "world"} == %{:foo => "bar", :hello => "world"}
# special sintax for acessing atoms only keys
atom = map.foo
# Change a value, note: create a new map*
map_atoms_2 = %{map_atoms | foo: "baz"} # if key does not exist keyerror is raised
# Add Value
map_atom_3 = Map.put(map_atoms, :loo, "baz")
