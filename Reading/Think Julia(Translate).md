# Think Julia: How to Think like a computer scientist

_**Original Author: [Ben Lauwens](ben.lauwens@gmail.com),[Allen Downey](allendoweny@gmail.com)**_

原书地址：https://benlauwens.github.io/ThinkJulia.jl/latest/book.html


[TOC]


***************
## 前言

2018年1月，我开始准备一门针对没有编程经验的学生的编程课程。我想用Julia，但是我发现 没有一本书的目的是学习用Julia作为第一编程语言来编程。有一些很好的教程解释了Julia的关键概 念，但是没有一个教程足够重视学习如何像程序员一样思考。

我知道艾伦唐尼(Allen Downey)写的《Think Python》这本书，里面包含了学习正确编程的所 有关键要素。然而，这本书是基于Python编程语言的。我的课程笔记初稿是各种参考著作的大熔 炉，但我写得越久，内容就越像Think Python的章节。很快，把我的课程笔记作为那本书的移植移植 给Julia的想法就实现了。

  所有的资料都可以在GitHub存储库中以jupyter notebook的形式找到。当我在Julia Discourse 网站上发布了关于我课程进展的信息后，反馈铺天盖地。一本以Julia作为第一种编程语言的关于基 本编程概念的书显然是Julia领域中缺失的一环。我联系了Allen，问他我是否可以给julia开通一个 Think Python的官方网站，他立刻回答道:“去吧!他让我与他在奥莱利传媒(O 'Reilly Media)的编辑取 得联系，一年后，我正在对这本书进行最后的润色。

这是一段颠簸的旅程。2018年8月，Julia v1.0发布了，和我所有的Julia程序员一样，我不得不 对代码进行迁移。书中的所有示例都在源文件转换到与O ' reilly兼容的AsciiDoc文件期间进行了测 试。工具链和示例代码都必须与Julia v1.0兼容。幸运的是，8月份没有讲座......

我希望你能喜欢和这本书一起工作，它能帮助你学会编程和像计算机科学家一样思考，至少是一点点。

**BEN LAUWENS**

*****
## 为什么是Julia?
Julia最初于2012年由Alan Edelman, Stefan Karpinski, Jeff Bezanson和Viral Shah发布。它是一种免费的开源编程语言。
选择一种编程语言总是主观的。

在我看来，Julia的以下特点是决定性的:

- Julia是作为高性能编程语言开发的。
- Julia使用多重派发，这允许程序员从适合应用程序的不同编程模式中进行选择。
- Julia是一种动态语言，可以很容欧的进行交互。
- Julia有一个很容易学习的高级语法。
- Julia是一种可选类型的编程语言，它的(用户定义的)数据类型使代码更清晰、更强大。
- Julia有一个扩展的标准库，并且有许多第三方包可用。

Julia是一种独特的编程语言，因为它解决了所谓的“两种语言问题”。不需要其他编程语言来编写高 性能代码。这并不意味着它会自动发生。程序员的责任是优化形成瓶颈的代码，但这可以在Julia中 完成。

*********
## Who is this book for?
这本书适合任何想要学习编程的人。不需要正式的先验知识。新概念将逐步引入，更高级的主题将 在后面的章节中进行描述。Think Julia 可以在高中或者大学上一个学期的课程。


********
## Conventions Used in This Book
本书使用了以下排印约定:

_斜体_

指示新的术语、url、电子邮件地址、文件名和文件扩展名。

`constant with`

用于程序清单，以及在段落中引用程序元素，如变量或函数名、数据库、数据类型、环境变量、语 句和关键字。

`Constant with italic`

显示应由用户提供的值或由上下文确定的值替换的文本。

TIP

建议

Note

Warning

**************
## 使用的案例代码
本书中使用的所有代码都可以在GitHub上的Git仓库中找到:https://github.com/BenLauwens/ThinkJulia.jl
如果您不熟悉Git，它是一个版本控制系统，允许您跟踪组成项目的文件。Git控制下的文件集合称为“仓库”。GitHub是一个托管服务，为Git仓库提供存储和方便的web界面。

提供了一个方便的包，可以直接添加到Julia。只要输入`add https://github.com/ BenLauwens/ThinkJulia.jl` 在Julia的REPL中。

运行Julia代码最简单的方法是访问https://juliabox.com， notebook接口都是可用的。如果你想将Julia本地安装在你的电脑上，你可以从Julia Computing免费 下载JuliaPro。它由一个最新的Julia版本、基于Atom的Juno交互式开发环境和许多预安装的Julia包 组成。如果您更喜欢冒险，可以从https://julialang.org
下载Julia，
安装您喜欢的编辑器(例如， Atom或Visual Studio代码)，并激活用于Julia集成的插件。要进行本地安装，你也可以添加IJulia包， 并在你的电脑上运行一个Jupyter笔记本。


***********
# The way of Program
这本书的目的是教你像计算机科学家一样思考。这种思维方式结合了数学、工程和自然科学的一些最好的特征。像数学家一样，计算机科学家使用形式化语言来表示思想(特别是计算)。像工程师一样，他们设计东西，将组件组装成系统，并评估各种选择之间的取舍。像科学家一样，他们观察复杂系统的行为，形成假设，并测试预测。

对计算机科学家来说，最重要的技能是解决问题。问题解决能力指的是有能力提出问题，创造性地思考解决方案，清晰准确地表达解决方案。事实证明，学习编程的过程是练习解决问题技巧的绝佳机会。这就是为什么这一章被称为“程序之路”。
    
在某种程度上，你将学习编程，这本身就是一项有用的技能。在另一个层面上，你将把编程作为达到目的的一种手段。随着我们的推进，这一目标将变得更加清晰。


***********
## what is program?
程序是指定如何执行计算的指令序列。这种计算可能是数学计算，比如解方程组或找到多项式的根，但也可能是符号计算，比如搜索和替换文档中的文本，或者是图形计算，比如处理图像或播放视频。

细节在不同的语言中看起来不同，但一些基本的指令出现在几乎每种语言中:

**输入**

从键盘、文件、网络或其他设备获取数据。

**输出**

在屏幕上显示数据，保存在文件中，通过网络发送，等等。

**数学**

执行基本的数学运算，如加法和乘法。

**条件执行**

检查某些条件并运行适当的代码。

**重复**

重复执行某个动作，通常会有一些变化。

信不信由你，这差不多就是全部了。你用过的每一个程序，不管多么复杂，都是由类似于这些的指令组成的。所以你可以把编程看作是把一个大的、复杂的任务分解成越来越小的子任务的过程，直到子任务简单到可以用这些基本指令之一来执行为止。

*********
## Runing Julia
开始使用Julia的一个挑战是，您可能不得不在计算机上安装它和相关软件。如果您熟悉操作系统，尤其是熟悉命令行界面，那么安装Julia将不会有任何问题。但是对于初学者来说，同时学习系统管理和编程可能是痛苦的。

为了避免这个问题，我建议您从在浏览器中运行Julia开始。稍后，当您对Julia感到满意时，我将提出在您的计算机上安装Julia的建议。

在浏览器中，你可以在JuliaBox上运行Julia。不需要安装—只需将浏览器指向那里，登录，并开始计算(参见JuliaBox)。

Julia REPL (Read-Eval-PrintLoop)是一个读取和执行Julia代码的程序。您可以通过在JuliaBox上打开终端并在命令行中输入julia来启动REPL。当它启动时，你应该看到如下输出:
```
               _
   _       _ _(_)_     |  Documentation: https://docs.julialang.org
  (_)     | (_) (_)    |
   _ _   _| |_  __ _   |  Type "?" for help, "]?" for Pkg help.
  | | | | | | |/ _` |  |
  | | |_| | | | (_| |  |  Version 1.1.0 (2019-01-21)
 _/ |\__'_|_|_|\__'_|  |  Official https://julialang.org/ release
|__/                   |

julia>
```

```
julia> 1 + 1
2
```

******
## The first program
传统上，用一种新语言编写的第一个程序叫做“Hello, World!”因为它所做的只是显示“Hello, World!”在Julia中，它是这样的:



```julia
println("Hello, World!")
```

    Hello, World!


这是一个print语句的示例，尽管它实际上并没有在纸上打印任何东西。它在屏幕上显示结果。

程序中的引号标明要显示的文本的开始和结束;它们不会出现在结果中。

括号表明println是一个函数。我们会讲到函数中的函数。

***********
## Arithmetic Operators
在"Hello, World!"下一步是算术。Julia提供了运算符，运算符是表示像加法和乘法这样的计算的符号。

操作符+、-和*执行加法、减法和乘法，如下例所示:


```julia
40 + 2
```




    42




```julia
43 - 1
```




    42




```julia
6 * 7
```




    42




```julia
84 / 7
```




    12.0




```julia
6^2 + 6
```




    42



*****
## Values and Types
值是程序处理的基本东西之一，就像字母或数字一样。到目前为止，我们看到的一些值是2,42.0和“Hello, World!”

这些值属于不同的类型:2是一个整数，42.0是一个浮点数，“Hello, World!”是一个字符串，之所以这样称呼是因为它包含的字母是串在一起的。

如果你不确定一个值的类型，REPL可以告诉你:


```julia
typeof(2)
```




    Int64




```julia
typeof(42.0)
```




    Float64




```julia
typeof("Hello, world!")
```




    String



整数属于Int64类型，字符串属于String类型，浮点数属于Float64类型。

那么像“2”和“42.0”这样的值呢?它们看起来像数字，但它们像字符串一样用引号括起来。这些也是字符串:


```julia
typeof("2")
```




    String



当您键入一个较大的整数时，您可能会在一组数字之间使用逗号，例如在1,000,000中。这在Julia中不是一个合法的整数，但它是合法的:


```julia
1,000,000
```




    (1, 0, 0)



那根本不是我们所期望的!Julia将1,000,000作为逗号分隔的整数序列进行解析。稍后我们将学习更多关于这种序列的知识。但是，您可以使用1_000_000获得预期的结果。


```julia
1_000_000
```




    1000000



*********
## Formal and Natural Languages
自然语言是人们说的语言，如英语、西班牙语和法语。它们不是由人设计的(尽管人们试图给它们强加一些秩序);他们自然进化。

形式语言是人们为特定应用程序设计的语言。例如，数学家使用的符号是一种形式语言，特别擅长表示数字和符号之间的关系。化学家用一种形式语言来表示分子的化学结构。最重要的是，编程语言是被设计用来表达计算的形式语言。

形式语言倾向于有严格的语法规则来控制语句的结构。例如，在数学中，语句3+3=6有正确的语法，但3+=3$6却没有。在化学中，H2O是一个语法正确的分子式，但2Zz不是。

语法规则有两种形式，用于修饰标记和结构。标记是语言的基本元素，如单词、数字和化学元素。3+=3$6的一个问题是，$在数学上不是一个合法的代币(至少据我所知)。同样，2Zz也不合法，因为没有包含缩写Zz的元素。

第二种类型的语法规则与令牌的组合方式有关。等式3+=3是非法的，因为即使+和=是合法的代币，你也不能一个接一个。同样，在化学公式中，下标是在元素名之后，而不是在元素名之前。

这是一个结构良好的英语$h句子，里面有无效的t*kens。这个句子所有有效的符号都有，但是无效的结构有。

当你读一个英语句子或一个正式语言的陈述时，你必须弄清楚其结构(尽管在自然语言中你会下意识地做这件事)。这个过程称为解析。

尽管正式语言和自然语言在共同的方面有许多特性——标记、结构和语法——但它们也有一些区别:

**Ambiguity(模糊)**

自然语言中充满了歧义，人们利用语境线索等信息来处理歧义。形式语言被设计成几乎或完全没有歧义，这意味着无论上下文如何，任何语句都只有一个意思。

**冗余**

为了弥补歧义和减少误解，自然语言使用了大量的冗余。因此，它们常常是冗长的。正式语言不那么冗余，更简洁。

**表面意义**

自然语言中充满了习语和隐喻。如果我说“The penny dropped”，很可能是没有硬币，什么都没掉(这个习语的意思是某人在一段时间的困惑之后理解了某事)。正式语言的意思就是他们所说的。

因为我们从小都说自然语言，所以有时很难适应正式语言。正式语言和自然语言之间的区别就像诗歌和散文之间的区别，但更多的是:

**诗歌**

词语的读音和意义都被使用，整首诗一起创造了一种效果或情感反应。模棱两可不仅常见，而且常常是有意为之。

**散文**

单词的字面意义更重要，结构也能提供更多的意义。散文比诗歌更容易分析，但仍然常常模棱两可。

**项目**

计算机程序的意义是明确的和文字的，可以完全通过对符号和结构的分析来理解。

正式语言比自然语言更密集，因此需要更长的时间来阅读它们。此外，结构很重要，所以从上到下、从左到右阅读并不总是最好的。相反，您将学习在头脑中解析程序，识别标记并解释结构。最后，细节很重要。拼写和标点符号上的小错误在自然语言中是可以避免的，但在正式语言中却会产生很大的不同。

*******
## Debugging

程序员犯错误。出于异想天开的原因，编程错误被称为bug，而追踪它们的过程被称为调试。

编程，尤其是调试，有时会引发强烈的情绪。如果你正在和一个难以对付的虫子做斗争，你可能会感到愤怒、沮丧或尴尬。

有证据表明，人们对电脑的反应很自然，就好像电脑是人一样。当他们工作出色时，我们把他们当作队友，当他们固执或粗鲁时，我们用对待粗鲁、固执的人的方式来回应他们

为这些反应做好准备可能会帮助你应对它们。一种方法是把电脑想象成拥有某些优势(比如速度和精度)的员工，以及某些特定弱点(比如缺乏同情心和无法把握大局)的员工。

你的工作是成为一名优秀的管理者:想办法利用优势，减少劣势。找到利用你的情绪来解决问题的方法，而不让你的反应影响你有效工作的能力。

学习调试可能会令人沮丧，但这是一项宝贵的技能，除了编程之外，它对许多活动都很有用。在每一章的末尾都有一节，就像本文一样，介绍了我对调试的建议。我希望他们能帮上忙!

*******
## Glossary 术语表
解决问题

阐述一个问题、找到解决方案并表达出来的过程。

程序

指定一种计算的指令序列。

REPL

重复读取输入、执行输入并输出结果的程序。

提示

REPL显示的字符，表明它已经准备好接受用户的输入。

print语句

使Julia REPL在屏幕上显示一个值的指令。

操作符

一种表示简单计算的符号，如加法、乘法或字符串连接。

值

一种基本的数据单位，如数字或字符串，由程序操作。

类型

数值的一类。到目前为止，我们看到的类型有整数(Int64)、浮点数(Float64)和字符串(String)。

整数

一种表示整数的类型。

浮点

一种表示带有小数点的数字的类型。

字符串

一种表示字符序列的类型。

自然语言

任何一种人类自然进化的语言。

正式的语言

一种人们为特定目的而设计的语言，如表示数学思想或计算机程序。所有的编程语言都是形式语言。

语法

控制程序结构的规则。

令牌

程序语法结构的基本元素之一，类似于自然语言中的词。

结构

令牌组合的方式。

解析

检查一个程序并分析其语法结构。

错误
程序中的错误。

调试
发现并纠正错误的过程。

****
## Variables, Expressions and Statements
编程语言最强大的特性之一是操纵变量的能力。变量是指一个值的名称。

_**赋值语句**_

赋值语句创建一个新变量并为其赋值:


```julia
message = "And now for something completely different"
n = 17
π_val = 3.141592653589793
```




    3.141592653589793



这个例子做了三个作业。第一个函数将一个字符串赋值给名为message的新变量;第二个是整数17到n;第三个将π的(近似)值赋给π_val (\pi TAB)。

****
## 变量名
程序员通常为变量选择有意义的名称——他们记录变量的用途。

变量名可以任意设置。它们可以包含几乎所有的Unicode字符(参见字符)，但它们不能以数字开头。使用大写字母是合法的，但通常只使用小写的变量名。

Unicode字符可以通过在Julia REPL中使用类似于乳胶的缩写的制表符完成输入。

下划线“_”可以出现在名称中。它经常用于带有多个单词的名字中，如your_name或airspeed_of_unladen_swallow。

如果你给一个变量一个非法的名字，你会得到一个语法错误:


```julia
76trombones = "big parade"
```


    syntax: "76" is not a valid function argument name around In[14]:1


​    

    Stacktrace:
    
     [1] top-level scope at In[14]:1
    
     [2] include_string(::Function, ::Module, ::String, ::String) at ./loading.jl:1091



```julia
more@ = 1000000
```


    syntax: extra token "@" after end of expression


​    

    Stacktrace:
    
     [1] top-level scope at In[15]:1
    
     [2] include_string(::Function, ::Module, ::String, ::String) at ./loading.jl:1091



```julia
struct = "Advanced Theoretical Zymurgy"
```


    syntax: unexpected "="


​    

    Stacktrace:
    
     [1] top-level scope at In[16]:1
    
     [2] include_string(::Function, ::Module, ::String, ::String) at ./loading.jl:1091


76trombones是非法的，因为它是以数字开头的。more@是非法的，因为它包含一个非法字符@。但是struct有什么问题吗?

原来struct是Julia的关键字之一。REPL使用关键字来识别程序的结构，它们不能用作变量名。

Julia有这些关键词:
```
abstract type    baremodule   begin      break       catch
const            continue     do         else        elseif
end              export       finally    for         function
global           if           import     importall   in
let              local        macro      module      mutable struct
primitive type   quote        return     try         using
struct           where        while
```

你不需要记住这个列表。在大多数开发环境中，关键词以不同的颜色显示;如果您尝试使用one作为变量名，您就会知道。

****
## Expressions and Statements
表达式是值、变量和操作符的组合。一个值本身就被认为是一个表达式，变量也是，所以下面的表达式都是合法的:


```julia
42
```




    42




```julia
n
```




    17




```julia
n + 25
```




    42



当您在提示符处输入表达式时，REPL会对其进行计算，这意味着它会找到表达式的值。本例中，n为17,n + 25为42。

语句是具有效果的代码单元，如创建变量或显示值。


```julia
n = 17
println(n)
```

    17


第一行是赋值语句，给n赋值。第二行是打印语句，显示n的值。

当您键入一条语句时，REPL将执行该语句，这意味着它将执行该语句所说的任何内容。

*******
## Script Mode
到目前为止，我们已经在交互模式下运行了Julia，这意味着您可以直接与REPL交互。交互模式是一种很好的入门方式，但如果您要处理的代码超过几行，它可能会很笨拙。

另一种方法是将代码保存在一个称为脚本的文件中，然后以脚本模式运行Julia来执行脚本。按照惯例，Julia脚本的名称以.jl结尾。

如果您知道如何在计算机上创建和运行脚本，那么就可以开始了。否则我建议再次使用JuliaBox。打开一个文本文件，编写脚本并使用.jl扩展名保存。可以在终端使用命令julia name_of_the_script.jl执行该脚本。

因为Julia提供了两种模式，所以在将代码放入脚本之前，可以在交互模式下测试代码。但是，交互模式和脚本模式之间的差异可能会让人感到困惑。

例如，如果你用Julia作为计算器，你可以打字:


```julia
miles = 26.2
```




    26.2




```julia
miles * 1.61
```




    42.182



第一行为miles赋值并显示该值。第二行是一个表达式，因此REPL对其进行计算并显示结果。原来马拉松大约是42公里。

但是，如果您在脚本中输入相同的代码并运行它，则根本不会得到任何输出。在脚本模式下，表达式本身没有可见的效果。Julia实际上对表达式求值，但它不会显示值，除非你告诉它:
```julia
miles = 26.2
println(miles * 1.61)
```
这种行为一开始可能会让人困惑。

一个脚本通常包含一系列语句。如果有多个语句，则在语句执行时，结果一次显示一个。

例如，脚本:
```julia
println(1)
x = 2
println(x)
```
生成的输出
```julia
1
2
```

*****
## 运算符优先级
当表达式包含多个操作符时，求值顺序取决于操作符的优先级。对于数学运算符，Julia遵循数学惯例。首字母缩写PEMDAS是一个很有用的记忆规则的方法:

- 括号具有最高的优先级，可用于强制表达式按您想要的顺序求值。因为括号中的表达式是先求值的，所以`2*(3-1)`是4，`(1+1)^(5-2)`是8。你也可以使用括号使表达式更容易阅读，例如`(minute * 100) / 60`，即使它不会改变结果。
- 取幂的优先级次高，所以1+2^3是9，不是27,2*3^2是18，不是36。

- 乘法和除法的优先级高于加法和减法。所以2*3-1是5，不是4 6+4/2是8，不是5。

- 具有相同优先级的操作符从左到右计算(除取幂运算外)。因此，在`degrees/ 2 *π`表达式中，先进行除法，结果再乘以π。要除以2π，可以用括号，写上`degrees/ 2 /π`或`degrees/ 2π`。

> 我不怎么努力去记住运算符的优先级。如果我不能通过看表达式来判断，我用括号使它更明显。

******
## String Operations
通常，你不能对字符串执行数学运算，即使字符串看起来像数字，所以下面的操作是非法的:
```julia
"2" - "1"    "eggs" / "easy"    "third" + "a charm"
```
但是有两个例外，*和^。

*操作符执行字符串连接，这意味着它通过端到端连接字符串来连接字符串。例如:


```julia
first_str = "throat"
second_str = "warbler"
first_str * second_str
```




    "throatwarbler"



^运算符也适用于字符串;它执行重复。例如，`"Spam"^3`是`"SpamSpamSpam"`。如果其中一个值是字符串，另一个值必须是整数。

*和^的用法与乘法和取幂类似。正如4^3等价于4*4*4一样，我们认为`"Spam"^3`与`"Spam"`*`"Spam*Spam"`相同，事实也是如此。

*****
## 注释
随着程序变得越来越大、越来越复杂，阅读起来也越来越困难。形式语言是密集的，通常很难看到一段代码并弄清楚它在做什么，或者为什么要这样做。

出于这个原因，在程序中添加注释以用自然语言解释程序正在做什么是一个好主意。这些注释被称为注释，它们以#符号开头:

```julia
# compute the percentage of the hour that has elapsed
percentage = (minute * 100) / 60
```
在本例中，注释单独出现在一行中。你也可以把注释放在一行的末尾:

```julia
percentage = (minute * 100) / 60   # percentage of an hour
```
从#到行尾的所有内容都将被忽略——它对程序的执行没有影响。

注释在记录代码的非明显特性时最有用。我们有理由认为读者可以知道代码的作用;解释为什么更有用。

这条注释是多余的，没有用的:
```julia
v = 5   # assign 5 to v
```
这个注释包含了代码中没有的有用信息:

```julia
v = 5   # velocity in meters/second.
```

****
# 函数

在程序设计上下文中，函数是执行计算的命名语句序列。定义函数时，要指定名称和语句序列。稍后，您可以通过名称来调用函数。


****
## 函数调用

我们已经看到了一个函数调用的例子:


```julia
println("Hello, World!")
```

    Hello, World!


函数名是println。括号中的表达式称为函数的实参。

通常说函数“接受”一个参数并“返回”一个结果。结果也称为返回值。

Julia提供了将值从一种类型转换为另一种类型的函数。parse函数接受一个字符串，并将其转换为任何数字类型(如果可以的话)，否则会报错:


```julia
parse(Int64, "32")
```




    32




```julia
parse(Float64, "3.14159")
```




    3.14159




```julia
 parse(Int64, "Hello")
```


    ArgumentError: invalid base 10 digit 'H' in "Hello"


​    

    Stacktrace:
    
     [1] tryparse_internal(::Type{Int64}, ::String, ::Int64, ::Int64, ::Int64, ::Bool) at ./parse.jl:132
    
     [2] parse(::Type{Int64}, ::String; base::Nothing) at ./parse.jl:238
    
     [3] parse(::Type{Int64}, ::String) at ./parse.jl:238
    
     [4] top-level scope at In[27]:1
    
     [5] include_string(::Function, ::Module, ::String, ::String) at ./loading.jl:1091


`trunc`可以将浮点值转换为整数，但不能四舍五入;它剪掉了部分:


```julia
trunc(Int64, 3.99999)
```




    3




```julia
trunc(Int64, -2.3)
```




    -2



`float`将整数转换为浮点数:


```julia
float(32)
```




    32.0



最后，`string`将其参数转换为字符串:


```julia
string(3.14159)
```




    "3.14159"



********
## 数学函数
在Julia中，大多数熟悉的数学函数都是直接可用的:


第一个示例使用log10来计算以分贝为单位的信噪比(假设定义了signal_power和noise_power)。还提供了计算自然对数的对数。


```julia
log10(10)
```




    1.0




```julia
sin(0.7)
```




    0.644217687237691



第二个例子是求弧度的正弦。变量的名字暗示了sin和其他三角函数(cos, tan等)的参数都是弧度。将角度转换为弧度，除以180再乘以π:


```julia
degree = 45
radians = degree / 180 * π
sin(radians)
```




    0.7071067811865475



变量π的值是π的一个浮点近似值，精确到16位左右。

如果你知道三角函数，你可以通过比较2除以2的平方根来检查前面的结果:


```julia
sqrt(2)/2
```




    0.7071067811865476



*******
## Composition
到目前为止，我们已经单独研究了程序的元素——变量、表达式和语句，没有讨论如何组合它们。

编程语言最有用的特性之一是它们能够使用小的构建块并组合它们。例如，函数的实参可以是任何类型的表达式，包括算术运算符:


```julia
x = sin(degree / 360 * 2 * π)
```




    0.7071067811865475



甚至函数调用:
```julia
x = exp(log(x))
```
几乎在任何可以放置值的地方，都可以放置任意表达式，只有一个例外:赋值语句的左侧必须是一个变量名。左边的任何其他表达式都是语法错误(稍后我们将看到此规则的例外)。


```julia
hours = 1
minutes = hours * 60
hours * 60 = minutes # wrong!
```


    syntax: "60" is not a valid function argument name around In[37]:3


​    

    Stacktrace:
    
     [1] top-level scope at In[37]:3
    
     [2] include_string(::Function, ::Module, ::String, ::String) at ./loading.jl:1091


********
## Adding a  New function
到目前为止，我们只使用了Julia附带的函数，但是还可以添加新函数。函数定义指定新函数的名称和调用该函数时运行的语句序列。下面是一个例子:



```julia
function printlyrics()
    println("I'm a lumberjack, and I'm okay.")
    println("I sleep all night and I work all day.")
end
```




    printlyrics (generic function with 1 method)



function是一个关键字，表示这是一个函数定义。函数的名称是printlyrics。函数名的规则与变量名相同:它们可以包含几乎所有的Unicode字符(参见字符)，但第一个字符不能是数字。不能使用关键字作为函数的名称，并且应该避免变量和函数具有相同的名称。

名称后的空括号表示这个函数不接受任何参数。

函数定义的第一行称为头文件;其余的叫做身体。主体以关键字end结束，可以包含任意数量的语句。为了可读性，函数体应该缩进。

引号必须是“直引号”，通常位于键盘上的输入符旁边。“卷引号”，就像这句话里的，在Julia身上是不合法的。

如果你在交互模式下输入一个函数定义，REPL会缩进让你知道这个定义不完整:

```julia
julia>function printlyrics()
       println("I'm a lumberjack, and I'm okay.")
```
要结束该功能，您必须输入end。

调用新函数的语法与内置函数相同:


```julia
printlyrics()
```

    I'm a lumberjack, and I'm okay.
    I sleep all night and I work all day.


一旦定义了一个函数，就可以在另一个函数中使用它。例如，为了重复前面的printlyrics，我们可以编写一个名为repeatlyrics的函数:


```julia
function repeatlyrics()
    printlyrics()
    printlyrics()
end
```




    repeatlyrics (generic function with 1 method)




```julia
repeatlyrics()
```

    I'm a lumberjack, and I'm okay.
    I sleep all night and I work all day.
    I'm a lumberjack, and I'm okay.
    I sleep all night and I work all day.


*****
## Definitions and Use
将前一节的代码片段整合在一起，整个程序看起来像这样:

```julia
function printlyrics()
    println("I'm a lumberjack, and I'm okay.")
    println("I sleep all night and I work all day.")
end

function repeatlyrics()
    printlyrics()
    printlyrics()
end

repeatlyrics()
```

这个程序包含两个函数定义:printlyrics和repeatlyrics。函数定义像其他语句一样执行，但其效果是创建函数对象。在函数被调用之前，函数内部的语句不会运行，并且函数定义不会产生输出。

如您所料，必须先创建一个函数，然后才能运行它。换句话说，函数定义必须在函数被调用之前运行。

*******
## flow of execution
为了确保在第一次使用函数之前定义函数，您必须知道运行的顺序语句，这称为执行流。

执行总是从程序的第一个语句开始。语句按从上到下的顺序一次运行一个。

函数定义不会改变程序的执行流，但请记住，在函数被调用之前，函数内部的语句不会运行。

函数调用就像执行流程中的绕道。流不是转到下一个语句，而是跳转到函数体，在那里运行语句，然后返回到它停止的地方。

这听起来非常简单，直到您记得一个函数可以调用另一个函数。在一个函数的中间，程序可能必须运行另一个函数中的语句。然后，当运行这个新函数时，程序可能必须运行另一个函数!

幸运的是，Julia很擅长跟踪它的位置，所以每次函数结束时，程序都会从调用它的函数中结束的位置恢复。当它到达程序的末尾时，它就终止了。

总之，当你阅读一个程序时，你并不总是想要从上到下阅读。有时，如果你遵循执行流程，会更有意义。

****
## Parameters And Argument

我们见过的一些函数需要参数。例如，当你调用sin时，你传递一个数字作为参数。有些函数有多个参数:parse有两个参数，一个数字类型和一个字符串。

在函数内部，参数被赋值给称为参数的变量。下面是带参数的函数的定义:


```julia
function printtwice(bruce)
    println(bruce)
    println(bruce)
end
```




    printtwice (generic function with 1 method)



这个函数将参数赋值给一个名为bruce的参数。当函数被调用时，它会两次输出形参的值(无论它是什么)。

这个函数可以处理任何可以打印的值。


```julia
printtwice("Spam")
```

    Spam
    Spam



```julia
printtwice(π)
```

    π
    π



```julia
printtwice("Spam "^4)
```

    Spam Spam Spam Spam 
    Spam Spam Spam Spam 


适用于内置函数的组合规则同样适用于程序员定义的函数，因此可以使用任何类型的表达式作为printtwice的参数:

参数在函数被调用之前被求值，因此在示例中表达式“Spam”^4和cos(π)只被求值一次。

你也可以使用变量作为参数:


```julia
michael = "Eric, the half a bee."
printtwice(michael)
```

    Eric, the half a bee.
    Eric, the half a bee.


*********
## Variables and Parameters Are Local
当您在函数中创建变量时，它是局部的，这意味着它只存在于函数中。例如:



```julia
function cattwice(part1, part2)
    concat = part1 * part2
    printtwice(concat)
end
```




    cattwice (generic function with 1 method)



这个函数接受两个参数，将它们连接起来，并输出两次结果。下面是一个使用它的例子:


```julia
line1 = "Bing tiddle "
line2 = "tiddle bang."
cattwice(line1, line2)
```

    Bing tiddle tiddle bang.
    Bing tiddle tiddle bang.


当cattwice终止时，变量concat被销毁。如果试图打印它，会得到一个异常:
```julia
julia> println(concat)
ERROR: UndefVarError: concat not defined
```

*****
## fruitful function and void function
我们使用的一些函数，如数学函数，返回结果;由于没有更好的名称，我称它们为卓有成效的函数。其他函数，如printtwice，执行一个操作但不返回值。它们被称为空函数。

当你调用一个有结果的函数时，你几乎总是想对结果做些什么;例如，你可以将它赋值给一个变量，或者将它用作表达式的一部分:

```julia
x = cos(radians)
golden = (sqrt(5) + 1) / 2
```
当你以交互模式调用函数时，Julia会显示结果:

```julia
julia> sqrt(5)
2.23606797749979
```
但是在脚本中，如果您单独调用一个富有成效的函数，则返回值将永远丢失!

```julia
sqrt(5)
```

输出

```julia
2.23606797749979
```
这个脚本计算5的平方根，但是因为它不存储或显示结果，所以它不是很有用。

Void函数可能会在屏幕上显示一些东西或具有其他效果，但它们没有返回值。如果将结果赋给变量，则会得到一个名为nothing的特殊值。

```julia
julia> typeof(nothing)
Nothing
```
到目前为止，我们写的函数都是void。我们将在几章中开始编写富有成果的函数。

*******
# Conditionals and Recursion

条件和递归

本章的主题是if语句，它根据程序的状态执行不同的代码。但首先我要介绍两种新的运算符:floor division and modulus
*****

## Floor division and modulus

层除法运算符，÷(\div Tab)，可以将两个数字整除并四舍五入得到一个整数。例如，假设电影的运行时间是105分钟。你可能想知道那是多长时间，以小时计算。常规除法返回一个浮点数:

```julia
julia> minutes = 105
105
julia> minutes / 60
1.75
```
但是我们通常不会用小数点来表示小时。floor division返回整数小时数，向下舍入:

```julia
julia> hours = minutes ÷ 60
1
```
要得到余数，你可以分钟减去一小时:

```julia
julia> remainder = minutes - hours * 60
45
```
另一种方法是使用模数运算符%，它可以将两个数整除并返回余数。

```julia
julia> remainder = minutes % 60
45
```
*****
## Boolean Expressions

布尔表达式是一个要么为真要么为假的表达式。下面的例子使用了操作符==，它比较两个操作数，如果相等则生成true，否则生成false:

```julia
julia> 5 == 5
true
julia> 5 == 6
false
```
true和false是属于Bool类型的特殊值;它们不是字符串:

```julia
julia> typeof(true)
Bool
julia> typeof(false)
Bool
```
==操作符是一种关系操作符;其他的有:

```
x != y               # x is not equal to y
x ≠ y                # (\ne TAB)
x > y                # x is greater than y
x < y                # x is less than y
x >= y               # x is greater than or equal to y
x ≥ y                # (\ge TAB)
x <= y               # x is less than or equal to y
x ≤ y                # (\le TAB)
```
*****
## Logical Operators

下面是三个逻辑运算符:&&(和)、||(或)和!(不)。这些操作符的语义(含义)与它们在英语中的含义相似。例如，x > 0 && x < 10仅当x大于0且小于10时为真。

n % 2 == 0 || n % 3 == 0如果任意一个或两个条件都为真，也就是说，如果数字能被2或3整除，则为真。

&&和||都在右边，但&&优先级高于||。

最后,!(x > y)当x > y为false时为真，也就是说，如果x小于或等于y。

****
## Conditional Execution

为了编写有用的程序，我们几乎总是需要能够检查条件并相应地改变程序的行为。条件语句赋予我们这种能力。最简单的形式是if语句:
```julia
if x > 0
    println("x is positive")
end
```
if后面的布尔表达式被称为条件。如果为真，则运行缩进语句。如果没有，什么也不会发生。

if语句的结构与函数定义相同:头文件后跟以关键字end结尾的正文。这样的语句称为复合语句。

语句体中可以出现的语句数量没有限制。有时，没有语句的主体是有用的(通常是作为尚未编写的代码的存储器)。

```julia
if x < 0
    # TODO: need to handle negative values!
end
```
****
## Alternative Execution

if语句的第二种形式是“alternative execution”，其中有两种可能性，由条件决定哪一种运行。语法如下所示:
```julia
if x % 2 == 0
    println("x is even")
else
    println("x is odd")
end
```
如果x除以2的余数是0，那么我们知道x是偶数，程序将显示相应的消息。如果条件为false，则运行第二组语句。由于条件必须为真或假，因此只运行一个备选项。备选方案被称为分支，因为它们是执行流中的分支。

****
## Chained Conditionals

有时有两种以上的可能性，我们需要两种以上的分支。一种表达这样计算的方法是链式条件语句:
```julia
if x < y
    println("x is less than y")
elseif x > y
    println("x is greater than y")
else
    println("x and y are equal")
end
```
同样，只运行一个分支。elseif语句的数量没有限制。如果有else子句，它必须在末尾，但不一定有。
```julia
if choice == "a"
    draw_a()
elseif choice == "b"
    draw_b()
elseif choice == "c"
    draw_c()
end
```
按顺序检查每个条件。如果第一个为假，则检查下一个，依此类推。如果其中一个为真，则运行相应的分支并结束语句。即使有多个条件为真，也只有第一个真正的分支运行。

****
## Nested Conditionals

一个条件也可以嵌套在另一个条件中。我们可以像这样在前一节中编写示例:


```julia
if x == y
    println("x and y are equal")
else
    if x < y
        println("x is less than y")
    else
        println("x is greater than y")
    end
end
```
outer条件包含两个分支。第一个分支包含一个简单的语句。第二个分支包含另一个if语句，该语句有自己的两个分支。这两个分支都是简单的语句，尽管它们也可以是条件语句。

虽然语句的非强制缩进使得结构很明显，但嵌套的条件语句很难快速阅读。在可能的时候避免使用它们是个好主意。

逻辑运算符通常提供了一种简化嵌套条件语句的方法。例如，我们可以用一个条件改写下面的代码:

```julia
if 0 < x && x < 10
    println("x is a positive single-digit number.")
end
```
对于这种情况，Julia提供了一种更简洁的语法:

```julia
if 0 < x < 10
    println("x is a positive single-digit number.")
end
```
****
## Recursion

一个函数调用另一个函数是合法的;函数调用自身也是合法的。为什么这是一件好事可能不是很明显，但事实证明这是一个程序能做的最神奇的事情之一。例如，看看下面的函数:

```julia
function countdown(n)
    if n ≤ 0
        println("Blastoff!")
    else
        print(n, " ")
        countdown(n-1)
    end
end
```
如果n为0或负数，则输出单词“Blastoff!”否则，它将输出n，然后调用名为countdown -自身的函数，并将n-1作为参数传递。

如果我们像这样调用这个函数会发生什么?

```julia
julia> countdown(3)
3 2 1 Blastoff!
```
倒计时的执行从n = 3开始，由于n大于0，它输出值3，然后调用自身…

倒计时从n = 2开始，由于n大于0，
它输出值2，然后调用自身…

倒计时从n = 1开始，由于n大于0，
它输出值1，然后调用自身…

倒数的执行从n = 0开始，因为n不大于
0，它输出单词“Blastoff!”，然后返回。

n = 1的倒计时返回。

得到n = 2的倒计时返回。

得到n = 3的倒计时返回。

然后你就回到了主战场。

调用自身的函数是递归的;执行它的过程称为递归。

另一个例子是，我们可以编写一个函数，输出一个字符串n次。

```julia
function printn(s, n)
    if n ≤ 0
        return
    end
    println(s)
    printn(s, n-1)
end
```

如果n <= 0，则返回语句退出函数。执行流立即返回到调用者，函数的其余行不运行。

该函数的其余部分类似于倒计时:它显示s，然后调用自己来显示s n−1次。所以输出的行数是1+(n−1)加起来是n。

对于像这样的简单示例，使用For循环可能更容易。但是我们将在后面看到一些用for循环很难编写而用递归很容易编写的示例，所以最好尽早开始。

****
## Keyboard Input

到目前为止，我们编写的程序不接受用户的输入。他们只是每次都做同样的事情。

Julia提供了一个名为readline的内置函数，用于停止程序并等待用户输入一些内容。当用户按回车键时，程序继续运行，readline返回用户输入的字符串。

```julia
julia> text = readline()
What are you waiting for?
"What are you waiting for?"
julia> print("What...is your name? "); readline()
What...is your name? Arthur, King of the Britons!
"Arthur, King of the Britons!"
```
在从用户那里得到输入之前，最好打印一个提示，告诉用户要输入什么:

一个分号;允许将多条语句放在同一行上。在REPL中，只有最后一条语句返回它的值。

如果你期望用户输入一个整数，你可以尝试将返回值转换为Int64:
```julia
julia> println("What...is the airspeed velocity of an unladen swallow?"); speed = readline()
What...is the airspeed velocity of an unladen swallow?
42
"42"
julia> parse(Int64, speed)
42
```
但是如果用户输入的不是一串数字，你会得到一个错误:

```julia
julia> println("What...is the airspeed velocity of an unladen swallow? "); speed = readline()
What...is the airspeed velocity of an unladen swallow?
What do you mean, an African or a European swallow?
"What do you mean, an African or a European swallow?"
julia> parse(Int64, speed)
ERROR: ArgumentError: invalid base 10 digit 'W' in "What do you mean, an African or a European swallow?"
[...]
```




```julia
signal_power = 9
noise_power = 10
ratio = signal_power/noise_power
decibels = 10 * log10(ratio)
print(decibels)
```

    -0.4575749056067512

*****
# fruitful functions.

我们使用的许多Julia函数，如math函数，都产生返回值。但是我们编写的函数都是void:它们有效果，比如打印值或移动海龟，但它们没有返回任何东西。在本章中，你将学习如何编写fruitful functions

## Return Values

调用该函数会生成一个返回值，该返回值通常赋值给变量或作为表达式的一部分使用。


```julia
e = exp(1.0)
height = 10 * sin(radians)
```




    7.071067811865475



到目前为止，我们编写的函数都是空的。随便说，它们没有return values;更准确地说，它们的返回值是nothing。在这一章中，我们将(最后)写fruitful functions。第一个例子是area，它返回给定半径的圆的面积:


```julia
function area(radius)
    a = π * radius^2
    return a
end
```




    area (generic function with 1 method)



我们以前见过return语句，但是在一个fruitful function中return语句包含一个表达式。这个语句的意思是:“立即从这个函数返回，并使用下面的表达式作为返回值。”"表达式可以任意复杂，所以我们可以把这个函数写得更简洁:


```julia
function area(radius)
    π * radius^2
end
```




    area (generic function with 1 method)



函数返回的值是最后一个求值表达式的值，默认情况下，这是函数定义体中的最后一个表达式。

另一方面，临时变量，如`a`和显式 `return`，可以使调试更容易。

有时使用多个`return`语句是很有用的，在一个条件语句的每个分支中都有一个return语句:


```julia
function absvalue(x)
    if x < 0
        return -x
    else
        return x
    end
end
```




    absvalue (generic function with 1 method)



由于这些return语句是在另一个条件中，所以只运行一个。

一旦return语句运行，函数就终止而不执行任何后续语句。出现在return语句之后的代码，或者出现在执行流永远无法到达的任何其他地方的代码，被称为死代码。

在一个fruitful function中，确保程序中的每个可能路径都符合return语句是一个好主意。例如:


```julia
function absvalue(x)
    if x < 0
        return -x
    end
    if x > 0
        return x
    end
end
```




    absvalue (generic function with 1 method)



这个函数是不正确的，因为如果x恰好为0，那么两个条件都不为真，并且函数结束时没有执行return语句。如果执行流到达函数的末尾，则返回值为nothing，而不是0的绝对值。


```julia
show(absvalue(0))
```

    nothing

## Incremental Development

当您编写更大的函数时，您可能会发现自己在调试上花费了更多的时间。

为了处理日益复杂的程序，您可能想尝试一种称为增量开发的过程。增量开发的目标是通过每次只添加和测试少量的代码来避免冗长的调试会话。

$$
d = \sqrt{(x_2 - x_1)^2 + (y_2 - y_1)^2}
$$

举个例子，假设你想求两点之间的距离，由坐标$(x_1,y_1)$ 和 $(x_2, y_2)$:

第一步是考虑Julia中的距离函数应该是什么样的。换句话说，什么是输入(参数)，什么是输出(返回值)?

在本例中，输入是两个点，可以用四个数字表示。返回值是用浮点值表示的距离。

你可以马上写出这个函数的大纲:

```julia
function distance(x₁, y₁, x₂, y₂)
    0.0
end
```
显然，这个版本不计算距离;它总是返回0。但是它在语法上是正确的，并且会运行，这意味着您可以在使它变得更复杂之前对它进行测试。下标数字在Unicode字符编码中可用(\_1Tab，\_2Tab，等等)。

要测试新函数，请使用示例参数调用它:
```julia
distance(1, 2, 4, 6)
```
我选择这些值使水平距离为3垂直距离为4;这样，结果是5,3-4-5三角形的斜边。当测试一个函数时，知道正确的答案是很有用的。

至此，我们已经确认该函数在语法上是正确的，并且可以开始向正文添加代码。下一步合理的做法是找出x2−x1的差值, y2-y1的差值。
下一个版本将这些值存储在临时变量中，并使用@show宏打印它们。


```julia
function distance(x₁, y₁, x₂, y₂)
    dx = x₂ - x₁
    dy = y₂ - y₁
    @show dx dy
    0.0
end
```




    distance (generic function with 1 method)



如果函数工作，它应该显示$dx = 3$和$dy = 4$。如果是这样，我们就知道函数得到了正确的参数并正确地执行了第一次计算。如果没有，只需要检查几行。

接下来我们计算dx和dy的平方和:

```julia
function distance(x₁, y₁, x₂, y₂)
    dx = x₂ - x₁
    dy = y₂ - y₁
    d² = dx^2 + dy^2
    @show d²
    0.0
end
```
同样，您将在这个阶段运行程序并检查输出(应该是25)。上标数字也可用(\^2选项卡)。最后，你可以使用sqrt来计算并返回结果:



```julia
function distance(x₁, y₁, x₂, y₂)
    dx = x₂ - x₁
    dy = y₂ - y₁
    d² = dx^2 + dy^2
    sqrt(d²)
end
```




    distance (generic function with 1 method)



如果工作正常，就完成了。否则，您可能想要在return语句之前打印sqrt(d²)的值。

函数的最终版本在运行时不显示任何东西;它只返回一个值。我们编写的print语句对于调试很有用，但是一旦函数运行起来，就应该删除它们。这样的代码被称为脚手架，因为它对构建程序很有帮助，但不是最终产品的一部分。

在开始时，一次只应该添加一两行代码。随着经验的积累，您可能会发现自己正在编写和调试更大的块。无论采用哪种方式，增量开发都可以为您节省大量调试时间。

这个过程的关键方面是:

从一个可行的程序开始，并进行微小的增量更改。在任何时候，如果有错误，您都应该知道它在哪里。

使用变量来保存中间值，以便可以显示和检查它们。

一旦程序开始工作，您可能希望删除一些脚手架或将多个语句合并到复合表达式中，但前提是这不会使程序难于阅读。

## Composition

正如您现在所期望的，您可以从另一个函数中调用一个函数。作为一个例子，我们将写一个函数，取两点，圆心和周长上的一点，并计算圆的面积。

假设中心点存储在变量xc和yc中，周长点存储在xp和yp中。第一步是求圆的半径，也就是两点之间的距离。我们只是写了一个函数，距离，它是这样的
```julia
radius = distance(xc, yc, xp, yp)
```
下一步就是求出这个半径的圆的面积;我们也写过:
```julia
result = area(radius)
```
```julia
function circlearea(xc, yc, xp, yp)
    radius = distance(xc, yc, xp, yp)
    result = area(radius)
    return result
end
```
临时变量radius和result对于开发和调试是有用的，但是一旦程序开始工作，我们可以通过组合函数调用来使它更简洁:
```julia
function circlearea(xc, yc, xp, yp)
    area(distance(xc, yc, xp, yp))
end
```

## Boolean function

函数可以返回布尔值，这通常很方便在函数中隐藏复杂的测试。例如:
```julia
function isdivisible(x, y)
    if x % y == 0
        return true
    else
        return false
    end
end
```
通常，布尔函数的名字听起来像是/否问题;`isdivisible`返回`true`或`false`，表示x是否能被y整除。

下面是一个例子:
```julia
julia> isdivisible(6, 4)
false
julia> isdivisible(6, 3)
true
```
==操作符的结果是一个布尔值，因此我们可以通过直接返回函数来更简洁地编写函数:
```julia
function isdivisible(x, y)
    x % y == 0
end
```

## One More example

除阶乘之外，递归定义的数学函数最常见的例子是fibonacci，它的定义如下:
```julia
function fib(n)
    if n == 0
        return 0
    elseif n == 1
        return 1
    else
        return fib(n-1) + fib(n-2)
    end
end
```
如果你试着按照执行的流程来做，即使是很小的n，你的头也会爆炸。但是根据信念的飞跃，如果您假设这两个递归调用是正确的，那么很明显，将它们相加就会得到正确的结果。

## Checking Types

如果我们调用`fact`，并给出1.5作为论证，会发生什么?
```julia
julia> fact(1.5)
ERROR: StackOverflowError:
Stacktrace:
 [1] fact(::Float64) at ./REPL[3]:2
```
它看起来像一个无限递归。怎么可能呢?这个函数有一个基本情况——当n == 0时。但如果n不是整数，我们就会错过基本情况，然后一直递归下去。

在第一次递归调用中，n的值是0.5。下一个是-0.5。从这里开始，它会变得更小(更负)，但它永远不会是0。

我们有两个选择。我们可以尝试推广阶乘函数来处理浮点数，或者我们可以检查它的参数类型。第一个选项叫做函数，它有点超出了这本书的范围。我们来看第二种。

可以使用内置操作符isa来验证实参的类型。当我们谈到这个问题时，我们也可以确保论点是积极的:
```julia
function fact(n)
    if !(n isa Int64)
        error("Factorial is only defined for integers.")
    elseif n < 0
        error("Factorial is not defined for negative integers.")
    elseif n == 0
        return 1
    else
        return n * fact(n-1)
    end
end
```
第一个基本情况处理非整数;第二个处理负整数。在这两种情况下，程序都会输出错误消息，并且不返回任何指示出错的信息:
```julia
julia> fact("fred")
ERROR: Factorial is only defined for integers.
julia> fact(-2)
ERROR: Factorial is not defined for negative integers.
```
如果我们通过了两个检查，我们知道n是正的或者是零，所以我们可以证明递归结束了。

这个程序演示了一种有时被称为守护者的模式。前两个条件充当监护人，保护后面的代码不受可能导致错误的值的影响。守护者使证明代码的正确性成为可能。

***************
# Iteration

本章是关于迭代的，迭代是重复运行语句块的能力。我们看到了一种迭代，使用递归，在递归中。我们看到了另一种形式，在简单的重复中使用for循环。在本章中，我们将看到另一种类型的while语句。但首先我想多讲一点变量赋值。

## Reassignment

正如您可能已经发现的，对同一个变量进行多次赋值是合法的。新的赋值会使现有变量引用新值(并停止引用旧值)。
```julia
julia> x = 5
5
julia> x = 7
7
```
在这一点上，我想解决一个常见的困惑来源。因为Julia使用等号(=)来赋值，所以很容易把a = b这样的命题解释成数学上的等号命题;也就是说，a和b相等。但这种解释是错误的。

首先，平等是一种对称关系，而分配不是。例如，在数学中，如果a=7，那么7=a。但是在Julia中，陈述a = 7是合法的，而7 = a则不是。

同样，在数学中，一个等式的命题永远不是真就是假。如果现在a=b，那么a将总是等于b。在Julia中，赋值语句可以使两个变量相等，但它们不必保持这样:

```julia
julia> a = 5
5
julia> b = a    # a and b are now equal
5
julia> a = 3    # a and b are no longer equal
3
julia> b
5
```
## Updating Variables

一种常见的重赋是更新，即变量的新值依赖于旧值。
```julia
julia> x = x + 1
8
```
这意味着“获取x的当前值，添加1，然后用新值更新x”。

如果你尝试更新一个不存在的变量，你会得到一个错误，因为Julia在给x赋值之前计算右边:
```julia
julia> y = y + 1
ERROR: UndefVarError: y not defined
```
在你更新一个变量之前，你必须初始化它，通常通过一个简单的赋值:



## The While Statement



计算机经常被用来自动完成重复性的任务。重复相同或类似的任务而不出错是计算机做得很好的而人做得很差的事情。在计算机程序中，重复也称为迭代。

我们已经看到了使用递归进行迭代的两个函数，倒计时和printn。由于迭代非常常见，Julia提供了一些语言特性来简化迭代。一个是我们在简单重复中看到的for语句。我们稍后再谈这个。

另一个是while语句。下面是一个使用了while语句的倒计时版本:

```julia
function countdown(n)
    while n > 0
        print(n, " ")
        n = n - 1
    end
    println("Blastoff!")
end
```



你几乎可以把while语句当成英语来读。它的意思是，“当n大于0时，显示n的值，然后减少n。当你达到0时，显示单词Blastoff!”

更正式地说，下面是执行流程for a while语句:

确定条件是真还是假。

如果为false，则退出while语句并继续执行下一条语句。

如果条件为真，运行主体，然后返回到步骤1。

这种流动被称为循环，因为第三步循环回到顶部。

循环体应该更改一个或多个变量的值，从而使条件最终变为false，循环终止。否则循环就会一直重复下去，这就是所谓的无限循环。让计算机科学家感到无穷乐趣的是，洗发水瓶子上的说明“起泡、漂洗、重复”是一个无限循环。

在倒计时的情况下，我们可以证明循环结束:如果n是零或负，循环永远不会运行。否则，n在循环中每次都变小，所以最终我们会得到0。

对于其他一些循环，就不那么容易判断了。例如:

```julia
function seq(n)
    while n != 1
        println(n)
        if n % 2 == 0        # n is even
            n = n / 2
        else                 # n is odd
            n = n*3 + 1
        end
    end
end
```

这个循环的条件是n != 1，所以循环将一直持续到n = 1，这使得条件为假。

每次通过循环，程序都会输出n的值，然后检查它是偶数还是奇数。如果是偶数，n除以2。如果是奇数，则将n的值替换为n*3 + 1。例如，如果传递给sequence的参数是3，则n的结果值为3、10、5、16、8、4、2、1。

由于n有时增加，有时减少，没有明显的证据证明n会达到1，或者程序终止。对于n的某些特定值，我们可以证明终止。例如，如果起始值是2的幂，那么在整个循环中，n每次都是偶数，直到n达到1。前面的示例以这样的序列结束，从16开始。

困难的问题是我们能否证明这个程序在所有n为正的情况下都终止。到目前为止，还没有人能够证明或反驳它!



## break

有时候你不知道是时候结束循环了直到你穿过了身体的一半。在这种情况下，您可以使用break语句跳出循环。

例如，假设您希望接受用户的输入，直到用户输入完成。你可以写:

```julia
while true
    print("> ")
    line = readline()
    if line == "done"
        break
    end
    println(line)
end
println("Done!")
```

循环条件为真，而且总是真，因此循环一直运行，直到遇到break语句。

每次通过时，它都会用尖括号提示用户。如果用户输入完成，break语句将退出循环。否则，程序将响应用户输入的任何内容，并返回循环的顶部。下面是一个运行示例:

```shell
> not done
not done
> done
Done!
```

这种编写while循环的方式很常见，因为您可以在循环的任何地方检查条件(不仅仅是在顶部)，并且可以肯定地表达停止条件(“发生时停止”)，而不是否定地(“直到发生时继续执行”)。

## continue

break语句退出循环。当在循环中遇到continue语句时，control将跳转到下一个迭代的循环开头，跳过当前迭代的循环体中语句的执行。例如:

```julia
for i in 1:10
    if i % 3 == 0
        continue
    end
    print(i, " ")
end
```

output

```shell
1 2 4 5 7 8 10
```

如果i能被3整除，continue语句停止当前迭代，开始下一次迭代。只打印1到10范围内不能被3整除的数字。



# string

字符串不像整数、浮点数和布尔数。字符串是一个序列，这意味着它是其他值的有序集合。在本章中，您将看到如何访问组成字符串的字符，并学习Julia提供的一些字符串帮助函数。



## Characters

讲英语的人熟悉字母(A, B, C，…)、数字和常见的标点符号等字符。这些字符是标准化的，按照ASCII标准(美国信息交换标准码)映射为0到127之间的整数值。

当然，在非英语语言中还使用许多其他字符，包括带有重音和其他修改的ASCII字符的变体、相关的脚本(如西里尔文和希腊文)，以及与ASCII和英语完全无关的脚本，包括阿拉伯语、汉语、希伯来语、印地语、日语和韩语。

Unicode标准解决了字符究竟是什么这一复杂问题，并被普遍接受为解决这一问题的决定性标准。它为世界范围内的每个字符提供了一个独特的数字。

一个`Char`值表示一个单独的字符，并用单引号括起来:

```julia
julia> 'x'
'x': ASCII/Unicode U+0078 (category Ll: Letter, lowercase)
julia> '🍌'
'🍌': Unicode U+01f34c (category So: Symbol, other)
julia> typeof('x')
Char
```

甚至连表情符号都是统一码标准的一部分.



## A string is a sequence

字符串是一个字符序列。你可以使用括号操作符一次访问一个字符:

```julia
julia> fruit = "banana"
"banana"
julia> letter = fruit[1]
'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
```

第二条语句从fruit中选择字符1，并将其赋值给letter。

括号中的表达式称为索引。索引指示您想要的序列中的哪个字符(因此有名称)。

Julia中的所有索引都是基于1的——任何整型索引对象的第一个元素在索引1处找到，最后一个元素在索引`end`找到:

```julia
julia> fruit[end]
'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
```

可以使用包含变量和操作符的表达式作为索引:

```julia
julia> i = 1
1
julia> fruit[i+1]
'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
julia> fruit[end-1]
'n': ASCII/Unicode U+006e (category Ll: Letter, lowercase)
```

但是下标的值必须是整数。否则你得到:

```julia
julia> letter = fruit[1.5]
ERROR: MethodError: no method matching getindex(::String, ::Float64)
```

## Length

length是一个内置函数，它返回字符串中的字符数:

```julia
julia> fruits = "🍌 🍎 🍐"
"🍌 🍎 🍐"
julia> len = length(fruits)
5
```

要获取字符串的最后一个字母，您可能会尝试这样做:

```julia
julia> last = fruits[len]
' ': ASCII/Unicode U+0020 (category Zs: Separator, space)
```

但你可能不会得到你想要的。

字符串使用UTF-8编码。UTF-8是一种可变宽度编码，这意味着不是所有字符都用相同的字节数进行编码。

函数sizeof给出了一个字符串的字节数

```julia
julia> sizeof("🍌")
4
```

因为表情符号是用4个字节编码的，字符串索引是基于字节的，所以水果的第5个元素是一个空格。

这也意味着并不是UTF-8字符串中的每个字节索引都必须是字符的有效索引。如果你以这种无效的字节索引对字符串进行索引，会抛出错误:

```julia
julia> fruits[2]
ERROR: StringIndexError("🍌 🍎 🍐", 2)
```

在水果的情况下，字符🍌是一个四字节字符，所以索引2、3和4是无效的，下一个字符的索引是5;可以通过`nextind(fruits, 1`)计算下一个有效索引，然后通过`nextind(fruits, 5)`计算下一个索引，以此类推。

## Traversal

很多计算都涉及到一次处理一个字符的字符串。他们通常从开头开始，依次选择每个角色，对其做些什么，并一直持续到最后。这种处理模式称为遍历。编写遍历的一种方法是使用while循环:

```julia
index = firstindex(fruits)
while index <= sizeof(fruits)
    letter = fruits[index]
    println(letter)
    global index = nextind(fruits, index)
end
```

这个循环遍历字符串并将每个字母单独显示在一行中。循环条件是index <= sizeof(fruit)，所以当index大于字符串的字节数时，条件为false，循环体不运行。

函数firstindex返回第一个有效的字节索引。关键字global在index之前表示我们想要重新分配Main中定义的变量index(请参阅global Variables)。

## String Slices

字符串的一个段称为片。选择一个切片类似于选择一个字符:

```julia
julia> str = "Julius Caesar";

julia> str[1:6]
"Julius"
```

运算符`[n:m]`返回从第n个字节到第m个字节的字符串部分。因此，需要像简单索引一样谨慎。

`end`关键字可以用来表示字符串的最后一个字节:

```julia
julia> str[8:end]
"Caesar"
```

如果第一个索引大于第二个，结果是一个空字符串，用两个引号表示:

```julia
julia> str[8:7]
""
```

空字符串不包含任何字符，长度为0，但除此之外，它与其他字符串相同。

## Strings Are Immutable

在赋值操作符的左侧使用[]操作符是很诱人的，目的是改变字符串中的字符。例如:

```julia
julia> greeting = "Hello, world!"
"Hello, world!"
julia> greeting[1] = 'J'
ERROR: MethodError: no method matching setindex!(::String, ::Char, ::Int64)
```

这个错误的原因是字符串是不可变的，这意味着你不能改变一个现有的字符串。你能做的最好的事情就是创建一个新的字符串，它是原始字符串的变体:

```julia
julia> greeting = "J" * greeting[2:end]
"Jello, world!"
```

这个例子将一个新的第一个字母连接到问候片上。它对原始的字符没有影响。

## String Interpolation

使用连接构造字符串可能会变得有点麻烦。为了减少对字符串或重复乘法的这些冗长调用的需要，Julia允许使用$进行字符串插值:



```julia
julia> greet = "Hello"
"Hello"
julia> whom = "World"
"World"
julia> "$greet, $(whom)!"
"Hello, World!"
```

这比字符串连接更容易读懂和方便:`greet * ", " * whom * "!"`

$之后最短的完整表达式作为表达式，其值将被插入到字符串中。因此，你可以用括号将任何表达式插入到字符串中:

```julia
julia> "1 + 2 = $(1 + 2)"
"1 + 2 = 3"
```

## Looping and Counting

下面的程序计算字母a在字符串中出现的次数:

```julia
word = "banana"
counter = 0
for letter in word
    if letter == 'a'
        global counter = counter + 1
    end
end
println(counter)
```

这个程序演示了另一种称为计数器的计算模式。变量计数器初始化为0，然后在每次找到a时递增。当循环退出时，计数器包含结果——a的总数。

## String Library

Julia提供了对字符串执行各种有用操作的函数。例如，uppercase函数接受一个字符串，并返回一个包含所有大写字母的新字符串。

```julia
julia> uppercase("Hello, World!")
"HELLO, WORLD!"
```

事实证明，有一个名为findfirst的函数与我们编写的find函数非常相似:

```julia
julia> findfirst("a", "banana")
2:2
```

实际上，findfirst函数比我们的函数更通用;它可以查找子字符串，而不仅仅是字符:

```julia
julia> findfirst("na", "banana")
3:4
```

默认情况下，findfirst从字符串的开头开始，但findnext函数接受第三个参数，即它应该从哪里开始的索引:

```julia
julia> findnext("na", "banana", 4)
5:6
```

## The `∈` Operator

∈(\in TAB)运算符是一个布尔运算符，接受一个字符和一个字符串，如果第一个出现在第二个中则返回true:

```julia
julia> 'a' ∈ "banana"    # 'a' in "banana"
true
```

例如，下面的函数打印word1中同时出现在word2中的所有字母:

```julia
function inboth(word1, word2)
    for letter in word1
        if letter ∈ word2
            print(letter, " ")
        end
    end
end
```

Julia的变量名选得很好，有时读起来像英文。你可以读这个循环，“对于(第一个)单词中的(每个)字母，如果(该)字母是(第二个)单词的元素，则打印(该)字母。”

如果你比较“苹果”和“橘子”，你会得到以下结果:

```julia
julia> inboth("apples", "oranges")
a e s
```

## String Comparison

关系操作符适用于字符串。查看两个字符串是否相等:

```julia
word = "Pineapple"
if word == "banana"
    println("All right, bananas.")
end
```

其他关系操作对于按字母顺序排列单词很有用:

```julia
if word < "banana"
    println("Your word, $word, comes before banana.")
elseif word > "banana"
    println("Your word, $word, comes after banana.")
else
    println("All right, bananas.")
end
```

Julia处理大写字母和小写字母的方式与常人不同。所有的大写字母都在小写字母之前，所以:

# Array
本章介绍Julia最有用的内置类型之一——数组。您还将了解对象，以及当同一个对象有多个名称时会发生什么。

## An Array is a Sequence

与字符串一样，数组是一个值序列。在字符串中，值是字符;在数组中，它们可以是任何类型。数组中的值称为元素，有时也称为项。创建新数组有几种方法;最简单的方法是将元素括在方括号([])中:

```julia
[10, 20, 30, 40]
["crunchy frog", "ram bladder", "lark vomit"]
```
第一个示例是一个由4个整数组成的数组。第二个是一个包含三个字符串的数组。数组的元素不必是相同的类型。下面的数组包含了一个字符串、一个浮点数、一个整数和另一个数组:

```julia
["spam", 2.0, 5, [10, 20]]
```
另一个数组中的数组是嵌套的。

不包含任何元素的数组称为空数组;您可以用空括号[]创建一个。

如您所料，可以将数组值赋给变量:

```julia
julia> cheeses = ["Cheddar", "Edam", "Gouda"];

julia> numbers = [42, 123];

julia> empty = [];

julia> print(cheeses, " ", numbers, " ", empty)
["Cheddar", "Edam", "Gouda"] [42, 123] Any[]
```
函数typeof可以用来找出数组的类型:
```julia
julia> typeof(cheeses)
Array{String,1}
julia> typeof(numbers)
Array{Int64,1}
julia> typeof(empty)
Array{Any,1}
```
数组的类型在花括号之间指定，由类型和数字组成。数字表示尺寸。数组empty包含类型为Any的值。，也就是说，它可以保存所有类型的值。

## Array are mutable
访问数组元素的语法与访问字符串字符的语法相同-括号操作符。括号内的表达式指定索引。记住，索引从1开始:
```julia
julia> cheeses[1]
"Cheddar"
```
与字符串不同，数组是可变的。当方括号操作符出现在赋值操作符的左侧时，它标识将被赋值的数组元素
```julia
julia> numbers[2] = 5
5
julia> print(numbers)
[42, 5]
```
## Traversing an Array
遍历数组元素最常见的方法是使用for循环。语法与字符串相同:
```julia
for cheese in cheeses
    println(cheese)
end
```
如果您只需要读取数组的元素，那么这将非常有效。但是如果你想写入或更新元素，你需要索引。一种常见的方法是使用内置函数`eachindex`:
```julia
for i in eachindex(numbers)
    numbers[i] = numbers[i] * 2
end
```
这个循环遍历数组并更新每个元素。length返回数组中元素的个数。每次循环i都会获取下一个元素的索引。主体中的赋值语句使用i读取元素的旧值并赋值给新值。

对于空数组的for循环永远不会运行数组体
```julia
for x in []
    println("This can never happens.")
end
```
尽管一个数组可以包含另一个数组，但嵌套的数组仍然算作单个元素。这个数组的长度是4
```julia
["spam", 1, ["Brie", "Roquefort", "Camembert"], [1, 2, 3]]
```
## Array Slices
slice操作符也适用于数组:
```julia
julia> t = ['a', 'b', 'c', 'd', 'e', 'f'];

julia> print(t[1:3])
['a', 'b', 'c']
julia> print(t[3:end])
['c', 'd', 'e', 'f']
```
切片操作符[:]复制整个数组:
```julia
julia> print(t[:])
['a', 'b', 'c', 'd', 'e', 'f']
```
因为数组是可变的，所以在执行修改数组的操作之前先做一个拷贝通常是很有用的。

赋值操作符左侧的切片操作符可以更新多个元素
```julia
julia> t[2:3] = ['x', 'y'];

julia> print(t)
['a', 'x', 'y', 'd', 'e', 'f']
```
## Array Library
Julia提供了操作数组的函数。例如,`push!`在数组的末尾添加新元素
```julia
julia> t = ['a', 'b', 'c'];

julia> push!(t, 'd');

julia> print(t)
['a', 'b', 'c', 'd']
```
append!将第二个数组的元素添加到第一个数组的末尾:
```julia
julia> t1 = ['a', 'b', 'c'];

julia> t2 = ['d', 'e'];

julia> append!(t1, t2);

julia> print(t1)
['a', 'b', 'c', 'd', 'e']
```
这个例子没有修改t2。

`sort!`从低到高排列数组中的元素:
```julia
julia> t = ['d', 'c', 'e', 'b', 'a'];

julia> sort!(t);

julia> print(t)
['a', 'b', 'c', 'd', 'e']
```
sort returns a copy of the elements of the array in order:
```julia
julia> t1 = ['d', 'c', 'e', 'b', 'a'];

julia> t2 = sort(t1);

julia> print(t1)
['d', 'c', 'e', 'b', 'a']
julia> print(t2)
['a', 'b', 'c', 'd', 'e']
```
## Map, Filter and Reduce
要将数组中的所有数字相加，可以使用这样的循环:
```julia
function addall(t)
    total = 0
    for x in t
        total += x
    end
    total
end
```
当循环运行时，total累积元素的总和;以这种方式使用的变量有时称为累加器。

将数组元素相加是一个非常常见的操作，Julia将其作为一个内置函数sum提供:
```julia
julia> t = [1, 2, 3, 4];

julia> sum(t)
10
```
像这样将一系列元素组合成单个值的操作有时称为reduce操作。

通常，您希望遍历一个数组，同时构建另一个数组。例如，下面的函数接受一个字符串数组，并返回一个包含大写字符串的新数组:

```julia
function capitalizeall(t)
    res = []
    for s in t
        push!(res, uppercase(s))
    end
    res
end
```
res被初始化为空数组;每次执行循环时，都要添加下一个元素。res是另一种累加器。

像capitaleall这样的操作有时被称为map，因为它将一个函数(在本例中为大写)“映射”到序列中的每个元素上。

另一个常见的操作是从数组中选择一些元素并返回一个子数组。例如，下面的函数接受一个字符串数组，并返回一个只包含大写字符串的数组:
```julia
function onlyupper(t)
    res = []
    for s in t
        if s == uppercase(s)
            push!(res, s)
        end
    end
    res
end
```
像onlypper这样的操作称为过滤器，因为它选择一些元素并过滤掉其他元素。

大多数常见的数组操作都可以表示为map、filter和reduce的组合。

## Dot Syntax
对于每一个像^这样的二进制操作符，都有一个相应的点运算符。^，它会被自动定义为在数组中逐元素执行^。例如，没有定义[1,2,3]^3，而是定义[1,2,3].^3被定义为计算元素级结果[1^3,2^3,3^3]:
```julia
julia> print([1, 2, 3] .^ 3)
[1, 8, 27]
```
任何Julia函数f都可以应用到任何带有点语法的数组中。例如，要将字符串数组大写，不需要显式循环
```julia
julia> t = uppercase.(["abc", "def", "ghi"]);

julia> print(t)
["ABC", "DEF", "GHI"]
```
这是一种创建映射的优雅方式。函数capitaleall可以通过一行代码实现:
```julia
function capitalizeall(t)
    uppercase.(t)
end
```
## Deleting (Inserting) Elements
有几种方法可以从数组中删除元素。如果你知道你想要的元素的索引，你可以使用splice!
```julia
julia> t = ['a', 'b', 'c'];

julia> splice!(t, 2)
'b': ASCII/Unicode U+0062 (category Ll: Letter, lowercase)
julia> print(t)
['a', 'c']
```
`splice!`修改数组并返回被删除的元素。

`pop!`删除并返回最后一个元素
```julia
julia> t = ['a', 'b', 'c'];

julia> pop!(t)
'c': ASCII/Unicode U+0063 (category Ll: Letter, lowercase)
julia> print(t)
['a', 'b']
```
`popfirst!`删除并返回第一个元素:
```julia
julia> t = ['a', 'b', 'c'];

julia> popfirst!(t)
'a': ASCII/Unicode U+0061 (category Ll: Letter, lowercase)
julia> print(t)
['b', 'c']
```
`pushfirst!`和`push!`在数组的开头和末尾分别插入一个元素。

如果不需要删除的值，可以使用`deleteat!`函数:
```julia
julia> t = ['a', 'b', 'c'];

julia> print(deleteat!(t, 2))
['a', 'c']
```
The function insert! inserts an element at a given index:
```julia
julia> t = ['a', 'b', 'c'];

julia> print(insert!(t, 2, 'x'))
['a', 'x', 'b', 'c']
```
## Arrays and Strings
字符串是字符序列，数组是值序列，但字符数组与字符串不同。要将字符串转换为字符数组，可以使用`collect`函数:
```julia
julia> t = collect("spam");

julia> print(t)
['s', 'p', 'a', 'm']
```
`collect`函数将一个字符串或另一个序列分解为单个元素。

如果你想把一个字符串分解成单词，你可以使用`split`函数:
```julia
julia> t = split("pining for the fjords");

julia> print(t)
SubString{String}["pining", "for", "the", "fjords"]
```
一个称为定界符的可选参数指定使用哪些字符作为单词边界。使用连字符作为分隔符的示例如下:
```julia
julia> t = split("spam-spam-spam", '-');

julia> print(t)
SubString{String}["spam", "spam", "spam"]
```
`join`是`split`的逆函数。它接受一个字符串数组并连接元素:
```julia
julia> t = ["pining", "for", "the", "fjords"];

julia> s = join(t, ' ')
"pining for the fjords"
```
在这种情况下，分隔符是一个空格字符。要连接不带空格的字符串，不需要指定分隔符。


# Dictionaries
本章介绍另一种内置类型，称为字典。

## A Dictionaries is a Mapping
字典类似于数组，但更一般。在数组中，下标必须是整数;在字典里，它们(几乎)可以是任何类型。

字典包含一组称为键的索引和一组值。每个键都与单个值相关联。键和值的关联称为键-值对，有时也称为项。

在数学语言中，字典表示从键到值的映射，因此也可以说每个键“映射”到一个值。例如，我们将构建一个字典，将英语单词映射到西班牙语单词，因此键和值都是字符串。

函数Dict创建一个没有条目的新字典。因为Dict是一个内置函数的名称，所以你应该避免使用它作为变量名。

```julia
julia> eng2sp = Dict()
Dict{Any,Any} with 0 entries
```
这种字典由花括号括起来:键是Any类型的，值也是Any类型的。字典是空的。要向字典中添加项，可以使用方括号:
```julia
julia> eng2sp["one"] = "uno";
```
这一行创建了一个从键“one”映射到值“uno”的项。再次打印字典，会看到键值对，键值之间有一个箭头=>
```julia
julia> eng2sp
Dict{Any,Any} with 1 entry:
  "one" => "uno"
```
这种输出格式也是一种输入格式。例如，您可以创建一个包含三个条目的新字典:
```julia
julia> eng2sp = Dict("one" => "uno", "two" => "dos", "three" => "tres")
Dict{String,String} with 3 entries:
  "two"   => "dos"
  "one"   => "uno"
  "three" => "tres"

```
所有的初始键和值都是字符串，因此将创建一个Dict{String,String}。
但这不是问题，因为字典的元素从来不会用整数索引进行索引。相反，你可以使用键来查找相应的值:
```julia
julia> eng2sp["two"]
"dos"
```
键“two”总是映射到值“dos”，所以项的顺序无关紧要。

如果键不在字典中，就会得到一个异常
```julia
julia> eng2sp["four"]
ERROR: KeyError: key "four" not found
```
长度函数适用于字典;它返回键值对的数量:

```julia
julia> length(eng2sp)
3
```
函数keys返回一个包含字典中的键值的集合:

```julia
julia> ks = keys(eng2sp);

julia> print(ks)
["two", "one", "three"]
```
现在，您可以使用∈运算符来查看某项是否作为键出现在字典中:
```julia
julia> "one" ∈ ks
true
julia> "uno" ∈ ks
false
```
要查看某个值是否以值的形式出现在字典中，可以使用返回值集合的函数值，然后使用∈运算符
```julia
julia> vs = values(eng2sp);

julia> "uno" ∈ vs
true
```
∈运算符对数组和字典使用不同的算法。对于数组，它按顺序搜索数组中的元素，就像搜索一样。数组越长，搜索时间越长。

对于字典，Julia使用了一种称为哈希表的算法，该算法有一个显著的特性:无论字典中有多少项，∈运算符都需要大约相同的时间

## Dictionary as a Collection of Counters
假设给你一个字符串，你想计算每个字母出现了多少次。有几种方法可以做到这一点:

您可以创建26个变量，每个变量对应字母表中的每个字母。然后可以遍历该字符串，并对每个字符递增相应的计数器(可能使用链式条件)。

您可以创建一个包含26个元素的数组。然后，您可以将每个字符转换为数字(使用内置函数Int)，使用数字作为数组的索引，并增加相应的计数器。

您可以创建一个以字符作为键，以计数器作为相应值的字典。第一次看到字符时，您将向字典添加一个项。在此之后，您将增加现有项的值。

这些选项都执行相同的计算，但它们都以不同的方式实现该计算。

实现是一种执行计算的方式;有些实现比其他的更好。例如，字典实现的一个优点是，我们不需要提前知道哪些字母出现在字符串中，我们只需要为出现的字母腾出空间。

下面是代码可能的样子:

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
函数的名称是histogram，这是一个用于计数器(或频率)集合的统计术语。

函数的第一行创建了一个空字典。`for`循环遍历字符串。每次循环中，如果字符`c`不在字典中，则使用键`c`和初始值1创建一个新项(因为我们已经看到过这个字母一次)。如果`c`已经在字典中，则增加`d[c]`。

下面是它的工作原理
```julia
julia> h = histogram("brontosaurus")
Dict{Any,Any} with 8 entries:
  'n' => 1
  's' => 2
  'a' => 1
  'r' => 2
  't' => 1
  'o' => 2
  'u' => 2
  'b' => 1

```
`histogram`表明字母`a`和`b`只出现一次;`o`出现两次，以此类推。

字典有一个名为`get`的函数，它接受一个键和一个默认值。如果键出现在字典中，`get`返回相应的值;否则返回默认值。例如

```julia
julia> h = histogram("a")
Dict{Any,Any} with 1 entry:
  'a' => 1
julia> get(h, 'a', 0)
1
julia> get(h, 'b', 0)
0
```
## Looping and Dictionaries

可以在for语句中遍历字典的键。例如，printhist打印每个键和相应的值
```julia
function printhist(h)
    for c in keys(h)
        println(c, " ", h[c])
    end
end
```
输出是这样的:
```julia
julia> h = histogram("parrot");

julia> printhist(h)
a 1
r 2
p 1
o 1
t 1
```
同样，键并没有特定的顺序。要按已排序的顺序遍历键值，可以结合`sort`和`collect`:
```julia
julia> for c in sort(collect(keys(h)))
           println(c, " ", h[c])
       end
a 1
o 1
p 1
r 2
t 1
```
## Reverse Lookup
给定字典d和键k，很容易找到对应的值v = d[k]。这个操作称为查找。

但是如果你有v，你想求k呢?您有两个问题:首先，可能有多个键映射到值v，这取决于应用程序，您可能可以选择一个键，或者您可能必须创建一个包含所有键的数组。其次，没有简单的语法来进行反向查找;你必须搜索。

下面是一个函数，它接受一个值，并返回映射到该值的第一个键:
```julia
function reverselookup(d, v)
    for k in keys(d)
        if d[k] == v
            return k
        end
    end
    error("LookupError")
end
```
这个函数是搜索模式的另一个例子，但它使用了一个我们以前没有见过的函数，error。error函数用于产生errorrexception，中断正常的控制流。在本例中，它有消息“LookupError”，表明一个键不存在。

如果我们到达循环的末尾，这意味着v没有作为一个值出现在字典中，因此我们抛出一个异常。

下面是一个成功的反向查找示例
```julia
julia> h = histogram("parrot");

julia> key = reverselookup(h, 2)
'r': ASCII/Unicode U+0072 (category Ll: Letter, lowercase)
```
和一个不成功的:
```julia
julia> key = reverselookup(h, 3)
ERROR: LookupError
```
生成异常时的效果与Julia抛出异常时是一样的:它打印一个stacktrace和一个错误消息。

Julia提供了一种优化的反向查找方法:

## Dictionaries and Arrays
数组可以作为字典中的值出现。例如，如果给你一个字典，从字母映射到频率，你可能想要倒转它;也就是说，创建一个从频率映射到字母的字典。由于可能有几个字母具有相同的频率，所以倒字典中的每个值都应该是一个字母数组。

这是一个对字典进行倒转的函数
```julia
function invertdict(d)
    inverse = Dict()
    for key in keys(d)
        val = d[key]
        if val ∉ keys(inverse)
            inverse[val] = [key]
        else
            push!(inverse[val], key)
        end
    end
    inverse
end
```
每次循环中，`key`都会从d中获取一个`key`，而`val`会获取相应的值。如果`val`不是逆函数，那就意味着我们以前没有见过它，因此我们创建一个新项，并使用`singleton`(包含单个元素的数组)初始化它。否则，我们以前见过这个值，所以我们将相应的键添加到数组中。

下面是一个例子
```julia
julia> hist = histogram("parrot");

julia> inverse = invertdict(hist)
Dict{Any,Any} with 2 entries:
  2 => ['r']
  1 => ['a', 'p', 'o', 't']
```

## Global Variables

在前面的例子中，已知是在函数外部创建的，所以它属于一个叫做Main的特殊框架。Main中的变量有时被称为全局变量，因为它们可以从任何函数访问。局部变量在函数结束时消失，与此不同，全局变量从一个函数调用持续到下一个函数调用。

通常使用全局变量作为标志;也就是说，指示(“标记”)条件是否为真的布尔变量。例如，一些程序使用一个名为`verbose`的标志来控制输出的详细程度:
```julia
verbose = true

function example1()
    if verbose
        println("Running example1")
    end
end
```
如果您试图重新分配一个全局变量，您可能会感到惊讶。下面的例子用来跟踪函数是否被调用:
```julia
been_called = false

function example2()
    been_called = true         # WRONG
end
```
但是如果你运行它，你会看到been_called的值没有改变。问题是example2创建了一个名为been_called的新的局部变量。局部变量在函数结束时消失，对全局变量没有影响。

要在函数中重新分配全局变量，必须在使用它之前声明该变量为global:
```julia
been_called = false

function example2()
    global been_called
    been_called = true
end
```
global语句告诉解释器:“在这个函数中，当我说been_called时，我指的是全局变量;不要创建本地的。”

下面是一个尝试更新全局变量的例子:
```julia
count = 0

function example3()
    count = count + 1          # WRONG
end
```
如果你运行它，你会得到
```julia
julia> example3()
ERROR: UndefVarError: count not defined
```
Julia假设count是局部的，在这个假设下，你在写之前先阅读它。同样，解决方案是声明count为全局的
```julia
count = 0

function example3()
    global count
    count += 1
end
```
如果一个全局变量指向一个可变的值，你可以修改这个值而不必声明这个变量为global:
```julia
known = Dict(0=>0, 1=>1)

function example4()
    known[2] = 1
end
```
因此，你可以添加、删除和替换全局数组或字典的元素，但如果你想重新分配变量，你必须声明它是全局的
```julia
known = Dict(0=>0, 1=>1)

function example5()
    global known
    known = Dict()
end
```
出于性能考虑，您应该声明一个全局变量常量。您不能再重新分配变量，但如果它指向一个可变的值，您可以修改该值。

```julia
const known = Dict(0=>0, 1=>1)

function example4()
    known[2] = 1
end
```







