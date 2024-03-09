# переписать ниже примеры из первого часа из видеолекции: 
# https://youtu.be/4igzy3bGVkQ
# по желанию можно поменять значения и попробовать другие функции

println("I'm excited to learn Julia!")

#%% code cell
println("This is code cell")
println("Press Alt+Enter to run this code cell")
#%%

#%%
a = 42
typeof(a)
#%%

#%%
b = 3.14
typeof(b)
#%%

#%%
name = "Victor"
typeof(name)
#%%

a = name
typeof(a)


# BASIC MATH
sum = 3 + 7
difference = 10-7
p = 20*5
frac = 100/10
pow = 10^2
mod = 3%2


# STRINGS
s1 = "this is string"
s2 = """this is also string"""

typeof('a')
typeof(s1)

s3 = """ look how we could "type" """

name = "victor"
println("pupupu $name wow")
n = 3
println("hello there $n")
a = 10
println("i can $(a+n)")

string("concatenation ", "strings")
string("i don't know, but ", 10, " maybe this work too")

s4 = "how many cats "
s5 = "are too many cats"
s4*s5 
"$s4$s5"



# DATA STRUCTURES

# dict 
book = Dict("Jenny" => "867-5309", "Ghostbusters" => "555-268")
book["Kramer"] = "555-FILK"
book 

pop!(book, "Kramer")
book

# tuples immutable
best_animals = ("penguins", "nerps", "sharks")
best_animals
best_animals[1]
best_animals[1] = "camels"  # you can't do that

# arrays mutable
arr = ["Ted", "asdf", "qwer"]
arrnum = [2,1,3]
mix = ["qwer", 1, 2]
mix[2]
mix[3] = "asdf"
mix
push!(arrnum, 4)  # ok
push!(arr, 4)  # not ok

multiarr1 = [[1,2,3], [4,3,5], [6,7]]

rand(4,3)
rand(4,3,2)



# LOOPS
# while
n = 0
while n < 10
    println(n)
    n+=1
end

strs = ["qwer", "asdf", "zxcv", "uiop", "tyui"]
i = 1
while i <= length(strs)
    f = strs[i]
    println("Hi $f !!!")
    i+=1
end

# for 
for i in 1:10
    println(i)
end

strs = ["qwer", "asdf", "zxcv", "uiop", "tyui"]
for f in strs
    println(f)
end

for i = 1:10
    print(i)
end

m,n = 5,5
A = zeros(m,n)
for i in 1:m
    for j in 1:n
        A[i, j] = i + j
    end
end
A

B = ones(m,n)
for i in 1:m, j in 1:n
    B[i, j] = i + j 
end
B

C = [i + j for i in 1:m, j in 1:n]
C

for n in 1:10
    A = [i + j for i in 1:n, j in 1:n]
    display(A)
end


# CONDITIONALS
x = 5
y = 2
if x > y
    println("qwer $x")
elseif x == y
    println("equal")
else
    println("zxcv $y")
end

a = false
b = false
c = 2
a ? b : c 
# is equates
if a
    b 
else
    c
end

a&&b


# FUNCTIONS
function sayhi(name)
    println("Hi $name, it's great to see you!")
end
sayhi("Victor")

function f(x)
    x^2
end
f(4)

sayhi2(name) = println("Hi $name, it's great to see you!")
sayhi("Victor")

z(x) = x^3
z(4)

sayhi3 = name -> println("Hi $name, it's great to see you!")
sayhi3("qwer")

sayhi(1234)

A = rand(3,3)
f(A)

v = rand(3)
f(v)


v = [3,5,2]
sort(v)
v
sort!(v)
v 

A = [i + 3*j for j in 0:2, i in 1:3]
f(A)
B = f.(A)

A[2,2]
A[2,2]^2
B[2,2]

f.(v)
f(v)



# PACKAGES
using Colors
palette = distinguishable_colors(100)

rand(palette, 3, 3)


# PLOTTING
using Plots
x = -3:0.1:3
f(x) = x^2
y = f.(x)

gr()
plot(x,y, label="line")
scatter!(x,y, label="points")

plotlyjs()
plot(x,y, label="line")
scatter!(x,y, label="points")

gt = [14, 15, 16, 18, 21, 22]
nump = [45000, 20000, 15000, 5000, 400, 17]

plot(nump, gt, legend=false)
scatter!(nump, gt, legend=false)

xflip!()

xlabel!("Num of pirates")
ylabel!("Temperatures")
title!("Influence of pirate population on temp")

# subplots
p1 = plot(x, x)
p2 = plot(x, x.^2)
p3 = plot(x, x.^3)
p4 = plot(x, x.^4)
plot(p1,p2,p3,p4, layout=(2,2), legend=false)


# MULTIPLE DISPATCH
methods(+)

@which 3 + 3
@which 3.0+3.0
@which 3+3.0

#extend +
import Base: +
"hello " + "world!"
@which "hello " + "world!"

+(x::String, y::String) = string(x, y)
"hello " + "world!"
@which "hello " + "world!"

foo(x,y) = println("duck-typed foo!")
foo(x::Int, y::Float64) = println("foo with an integer and a float")
foo(x::Float64, y::Float64) = println("foo with two floats")
foo(x::Int, y::Int) = println("foo with two integers")

foo(1,1)
foo(1,1.0)
foo(2.0,3.0)
foo(true, 1)


# BASIC LINEAR ALGEBRA
A  = rand(1:4, 3, 3)
B = A
C = copy(A)
[B C]

A[1] = 17
[B C]

x = ones(3)

# multiplication
b = A*x

# Transposition
Asym = A + A'
A'
A

# Transposed multiplication
Apd = A'A

# Solving linear systems (Ax=b)
A\b 

# Overdetermined systems
Atall = A[:,1:2]
display(Atall)
Atall\b 

A = randn(3,3)
[A[:,1] A[:,1]]\b 

# Underdetermined systems
Ashort = A[1:2, :]
Ashort\b[1:2]
