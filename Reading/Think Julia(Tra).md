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

# Files
本章介绍将数据保存在永久存储中的“持久”程序的思想，并展示如何使用不同类型的永久存储，如文件和数据库。

## persistence
到目前为止，我们看到的大多数程序都是短暂的，因为它们运行很短的时间并产生一些输出，但是当它们结束时，它们的数据就消失了。如果您再次运行该程序，它将以全新的方式开始。

其他程序是持久的:它们运行很长时间(或一直运行);他们至少将部分数据保存在永久存储中(比如硬盘);如果它们关闭并重新启动，它们就会重新开始。

持久性程序的例子包括操作系统和web服务器，它们几乎在电脑开机时就运行，一直在运行，等待网络上的请求。

程序维护数据的最简单方法之一是读写文本文件。我们已经见过读取文本文件的程序;在本章中，我们将看到编写它们的程序。

另一种方法是将程序的状态存储在数据库中。在本章中，我还将介绍如何使用一个简单的数据库。
## Reading and writing
文本文件是存储在硬盘驱动器或闪存等永久介质上的字符序列。我们看到了如何在阅读单词列表中打开和读取文件。

要写一个文件，你必须以模式“w”作为第二个参数打开它:
```julia
julia> fout = open("output.txt", "w")
IOStream(<file output.txt>)
```
如果文件已经存在，以写模式打开它会清除旧的数据并重新开始，所以要小心!如果该文件不存在，则创建一个新的文件。open函数返回一个file对象，而write函数将数据放入文件中。
```julia
julia> line1 = "This here's the wattle,\n";

julia> write(fout, line1)
24
```
返回值是写入的字符数。file对象跟踪它的位置，因此如果再次调用write，它会将新数据添加到文件的末尾。
```julia
julia> line2 = "the emblem of our land.\n";

julia> write(fout, line2)
24
```
当你写完之后，你应该关闭文件。
```julia
julia> close(fout)
```
如果你不关闭文件，它会在程序结束时为你关闭。

## Formatting
write的参数必须是一个字符串，所以如果我们想在一个文件中放入其他值，我们必须将它们转换为字符串。最简单的方法是使用`string`或字符串插值:
```julia
julia> fout = open("output.txt", "w")
IOStream(<file output.txt>)
julia> write(fout, string(150))
3
```
另一种选择是使用print(ln)函数族。
```julia
julia> camels = 42
42
julia> println(fout, "I have spotted $camels camels.")
```
## Filenames and Paths
文件被组织成目录(也称为“文件夹”)。每个运行的程序都有一个“当前目录”，这是大多数操作的默认目录。例如，当您打开一个文件进行读取时，Julia会在当前目录中查找它。

pwd函数返回当前目录的名称:
```julia
julia> cwd = pwd()
"/home/ben"
```
cwd代表“当前工作目录”。本例中的结果是/home/ben，这是一个名为ben的用户的主目录。
像“/home/ben”这样标识文件或目录的字符串称为路径。

像memo.txt这样的简单文件名也被认为是一个路径，但它是一个相对路径，因为它与当前目录相关。如果当前目录为“/home/ben”，文件名“memo.txt”将指向“/home/ben/memo.txt”

以/开头的路径不依赖于当前目录;它被称为绝对路径。要找到文件的绝对路径，你可以使用abspath:

```julia
julia> abspath("memo.txt")
"/home/ben/memo.txt"
```
Julia提供了其他用于处理文件名和路径的函数。例如，ispath检查一个文件或目录是否存在:
```julia
julia> ispath("memo.txt")
true
```

如果它存在，isdir会检查它是否是一个目录:
```julia
julia> isdir("memo.txt")
false
julia> isdir("/home/ben")
true
```
类似地，`isfile`检查它是否是一个文件。

`readdir`返回给定目录中的文件(和其他目录)的数组:

```julia
julia> readdir(cwd)
3-element Array{String,1}:
 "memo.txt"
 "music"
 "photos"
 ```
 为了演示这些函数，下面的示例“遍历”一个目录，打印所有文件的名称，并在所有目录上递归地调用自己。
 ```julia
 function walk(dirname)
    for name in readdir(dirname)
        path = joinpath(dirname, name)
        if isfile(path)
            println(path)
        else
            walk(path)
        end
    end
end
```
joinpath接受目录和文件名，并将它们连接到一个完整的路径中。
## Catching Exceptions
当您尝试读写文件时，许多事情都可能出错。如果你试图打开一个不存在的文件，你会得到一个SystemError:
```julia
julia> fin = open("bad_file")
ERROR: SystemError: opening file "bad_file": No such file or directory
```
如果你没有权限访问文件:
```julia
julia> fout = open("/etc/passwd", "w")
ERROR: SystemError: opening file "/etc/passwd": Permission denied
```
为了避免这些错误，您可以使用像ispath和isfile这样的函数，但是检查所有的可能性将花费大量的时间和代码。

继续尝试(并在出现问题时处理问题)更容易，这正是try语句所做的。语法类似于if语句:
```julia
try
    fin = open("bad_file.txt")
catch exc
    println("Something went wrong: $exc")
end
```
Julia首先执行try子句。如果一切顺利，它将跳过catch子句并继续执行。如果发生异常，它将跳出try子句并运行catch子句。

用try语句处理异常被称为捕获异常。在本例中，except子句打印一条错误消息，这不是很有帮助。通常，捕获异常使您有机会修复问题，或再次尝试，或至少优雅地结束程序。

在执行状态更改或使用文件等资源的代码中，通常在代码完成时需要完成清理工作(如关闭文件)。异常可能会使该任务复杂化，因为它们可能导致代码块在到达正常结束之前退出。finally关键字提供了一种在给定代码块退出时运行代码的方法，不管它是如何退出的:
```julia
f = open("output.txt")
try
    line = readline(f)
    println(line)
finally
    close(f)
end
```
函数close将始终被执行。
## Databases
数据库是为存储数据而组织起来的文件。许多数据库就像字典一样组织，它们从键映射到值。数据库和字典的最大区别在于数据库在磁盘(或其他永久存储)上，所以它在程序结束后仍然存在。

ThinkJulia提供了一个接口到GDBM (GNU dbm)创建和更新数据库文件。作为示例，我将创建一个包含图像文件标题的数据库。

打开数据库类似于打开其他文件:
```julia
julia> using ThinkJulia

julia> db = DBM("captions", "c")
DBM(<captions>)
```
模式“c”意味着如果数据库还不存在，就应该创建它。结果是一个数据库对象，可以像字典一样使用(对于大多数操作)。

当你创建一个新的项目，GDBM更新数据库文件:
```julia
julia> db["cleese.png"] = "Photo of John Cleese."
"Photo of John Cleese."
```
当你访问其中一个条目时，GDBM读取文件:
```julia
julia> db["cleese.png"]
"Photo of John Cleese."
```
如果你对一个已经存在的键进行另一个赋值，GDBM会替换旧的值:
```julia
julia> db["cleese.png"] = "Photo of John Cleese doing a silly walk."
"Photo of John Cleese doing a silly walk."
julia> db["cleese.png"]
"Photo of John Cleese doing a silly walk."
```
有些函数以字典作为参数，如键和值，不能使用数据库对象。但是使用for循环进行迭代是可行的:
```julia
for (key, value) in db
    println(key, ": ", value)
end
```
和其他文件一样，你应该在完成后关闭数据库:
```julia
julia> close(db)
```
## Serialization
GDBM的一个限制是键和值必须是字符串或字节数组。如果尝试使用任何其他类型，则会得到一个错误。

序列化和反序列化函数可以提供帮助。它们将几乎所有类型的对象转换为适合存储在数据库中的字节数组(iobuffer)，然后再将字节数组转换回对象:
```julia
julia> using Serialization

julia> io = IOBuffer();

julia> t = [1, 2, 3];

julia> serialize(io, t)
24
julia> print(take!(io))
UInt8[0x37, 0x4a, 0x4c, 0x07, 0x04, 0x00, 0x00, 0x00, 0x15, 0x00, 0x08, 0xe2, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
```
它的格式对人类读者来说并不明显;这是为了让Julia容易理解。反序列化重新构造对象:
```julia
julia> io = IOBuffer();

julia> t1 = [1, 2, 3];

julia> serialize(io, t1)
24
julia> s = take!(io);

julia> t2 = deserialize(IOBuffer(s));

julia> print(t2)
[1, 2, 3]
```
序列化和反序列化对表示内存I/O流的iobuffer对象的读写操作。函数把!以字节数组的形式获取iobuffer的内容，并将iobuffer重置为初始状态。

虽然新对象的值与旧对象相同，但(通常)它不是同一个对象:
```julia
julia> t1 == t2
true
julia> t1 ≡ t2
false
```
换句话说，序列化和反序列化与复制对象具有相同的效果。

您可以使用它在数据库中存储非字符串。

## Command Objects
大多数操作系统都提供命令行界面，也称为shell。shell通常提供导航文件系统和启动应用程序的命令。例如，在Unix中，您可以用cd更改目录，用ls显示目录的内容，并通过键入(例如)firefox启动web浏览器。

任何你可以从shell启动的程序也可以使用command对象从Julia启动:
```julia
julia> cmd = `echo hello`
`echo hello`
```
反引号用于分隔命令。

函数run执行以下命令:
```julia
julia> run(cmd);
hello
```
hello是echo命令的输出，发送到标准输出。run函数本身返回一个process对象，并在外部命令成功运行失败时抛出一个errorrexception。

如果你想读取外部命令的输出，可以使用read:
```julia
julia> a = read(cmd, String)
"hello\n"
```
例如，大多数Unix系统提供一个称为md5sum或md5的命令，它读取文件的内容并计算“校验和”。你可以在https://en.wikipedia.org/wiki/Md5上了解MD5。这个命令提供了一种有效的方法来检查两个文件是否有相同的内容。不同内容产生相同校验和的概率非常小(也就是说，在宇宙坍缩之前不太可能发生)。

你可以使用command对象从Julia运行md5并得到结果:
```julia
julia> filename = "output.txt"
"output.txt"
julia> cmd = `md5 $filename`
`md5 output.txt`
julia> res = read(cmd, String)
"MD5 (output.txt) = d41d8cd98f00b204e9800998ecf8427e\n"
```
## Modules
假设您有一个名为“wc.jl"，代码如下:
```julia
function linecount(filename)
    count = 0
    for line in eachline(filename)
        count += 1
    end
    count
end

print(linecount("wc.jl"))
```
如果运行这个程序，它将读取自身并输出文件中的行数，即9行。你也可以像这样在REPL中包含它:
```julia
julia> include("wc.jl")
9
```
Julia引入了一些模块来创建单独的变量工作区，即新的全局作用域。

模块以关键字module开始，以end结束。在您自己的顶级定义和其他人代码中的定义之间可以避免命名冲突。import允许控制来自其他模块的哪些名称是可见的，而export指定了你的哪些名称是公共的，也就是说，可以在模块外部使用，而不带模块名称的前缀。
```julia
module LineCount
    export linecount

    function linecount(filename)
        count = 0
        for line in eachline(filename)
            count += 1
        end
        count
    end
end
```
模块LineCount对象提供了LineCount:
```julia
julia> using LineCount

julia> linecount("wc.jl")
11
```
# Structs and Objects

现在，您已经知道如何使用函数来组织代码，如何使用内置类型来组织数据。下一步是学习如何构建自己的类型来组织代码和数据。这是一个很大的话题;这需要几章的时间。

## Composite Types
我们已经使用了Julia的许多内置类型;现在我们将定义一个新类型。作为示例，我们将创建一个名为Point的类型，它表示二维空间中的一个点。

在数学符号中，点通常写在括号中，用逗号分隔坐标。例如，(0,0)表示原点，(x,y)表示原点向右x个单位和向上y个单位的点。

我们可以用几种方法来代表茱莉亚的观点:

我们可以把坐标分别存储在两个变量x和y中。

我们可以将坐标作为元素存储在数组或元组中。

我们可以创建一个新类型来将点表示为对象。

创建新类型比其他选项更复杂，但它的优势很快就会显现出来。

程序员定义的复合类型也称为结构体。点的结构定义如下:
```julia
struct Point
    x
    y
end
```
标头指示新结构称为Point。主体定义了结构的属性或字段。Point结构体有两个字段:x和y。

结构体就像创建对象的工厂。要创建一个点，可以调用point，就像它是一个函数，将字段的值作为参数一样。当Point用作函数时，它被称为构造函数。
```julia
julia> p = Point(3.0, 4.0)
Point(3.0, 4.0)
```
返回值是一个Point对象的引用，我们将它赋值给p。

创建一个新的对象被称为实例化，这个对象就是该类型的一个实例。

当您打印一个实例时，Julia会告诉您它属于什么类型以及属性的值是什么。

每个对象都是某种类型的实例，因此“对象”和“实例”是可以互换的。但在本章中，我使用“实例”来表示我正在讨论的是程序员定义的类型。

## Structs are Immutable
您可以使用`.`符号:
```julia
julia> x = p.x
3.0
julia> p.y
4.0
```
表达式p.x的意思是“到p所指向的对象并获取x的值”。在这个例子中，我们将该值分配给一个名为x的变量。变量x和字段x之间没有冲突。

可以在任何表达式中使用点表示法。例如:
```julia
julia> distance = sqrt(p.x^2 + p.y^2)
5.0
```
然而，结构体在默认情况下是不可变的，在构造后字段不能改变值:
```julia
julia> p.y = 1.0
ERROR: setfield! immutable struct of type Point cannot be changed
```
乍一看，这似乎有些奇怪，但它有几个优点:

这样会更有效率。

不能违反类型构造函数提供的不变量(请参阅构造函数)。

使用不可变对象的代码更容易推理。

## Mutable Structs
在需要的地方，可变复合类型可以用关键字`mutable struct`声明。可变点的定义如下:

```julia
mutable struct MPoint
    x
    y
end
```
你可以使用点符号给可变结构的一个实例赋值:
```julia
julia> blank = MPoint(0.0, 0.0)
MPoint(0.0, 0.0)
julia> blank.x = 3.0
3.0
julia> blank.y = 4.0
4.0
```
## Rectangles
有时一个对象的字段应该是什么是很明显的，但其他时候你必须做出决定。例如，假设您正在设计一个类型来表示矩形。您将使用哪些字段来指定矩形的位置和大小?你可以忽略角度;为了简单起见，假设矩形要么是垂直的，要么是水平的。

至少有两种可能:

您可以指定矩形的一个角(或中心)、宽度和高度。

你可以指定两个相反的角。

在这一点上很难说哪一个比另一个更好，所以我们将实现第一个，只是作为一个例子。
```julia
"""
Represents a rectangle.

fields: width, height, corner.
"""
struct Rectangle
    width
    height
    corner
end
```
文档字符串列出字段:宽度和高度是数字;corner是指定左下角的Point对象。

为了表示一个矩形，你必须实例化一个矩形对象:
```julia
julia> origin = MPoint(0.0, 0.0)
MPoint(0.0, 0.0)
julia> box = Rectangle(100.0, 200.0, origin)
Rectangle(100.0, 200.0, MPoint(0.0, 0.0))
```
## Instances as Arguments
你可以用通常的方式传递一个实例作为参数。例如:
```julia
function printpoint(p)
    println("($(p.x), $(p.y))")
end
```
printpoint以一个点作为参数并以数学符号显示它。要调用它，你可以传递p作为参数:
```julia
julia> printpoint(blank)
(3.0, 4.0)
```
## Instances as Return Values
函数可以返回实例。例如，findcenter以一个矩形作为参数，并返回一个包含矩形中心坐标的点:
```julia
function findcenter(rect)
    Point(rect.corner.x + rect.width / 2, rect.corner.y + rect.height / 2)
end
```
rect.corner的表达式。x表示:“转到矩形所指的对象，选择名为corner的字段;然后转到该对象并选择名为x的字段。”

下面是一个传递box作为参数并将结果点赋值到中心的例子:
```julia
julia> center = findcenter(box)
Point(51.0, 102.0)
```
## Copying
混叠可能会使程序难以阅读，因为在一个地方的更改可能会在另一个地方产生意想不到的影响。跟踪所有可能引用给定对象的变量是很困难的。

复制对象通常是替代混叠的一种方法。Julia提供了一个名为deepcopy的函数，可以复制任何对象:
```julia
julia> p1 = MPoint(3.0, 4.0)
MPoint(3.0, 4.0)
julia> p2 = deepcopy(p1)
MPoint(3.0, 4.0)
julia> p1 ≡ p2
false
julia> p1 == p2
false
```
≡运算符表明p1和p2不是同一个对象，这正是我们所期望的。但您可能期望==为真，因为这些点包含相同的数据。在这种情况下，你会失望地发现，对于可变对象，==操作符的默认行为与===操作符相同;它检查对象标识，而不是对象等价。这是因为对于可变复合类型，Julia不知道什么是等效的。至少，现在还没有。

# Structs and Functions
现在我们知道了如何创建新的复合类型，下一步是编写函数，将程序员定义的对象作为参数并返回它们作为结果。在本章中，我还介绍了“函数式编程风格”和两个新的程序开发计划。
## Time
作为复合类型的另一个例子，我们将定义一个名为MyTime的结构体，它记录一天中的时间。结构体的定义是这样的:
```julia
"""
Represents the time of day.

fields: hour, minute, second
"""
struct MyTime
    hour
    minute
    second
end
```
在Julia中已经使用了名字时间，为了避免名字冲突，我选择了`MyTime`。我们可以创建一个新的MyTime对象:
```julia
julia> time = MyTime(11, 59, 30)
MyTime(11, 59, 30)
```
## Pure Functions
在接下来的几节中，我们将编写两个添加时间值的函数。它们演示了两种函数:纯函数和修饰符。它们还展示了一个开发计划，我将其称为原型和补丁，这是一种解决复杂问题的方法，即从简单的原型开始，逐步处理复杂问题。

下面是一个简单的addtime原型:
```julia
function addtime(t1, t2)
    MyTime(t1.hour + t2.hour, t1.minute + t2.minute, t1.second + t2.second)
end
```
该函数创建一个新的MyTime对象，初始化它的字段，并返回对新对象的引用。这被称为纯函数，因为它不修改作为参数传递给它的任何对象，而且它没有任何效果，比如显示值或获取用户输入，而只是返回一个值。

为了测试这个函数，我将创建两个MyTime对象:start包含电影的开始时间，如Monty Python和Holy Grail, duration包含电影的运行时间，即1小时35分钟。

addtime计算电影何时完成。
```julia
julia> start = MyTime(9, 45, 0);

julia> duration = MyTime(1, 35, 0);

julia> done = addtime(start, duration);

julia> printtime(done)
10:80:00
```
结果，10:80:00可能不是你所希望的。问题是这个函数不处理秒数或分钟数加起来超过60的情况。当这种情况发生时，我们必须把额外的秒“带入”分钟栏，或者把额外的分钟“带入”小时栏。这是一个改进的版本:
```julia
function addtime(t1, t2)
    second = t1.second + t2.second
    minute = t1.minute + t2.minute
    hour = t1.hour + t2.hour
    if second >= 60
        second -= 60
        minute += 1
    end
    if minute >= 60
        minute -= 60
        hour += 1
    end
    MyTime(hour, minute, second)
end
```
虽然这个函数是正确的，但它开始变大了。稍后我们将看到一个较短的替代方案。
## Modifiers
有时，函数可以将获取的对象修改为参数。在这种情况下，更改对调用者是可见的。以这种方式工作的函数称为修饰符。

增量!，它向MyTime对象添加给定的秒数，可以作为修饰符自然地编写。以下是一个初稿:
```julia
function increment!(time, seconds)
    time.second += seconds
    if time.second >= 60
        time.second -= 60
        time.minute += 1
    end
    if time.minute >= 60
        time.minute -= 60
        time.hour += 1
    end
end
```
第一行执行基本操作;余数处理我们之前见过的特殊情况。

这个函数正确吗?如果秒远大于60秒会怎样?

在这种情况下，携带一次是不够的;我们必须一直这样做，直到时间到来。二是小于六十。一种解决方案是用while语句替换if语句。这将使函数正确，但不是很有效。
## Prototyping Versus Planning
我正在演示的开发计划叫做“原型和补丁”。对于每个函数，我都编写了一个原型，执行基本的计算，然后测试它，一路修补错误。

这种方法是有效的，特别是在您还没有深入了解问题的情况下。但是，增量修正可能会生成不必要的复杂代码(因为它处理许多特殊情况)和不可靠的代码(因为很难知道您是否已经找到了所有的错误)。

另一种选择是设计开发，在设计开发中，对问题的高层次了解可以使编程变得更容易。在这种情况下，时间对象实际上是一个以60为基数的三位数(参见https://en.wikipedia.org/wiki/Sexagesimal)!第二个属性是“一列”，分钟属性是“六十列”，小时属性是“三百六十列”。

当我们写addtime和increment!我们实际上是在以60为底做加法，这就是为什么我们必须从一列进到下一列。

这个观察结果提出了解决整个问题的另一种方法——我们可以将MyTime对象转换为整数，并利用计算机知道如何进行整数运算这一事实。

下面是一个将mytimes转换为整数的函数:
```julia
function timetoint(time)
    minutes = time.hour * 60 + time.minute
    seconds = minutes * 60 + time.second
end
```
下面是一个将整数转换为MyTime的函数(回想一下，divrem将第一个参数除以第二个，并以元组的形式返回商和余数):
```julia
function inttotime(seconds)
    (minutes, second) = divrem(seconds, 60)
    hour, minute = divrem(minutes, 60)
    MyTime(hour, minute, second)
end
```
您可能需要考虑一下，并运行一些测试，以说服自己这些函数是正确的。测试它们的一种方法是对x的多个值检查timetoint(inttotime(x)) == x。这是一致性检查的一个例子。

一旦你确信它们是正确的，你就可以用它们重写addtime:
```julia
function addtime(t1, t2)
    seconds = timetoint(t1) + timetoint(t2)
    inttotime(seconds)
end
```
这个版本比原始版本短，也更容易验证。

## Multiple Dispatch
在Julia中，您可以编写可以操作不同类型的代码。这被称为泛型编程。

在这一章中，我将讨论Julia中类型声明的使用，并介绍方法，这些方法是根据函数参数的类型实现函数的不同行为的方法。这称为多分派。
## Type Declarations
`::`运算符将类型注释附加到表达式和变量上:

```julia
julia> (1 + 2) :: Float64
ERROR: TypeError: in typeassert, expected Float64, got Int64
julia> (1 + 2) :: Int64
3
```
这有助于确认您的程序以您期望的方式工作。

`::`操作符也可以追加到赋值操作的左侧，或者作为声明的一部分。
```julia
julia> function returnfloat()
           x::Float64 = 100
           x
       end
returnfloat (generic function with 1 method)
julia> x = returnfloat()
100.0
julia> typeof(x)
Float64
```
变量x的类型总是Float64，如果需要，该值会被转换为浮点数。

类型注释也可以附加到函数定义的头文件中:
```julia
function sinc(x)::Float64
    if x == 0
        return 1
    end
    sin(x)/(x)
end
```
sinc的返回值总是被转换为Float64类型。

当省略类型时，Julia中的默认行为是允许值为任何类型(any)。
## Methods
在结构体和函数中，我们定义了一个名为MyTime的结构体，而在Time中，我们编写了一个名为printtime的函数:
```julia
using Printf

struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64
end

function printtime(time)
    @printf("%02d:%02d:%02d", time.hour, time.minute, time.second)
end
```
如您所见，出于性能考虑，类型声明可以也应该添加到结构定义中的字段中。

要调用这个函数，你必须传递一个MyTime对象作为参数:
```julia
julia> start = MyTime(9, 45, 0)
MyTime(9, 45, 0)
julia> printtime(start)
09:45:00
```
要向printtime函数添加一个只接受`MyTime`对象作为实参的方法，只需在函数定义中的实参time后面加上`::`和`MyTime`:
```julia
function printtime(time::MyTime)
    @printf("%02d:%02d:%02d", time.hour, time.minute, time.second)
end
```
方法是带有特定签名的函数定义:printtime有一个MyTime类型的参数。

使用MyTime对象调用printtime函数会产生相同的结果:
```julia
julia> printtime(start)
09:45:00
```
现在我们可以重新定义不带::type注释的第一个方法，允许任何类型的参数:
```julia
function printtime(time)
    println("I don't know how to print the argument time.")
end
```
如果你用一个不同于MyTime的对象来调用printtime函数，你会得到:
```julia
julia> printtime(150)
I don't know how to print the argument time.
```
## Additional Examples
以下是为指定参数而重写的increment(来自修饰符)版本:
```julia
function increment(time::MyTime, seconds::Int64)
    seconds += timetoint(time)
    inttotime(seconds)
end
```
注意，现在它是一个纯函数，而不是修饰符。

下面是如何调用increment:
```julia
julia> start = MyTime(9, 45, 0)
MyTime(9, 45, 0)
julia> increment(start, 1337)
MyTime(10, 7, 17)
```
如果参数的顺序不对，就会出现错误
```julia
julia> increment(1337, start)
ERROR: MethodError: no method matching increment(::Int64, ::MyTime)
```
该方法的签名是increment(time::MyTime, seconds::Int64)，而不是increment(seconds::Int64, time::MyTime)。

重写isafter以只对MyTime对象起作用也很容易
```julia
function isafter(t1::MyTime, t2::MyTime)
    (t1.hour, t1.minute, t1.second) > (t2.hour, t2.minute, t2.second)
end
```
顺便说一下，可选参数被实现为多个方法定义的语法。例如，这个定义:
```julia
function f(a=1, b=2)
    a + 2b
end
```
翻译成以下三种方法:
```julia
f(a, b) = a + 2b
f(a) = f(a, 2)
f() = f(1, 2)
```
这些表达式是有效的Julia方法定义。这是定义函数/方法的速记符号。

## Constructors
构造函数是用来创建对象的特殊函数。MyTime的默认构造函数方法有以下签名:
```julia
MyTime(hour, minute, second)
MyTime(hour::Int64, minute::Int64, second::Int64)
```
我们也可以添加自己的外部构造函数方法:
```julia
function MyTime(time::MyTime)
    MyTime(time.hour, time.minute, time.second)
end
```
这个方法被称为复制构造函数，因为新的MyTime对象是它的参数的副本。

为了强制不变量，我们需要内部构造函数方法
```julia
struct MyTime
    hour :: Int64
    minute :: Int64
    second :: Int64
    function MyTime(hour::Int64=0, minute::Int64=0, second::Int64=0)
        @assert(0 ≤ minute < 60, "Minute is not between 0 and 60.")
        @assert(0 ≤ second < 60, "Second is not between 0 and 60.")
        new(hour, minute, second)
    end
end
```
结构MyTime现在有4个内部构造函数方法:
```julia
MyTime()
MyTime(hour::Int64)
MyTime(hour::Int64, minute::Int64)
MyTime(hour::Int64, minute::Int64, second::Int64)
```
内部构造函数方法总是在类型声明块中定义，它可以访问名为new的特殊函数，该函数创建新声明类型的对象。
第二个没有局部函数new参数的方法存在:
```julia
mutable struct MyTime
    hour :: Int
    minute :: Int
    second :: Int
    function MyTime(hour::Int64=0, minute::Int64=0, second::Int64=0)
        @assert(0 ≤ minute < 60, "Minute is between 0 and 60.")
        @assert(0 ≤ second < 60, "Second is between 0 and 60.")
        time = new()
        time.hour = hour
        time.minute = minute
        time.second = second
        time
    end
end
```
这允许构造递归的数据结构，即一个结构，其中一个字段是结构本身。在这种情况下，结构必须是可变的，因为它的字段在实例化后被修改。

## `show`
`show`是一个特殊的函数，它返回对象的字符串表示形式。例如，下面是MyTime对象的show方法
```julia
using Printf

function Base.show(io::IO, time::MyTime)
    @printf(io, "%02d:%02d:%02d", time.hour, time.minute, time.second)
end
```
前缀Base是必需的，因为我们想要向Base中添加一个新方法。显示功能。

当打印一个对象时，Julia调用show函数:
```julia
julia> time = MyTime(9, 45)
09:45:00
```
当我编写新的复合类型时，我几乎总是从编写外部构造函数开始，这使得更容易实例化对象和显示对象，这对调试很有用。

## Operator Overloading
通过定义操作符方法，可以在程序员定义的类型上指定操作符的行为。例如，如果定义了一个名为+的方法，并带有两个MyTime参数，则可以在MyTime对象上使用+操作符。

定义可能是这样的
```julia
import Base.+

function +(t1::MyTime, t2::MyTime)
    seconds = timetoint(t1) + timetoint(t2)
    inttotime(seconds)
end
```
import语句将+操作符添加到局部作用域，以便可以添加方法。

你可以这样使用它
```julia
julia> start = MyTime(9, 45)
09:45:00
julia> duration = MyTime(1, 35, 0)
01:35:00
julia> start + duration
11:20:00
```
当您将+操作符应用到MyTime对象时，Julia调用新添加的方法。当REPL显示结果时，Julia调用show。所以在幕后发生了很多事情!

添加操作符的行为以使其与程序员定义的类型一起工作称为操作符重载。
## Multiple Dispatch
在上一节中，我们添加了两个MyTime对象，但您可能还想向MyTime对象添加一个整数:
```julia
function +(time::MyTime, seconds::Int64)
    increment(time, seconds)
end
```
下面是一个使用+操作符和MyTime对象和整数的示例
```julia
julia> start = MyTime(9, 45)
09:45:00
julia> start + 1337
10:07:17
```
加法是一个交换算子，所以我们必须添加另一种方法。
```julia
function +(seconds::Int64, time::MyTime)
  time + seconds
end
```
我们得到了相同的结果
```julia
julia> 1337 + start
10:07:17
```
在应用函数时选择执行哪个方法称为dispatch。Julia允许调度进程根据给定参数的数量和函数所有参数的类型来选择调用函数的哪一个方法。使用函数的所有参数来选择应该调用哪个方法称为多重派发。

## Generic Programming
在必要时，多重分派是有用的，但(幸运的是)它并不总是必要的。通常，您可以通过编写正确处理不同类型实参的函数来避免这种情况。

我们为字符串编写的许多函数也适用于其他序列类型。例如，在Dictionary作为计数器的集合中，我们使用histgram来计算每个字母在一个单词中出现的次数。
```julia
function histogram(s)
    d = Dict()
    for c in s
        if c ∉ keys(d)
            d[c] = 1
        else
            d[c] += 1
        end
    end
    d
end
```
这个函数也适用于列表、元组，甚至字典，只要`s`中的元素是可散列的，因此它们可以用作`d`中的键。
```julia
julia> t = ("spam", "egg", "spam", "spam", "bacon", "spam")
("spam", "egg", "spam", "spam", "bacon", "spam")
julia> histogram(t)
Dict{Any,Any} with 3 entries:
  "bacon" => 1
  "spam"  => 4
  "egg"   => 1
```
与几种类型一起工作的函数称为多态函数。多态可以促进代码重用。

例如，内置函数sum可以添加序列的元素，只要序列的元素支持添加，它就可以工作。

由于MyTime对象提供了+方法，它们使用sum:
```julia
julia> t1 = MyTime(1, 7, 2)
01:07:02
julia> t2 = MyTime(1, 5, 8)
01:05:08
julia> t3 = MyTime(1, 5, 0)
01:05:00
julia> sum((t1, t2, t3))
03:17:10
```
一般来说，如果函数内的所有操作都适用于给定类型，那么函数也适用于该类型。

最好的多态性类型是无意型，在这种类型中，您会发现您已经编写的函数可以应用于您从未计划过的类型。

## Interface and Implementation
多调度的目标之一是使软件更具可维护性，这意味着当系统的其他部分发生变化时，您可以保持程序工作，并修改程序以满足新的需求。

帮助实现这一目标的设计原则是将接口与实现分开。这意味着带有带有类型注解的参数的方法不应该依赖于该类型的字段如何表示。

例如，在本章中，我们开发了一个表示一天中的某个时间的结构体。参数注释为这种类型的方法包括timetoint、isafter和+。

我们可以用几种方式实现这些方法。实现的细节取决于我们如何表示MyTime。在本章中，MyTime对象的字段包括小时、分钟和秒。

作为一种替代方案，我们可以用一个表示从午夜开始的秒数的整数来替换这些字段。这种实现将使一些函数(如isafter)更容易编写，但使其他函数更难编写。

在部署新类型之后，您可能会发现更好的实现。如果程序的其他部分正在使用您的类型，那么更改接口可能会耗费时间，而且容易出错。

但是如果你仔细地设计接口，你可以在不改变接口的情况下改变实现，这意味着程序的其他部分不必改变。

