# Think Julia

# Tuples
本章将介绍另一种内置类型tuple，然后展示数组、字典和元组是如何一起工作的。我还介绍了可变长度参数数组的一个有用特性，即集合和分散操作符

## Tuples are immutable
元组是一个值序列。值可以是任何类型的，并且它们以整数为索引，因此在这方面元组很像数组。重要的区别在于元组是不可变的，并且每个元素都可以有自己的类型。

从语法上讲，元组是用逗号分隔的值列表
```julia
julia> t = 'a', 'b', 'c', 'd', 'e'
('a', 'b', 'c', 'd', 'e')
```
虽然没有必要，但通常用圆括号括起元组
```julia
julia> t = ('a', 'b', 'c', 'd', 'e')
('a', 'b', 'c', 'd', 'e')
```
要创建包含单个元素的元组，必须包含最后一个逗号
```julia
julia> t1 = ('a',)
('a',)
julia> typeof(t1)
Tuple{Char}
```
另一种创建元组的方法是内置函数元组。如果没有参数，它会创建一个空元组:

```julia
julia> tuple()
()
```
如果提供了多个参数，则结果是一个带有给定参数的元组:
```julia
julia> t3 = tuple(1, 'a', pi)
(1, 'a', π = 3.1415926535897...)
```
因为tuple是内置函数的名称，所以应该避免使用它作为变量名。

大多数数组操作符也适用于元组。方括号操作符对元素进行索引
```julia
julia> t = ('a', 'b', 'c', 'd', 'e');

julia> t[1]
'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
```
slice操作符选择一个元素范围

```julia
julia> t[2:4]
('b', 'c', 'd')
```
但是如果你试图修改元组的一个元素，你会得到一个错误:
```julia
julia> t[1] = 'A'
ERROR: MethodError: no method matching setindex!(::NTuple{5,Char}, ::Char, ::Int64)
```
因为元组是不可变的，所以不能修改元素。

关系操作符可用于元组和其他序列;Julia首先比较每个序列的第一个元素。如果它们相等，则继续查找下一个元素，以此类推，直到找到不同的元素。不考虑后续元素(即使它们真的很大)。
```julia
julia> (0, 1, 2) < (0, 3, 4)
true
julia> (0, 1, 2000000) < (0, 3, 4)
true
```
## Tuple Assignment
交换两个变量的值通常是有用的。在传统的赋值中，你必须使用一个临时变量。例如，交换a和b:
```julia
temp = a
a = b
b = temp
```
这个解决方案很麻烦;元组赋值更优雅:
```julia
a, b = b, a
```
左边是变量的元组;右边是表达式的元组。每个值都被赋给它各自的变量。右边的所有表达式都是在赋值之前求值的。

左边变量的数量必须小于右边值的数量:
```julia
julia> (a, b) = (1, 2, 3)
(1, 2, 3)
julia> a, b, c = 1, 2
ERROR: BoundsError: attempt to access (1, 2)
  at index [3]
```
更一般地说，右边可以是任何类型的序列(字符串、数组或元组)。例如，要将电子邮件地址分成用户名和域，你可以这样写:
```julia
julia> addr = "julius.caesar@rome"
"julius.caesar@rome"
julia> uname, domain = split(addr, '@');
```
split的返回值是一个包含两个元素的数组;第一个元素被分配给uname，第二个元素被分配给domain
```julia
julia> uname
"julius.caesar"
julia> domain
"rome"
```
## Tuples as Return Values
严格地说，一个函数只能返回一个值，但如果这个值是一个元组，其效果和返回多个值是一样的。例如，如果你想除两个整数并计算商和余数，先计算x÷y再计算x % y是无效的，最好同时计算这两个数。

内置函数divrem接受两个参数，并返回一个由两个值组成的元组，商和余数。您可以将结果存储为一个元组
```julia
julia> t = divrem(7, 3)
(2, 1)
```
或者使用元组赋值来分别存储元素
```julia
julia> q, r = divrem(7, 3);

julia> @show q r;
q = 2
r = 1
```
下面是一个返回元组的函数示例
```julia
function minmax(t)
    minimum(t), maximum(t)
end
```
maximum和minimum是内置函数，用于查找序列中最大和最小的元素。minmax同时计算并返回一个由两个值组成的元组。内置函数极值更有效。

## Variable-length Argument Tuples
函数可以接受可变数量的参数。以…结尾的参数名。将参数收集到一个元组中。例如，printall接受任意数量的参数并打印它们:
```julia
function printall(args...)
    println(args)
end
```
gather参数可以有任何您喜欢的名称，但args是传统的。下面是这个函数的工作原理:
```julia
julia> printall(1, 2.0, '3')
(1, 2.0, '3')
```
集合的补码是分散的。如果你有一个值序列，你想把它作为多个参数传递给一个函数，你可以使用…操作符。例如，divrem只接受两个参数;它不能用于元组
```julia
julia> t = (7, 3);

julia> divrem(t)
ERROR: MethodError: no method matching divrem(::Tuple{Int64,Int64})
```
但如果你分散元组，它是有效的
```julia
julia> divrem(t...)
(2, 1)
```
许多内置函数使用可变长度参数元组。例如，max和min可以接受任意数量的参数:
```julia
julia> max(1, 2, 3)
3
```
但是sum却没有:
```julia
julia> sum(1, 2, 3)
ERROR: MethodError: no method matching sum(::Int64, ::Int64, ::Int64)
```
## Arrays and Tuples
zip是一个内置函数，它接受两个或多个序列并返回一个元组集合，其中每个元组包含来自每个序列的一个元素。函数的名称指的是一个拉链，它连接并交错两排齿。

这个例子压缩了一个字符串和一个数组:
```julia
julia> s = "abc";

julia> t = [1, 2, 3];

julia> zip(s, t)
Base.Iterators.Zip{Tuple{String,Array{Int64,1}}}(("abc", [1, 2, 3]))
```
结果是一个知道如何遍历这些对的zip对象。zip最常见的用法是在for循环中:
```julia
julia> for pair in zip(s, t)
           println(pair)
       end
('a', 1)
('b', 2)
('c', 3)
```
zip对象是一种迭代器，它是遍历序列的任何对象。迭代器在某些方面类似于数组，但与数组不同的是，不能使用索引从迭代器中选择元素。

如果你想使用数组操作符和函数，你可以使用zip对象来创建数组:
```julia
julia> collect(zip(s, t))
3-element Array{Tuple{Char,Int64},1}:
 ('a', 1)
 ('b', 2)
 ('c', 3)
```
 结果是一个元组数组;在本例中，每个元组包含字符串中的一个字符和数组中的相应元素。

如果序列的长度不相同，则结果为较短序列的长度。
```julia
julia> collect(zip("Anne", "Elk"))
3-element Array{Tuple{Char,Char},1}:
 ('A', 'E')
 ('n', 'l')
 ('n', 'k')
```
你可以在for循环中使用元组赋值来遍历一个元组数组:
```julia
julia> t = [('a', 1), ('b', 2), ('c', 3)];

julia> for (letter, number) in t
           println(number, " ", letter)
       end
1 a
2 b
3 c
```
每次循环中，Julia都会选择数组中的下一个元组，并将元素指定为字母和数字。括号(字母，数字)是必须的。

如果将zip、for和tuple赋值组合在一起，就会得到一个用于同时遍历两个(或多个)序列的有用习惯用法。例如，hasmatch接受两个序列t1和t2，如果有一个索引i使t1[i] == t2[i]，则返回true:
```julia
function hasmatch(t1, t2)
    for (x, y) in zip(t1, t2)
        if x == y
            return true
        end
    end
    false
end
```
如果需要遍历序列的元素及其下标，可以使用内置函数enumerate:
```julia
julia> for (index, element) in enumerate("abc")
           println(index, " ", element)
       end
1 a
2 b
3 c
```
enumerate的结果是一个enumerate对象，它迭代一个对序列;每一对包含一个索引(从1开始)和一个来自给定序列的元素。

## Dictionaries and Tuples
字典可以作为迭代器来迭代键-值对。你可以像这样在for循环中使用它:
```julia
julia> d = Dict('a'=>1, 'b'=>2, 'c'=>3);

julia> for (key, value) in d
           println(key, " ", value)
       end
a 1
c 3
b 2
```
正如您从字典中所期望的那样，这些项并没有特定的顺序。

反过来，你可以使用一个元组数组来初始化一个新的字典:
```julia
julia> t = [('a', 1), ('c', 3), ('b', 2)];

julia> d = Dict(t)
Dict{Char,Int64} with 3 entries:
  'a' => 1
  'c' => 3
  'b' => 2
```
在字典中使用元组作为键是很常见的。例如，电话目录可以从姓、名对映射到电话号码。假设我们已经定义了last, first和number，我们可以这样写:
```julia
directory[last, first] = number
```
括号中的表达式是一个元组。我们可以使用元组赋值来遍历这个字典。
```julia
for ((last, first), number) in directory
    println(first, " ", last, " ", number)
end
```
这个循环遍历目录中的键值对，它们是元组。它将每个元组中的键元素分配给last和first，将值分配给number，然后打印名称和相应的电话号码

## Sequences of Sequences
我已经把重点放在了元组的数组上，但是这一章中几乎所有的例子都与数组的数组、元组的元组和数组的元组有关。为了避免列举可能的组合，有时讨论序列的序列会更容易一些。

在许多上下文中，不同种类的序列(字符串、数组和元组)可以互换使用。那么你应该如何选择其中一个呢?

首先，比较明显的是，字符串比其他序列受到更多的限制，因为元素必须是字符。它们也是不可变的。如果需要更改字符串中的字符(而不是创建新字符串)，则可能需要使用字符数组。

数组比元组更常见，主要是因为它们是可变的。但在一些情况下，你可能更喜欢元组:

在某些上下文中，比如return语句，创建元组比创建数组在语法上更简单。

如果将序列作为参数传递给函数，则使用元组可以减少由于别名而导致意外行为的可能性。

由于性能的原因。编译器可以专门化该类型。

因为元组是不可变的，所以它们不提供sort!和反向!，它修改现有的数组。但是Julia提供了内置函数sort，该函数接受一个数组并以已排序的顺序返回一个具有相同元素的新数组，而reverse函数接受任何序列并以相反的顺序返回相同类型的序列。


