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




