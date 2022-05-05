#variables
#can use univode charcters and latex symbols
x = 1
name = "robot"
print(name)

; #means line break

#check type 
typeof(1)

#machine epsilon
eps()
nextfloat(1.0)
prevfloat(1.0)

#precision
BigInt(typemax(Int64)) + 1
big"123456789012345678901234567890" + 1
parse(BigInt, "123456789012345678901234567890") + 1

parse(BigInt, "123456789012345678901234567890") + 1
BigFloat(2.0^66) / 3

setprecision([T=BigFloat,] precision::Int)

#Numeric Literal Coefficients
#polynomials
x = 3
2x^2 - 3x + 1

#literal zero and one
zero()
one(Float64)

#Arithmetic Operators
+x	#unary plus	the identity operation
-x	#unary minus	maps values to their additive inverses
x + y	#binary plus	performs addition
x - y	#binary minus	performs subtraction
x * y	#times	performs multiplication
x / y	#divide	performs division
x ÷ y	#integer divide	x / y, truncated to an integer
x \ y	#inverse divide	equivalent to y / x
x ^ y	#power	raises x to the yth power
x % y	#remainder	equivalent to rem(x,y)

#dot operators define vector operators
#dot syntax
[1,2,3].+[1,2,3]
[1,2,3] + [1,2,3]
[1,2,3].^2

#Boolean Operators
!x	#negation
x && y	#short-circuiting and
x || y	#short-circuiting or

#Numeric Comparisons
==	#equality
!=, ≠	#inequality
<	#less than
<=, ≤	#less than or equal to
>	#greater than
>=, ≥	#greater than or equal to


#comparing
isequal(x, y)	#x and y are identical
isfinite(x)	#x is a finite number
isinf(x)	#x is infinite
isnan(x)	#x is not a number
#chaining
1 < 2 <= 2 < 3 == 3 > 2 >= 1 == 1 < 3 != 5

#rounding
round(x)	#round x to the nearest integer	typeof(x)
round(T, x)	#round x to the nearest integer	T
floor(x)	#round x towards -Inf	typeof(x)
floor(T, x)	#round x towards -Inf	T
ceil(x)	#round x towards +Inf	typeof(x)
ceil(T, x)	#round x towards +Inf	T
trunc(x)	#round x towards zero	typeof(x)
trunc(T, x)	#round x towards zero	T

#division
div(x,y), x÷y	#truncated division; quotient rounded towards zero
fld(x,y)	#floored division; quotient rounded towards -Inf
cld(x,y)	#ceiling division; quotient rounded towards +Inf
rem(x,y)	#remainder; satisfies x == div(x,y)*y + rem(x,y); sign matches x
mod(x,y)	#modulus; satisfies x == fld(x,y)*y + mod(x,y); sign matches y
mod1(x,y)	#mod with offset 1; returns r∈(0,y] for y>0 or r∈[y,0) for y<0, where mod(r, y) == mod(x, y)
mod2pi(x)	#modulus with respect to 2pi; 0 <= mod2pi(x) < 2pi
divrem(x,y)	#returns (div(x,y),rem(x,y))
fldmod(x,y)	#returns (fld(x,y),mod(x,y))
gcd(x,y...)	#greatest positive common divisor of x, y,...
lcm(x,y...)	#least positive common multiple of x, y,...

#complex
1+2im

#strings
"""Contains "quote" characters"""
firstindex(str)
lastindex(str)

greet = "Hello"
whom = "world"
"$greet, $whom.\n" #inserts into string (called interoplation)

#regex
re = r"^\s*(?:#|$)"
typeof(re)

#functions
function f(x,y)
    x + y
end

f(x,y) = x + y

#passing function without parenthesis
g = f;
g(2,3)

#declare type ::TypeName
fib(n::Integer) = n ≤ 2 ? one(n) : fib(n-1) + fib(n-2)
#dispach different functions for different types
#correctness if some types give nonsense
#Clarity for documentation

#return is the same
function g(x,y)
    return x * y
    x + y #this will not be returend
end

#return type
function g(x, y)::Int8
    return x * y
end;

#return nothing convention
function printx(x)
    println("x = $x")
    return nothing
end

#Operators With Special Names
[A B C ...]	#hcat
[A; B; C; ...]	#vcat
[A B; C D; ...]	#hvcat
A'	#adjoint
A[i]	#getindex
A[i] = x	#setindex!
A.n	#getproperty
A.n = x	#setproperty!

#anonymous function
x -> x^2 + 2x - 1
#or
function (x)
    x^2 + 2x - 1
end
#useful for functions that have functions as arguments like map
map(x -> x^2 + 2x - 1, [1, 3, -1])

#multiple or no arguments
(x,y,z)->2x+y-z
()->3

#tuples are immutable
x = (0.0, "hello", 6*7)
x[2]
#named tuples
x = (a=2, b=1+2)
x[1]
x.a

#destructuring
(a,b,c) = 1:3
#same as a,b,c = 1:3

#return multiple values
function foo(a,b)
    a+b, a*b
end
#swap variables
y, x = x, y
# convention ignored variables
_, _, _, d = 1:10
#compose
X[1], (a,b) = (1, (2, 3))

#slurping
a, b... = "hello"
#argument destructuring
#this destructures the argument within an argument
minmax(x, y) = (y < x) ? (y, x) : (x, y)
gap((min, max)) = max - min
gap(minmax(10, 2))

#variable arguments
bar(a,b,x...) = (a,b,x)

#splat
x = (3, 4)
bar(1,2,x...)

#optional arguments
function Date(y::Int64, m::Int64=1, d::Int64=1)
    err = validargs(Date, y, m, d)
    err === nothing || throw(err)
    return Date(UTD(totaldays(y, m, d)))
end

#kwargs
function plot(x, y; style="solid", width=1, color="black")
    ###
end
# on call semicolon is optional
#explicit types
function f(;x::Int=1)
    ###
end

#variable number kwargs

function f(x; y=0, kwargs...)
    ###
end

#plot(x, y; :width => 2) is equivalent to plot(x, y, width=2)

#do statment defines anonymous function
map([A, B, C]) do x
    if x < 0 && iseven(x)
        return 0
    elseif x == 0
        return 1
    else
        return x
    end
end

#function composition
(sqrt ∘ +)(3, 6)
(sqrt ∘ sum)(1:10)

#vector function
A = [1.0, 2.0, 3.0]
sin.(A)

#convert everything to vectorions
@.

#Compound Expressions
z = begin
    x = 1
    y = 2
    x + y
end

z = (x = 1; y = 2; x + y)

#Conditional Evaluation
if x < y
    println("x is less than y")
elseif x > y
    println("x is greater than y")
else
    println("x is equal to y")
end
#if block also return last value
if x > 0
    "positive!"
else
    "negative..."
end
#error if 
if 1
    println("true")
end
#ternary operator for simple if 
condition ? true_result : false_result #watch out for spaces

#and or short-circuiting
&& ||

#loops
#while
i = 1;
while i <= 5
    println(i)
    global i += 1
end
#for
for i = 1:5
    println(i)
end

for i in [1,4,0]
    println(i)
end

for s ∈ ["foo","bar","baz"]
    println(s)
end

#break
while true
    println(i)
    if i >= 5
        break
    end
    global i += 1
end

for j = 1:1000
    println(j)
    if j >= 5
        break
    end
end

#continue
for i = 1:10
    if i % 3 != 0
        continue
    end
    println(i)
end

#nesting
for i = 1:2, j = 3:4
    println((i, j))
end

# 
for (j, k) in zip([1 2 3], [4 5 6 7])
    println((j,k))
end


#exceptions
#user defined
struct MyCustomException <: Exception end

#throw
f(x) = x>=0 ? exp(-x) : throw(DomainError(x, "argument must be nonnegative"))
f (generic function with 1 method)

#error
fussy_sqrt(x) = x >= 0 ? sqrt(x) : error("negative x not allowed")
fussy_sqrt (generic function with 1 method)

#try catch
try
    sqrt("ten")
catch e
    println("You should have entered a numeric value")
end

#finally always evaluated even if exception is encountered

f = open("file")
try
    # operate on file f
finally
    close(f)
end

#scope constructs  #scope type #allowed within
module, baremodule	#global	global
struct	local (soft)	#global
for, while, try	#local (soft) global, local
macro	local #(hard)	global
functions, do blocks, let blocks, comprehensions, generators	#local (hard)	global, local

#begin and if do not introduce new scopes!

#Each module introduces a new global scope

module A
    a = 1 # a global in A's scope
end;
module B
    module C
        c = 2
    end
    b = C.c    # can access the namespace of a nested global scope
                # through a qualified access
    import ..A # makes module A available
    d = A.a
end;

module D
    b = a # errors as D's global scope is separate from A's
end;


module E
    import ..A # make module A available
    A.a = 2    # throws below error
end;


#let blocks define new scopes
x, y, z = -1, -1, -1;
let x = 1, z
    println("x: $x, y: $y") # x is local variable, y the global
    println("z: $z") # errors as z has not been assigned yet but is local
end

#loops define new scopes
#constants useful in global scope for optimisation
const e  = 2.71828182845904523536;

#composite types struct
struct Foo
    bar
    baz::Int
    qux::Float64
end

foo = Foo("Hello, world.", 23, 1.5)
typeof(foo)
fieldnames(Foo)
#immutable!

#mutable
mutable struct Bar
    baz
    qux::Float64
end
bar = Bar("Hello", 1.5);
bar.qux = 2.0
bar.baz = 1//2


#parametric types
struct Point{T}
    x::T
    y::T
end

#methods
methods(f) #shows function signatures

#Function-like objects
struct Polynomial{R}
    coeffs::Vector{R}
end

function (p::Polynomial)(x)
    v = p.coeffs[end]
    for i = (length(p.coeffs)-1):-1:1
        v = v*x + p.coeffs[i]
    end
    return v
end

p = Polynomial([1,10,100])
p(3)

#empty generic function
function emptyfunc end

#constructors

struct Foo
    bar
    baz
end

foo = Foo(1, 2)
Foo(x) = Foo(x,x)

#inner constructor
struct OrderedPair
    x::Real
    y::Real
    OrderedPair(x,y) = x > y ? error("out of order") : new(x,y)
end

#interfaces
#iteration
iterate(iter) #Returns either a tuple of the first item and initial state or nothing if empty
iterate(iter, state) #Returns either a tuple of the next item and next state or nothing if no items remain

for item in iter   # or  "for item = iter"
    # body
end

struct Squares
    count::Int
end

Base.iterate(S::Squares, state=1) = state > S.count ? nothing : (state*state, state+1)

for item in Squares(7)
    println(item)
end


#indexing
getindex(X, i) #indexed element access
X[i]

setindex!(X, v, i)	#X[i] = v, indexed assignment
firstindex(X)	#The first index, used in X[begin]
lastindex(X)	#The last index, used in X[end]

#indexing
#brodcasting

a = rand(2,1); A = rand(2,3);
broadcast(+, a, A)

#I/O stream
write(stdout, "Hello World");
read(stdin, Char)
print(stdout, 0x61)
show()

#fieles 
f = open("hello.txt")
readlines(f)

#write
f = open("hello.txt","w")
write(f,"Hello again.")
close(f)

#multithreading
hreads.@threads for i = 1:10
    a[i] = Threads.threadid()
end

Julia: Start REPL