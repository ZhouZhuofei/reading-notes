# Interpolation And Polynomial Approximation

***

***

[TOC]



## 3.1 nth Lagrange interpolating polynomial



### Theorem 3.1 Weierstrass Approximation Theorem

Suppose that f is defined and continuous on $[a, b]$. For each ε > 0, there exists a polynomial *P*(*x*), with the property that
$$
|f(x)-P(x)|<\epsilon, for \:all \: x \: in \: [a,b] 
$$




### nth Lagrange interpolating polynomial

If $x_{0},x_{1},x_{2},...,x_{n}$ are n+1 distinct numbers and f is a function whose values are given at these numbers, then a unique polynomial *P*(*x*) of degree at most *n* exists with
$$
f(x_{k})=P(x_{k}), for \quad each \quad k=0,1,2,...,n
$$
This polynomial is given by
$$
P(x)=f(x_{0})L_{n,0}(x)+...+f(x_{n})L_{n,n}(x)=\sum_{k=0}^{n}f(x_{k})L_{n,k}(x),
$$
Where, for each $k=0,1,2,...,n$
$$
\begin{align}
L_{n,k}(x)&=\frac{(x-x_{0})(x-x_{1})...(x-x_{k-1})(x-x_{x+1})...(x-x_{n})}{(x_{k}-x_{0})(x_{k}-x_{1})...(x_{k}-x_{k-1})(x_{k}-x_{k+1})...(x_{k}-x_{n})} \\
&=\prod_{i=0;i\ne k}^{n}\frac{(x-x_{i})}{(x_{k}-x_{i})}.
\end{align}
$$


### Theorem 3.3

Suppose $x^0, x^1, . . . , x^n$ are distinct numbers in the interval [*a*, *b*] and $f ∈ C^(n+1)[a, b]$. Then, for each *x* in [*a*, *b*], a number ξ(*x*) (generally unknown) between $x^0, x^1, . . . , x^n$, and hence in (*a*, *b*), exists with
$$
f(x)=P(x)+\frac{f^{(n+1)}(\xi(x))}{(n+1)!}(x-x_{0})(x-x_{1})...(x-x_{n}),
$$


**Proof**:

Wait.



## 3.2 Data Approximation and Neville's Method





### Definition 3.4

Let f be a function defined at $x_0,x_1,x_2,...,x_n$, and suppose that $m_1, m_2, ..., m_k$are *k* distinct integers, with $0 ≤ m_i ≤ n$ for each *i*. The Lagrange polynomial that agrees with f (*x*) at the *k* points $x_{m_{1}},x_{m_{2}},...,x_{m_{k}}$ is denoted $P_{m_{1},m_{2},...,m_{k}}(x)$.





### Theorem 3.5

Let $f$ be defined at $x_{0},x_{1},...,x_{k}$ and let $x_{i}$ and $x_{j}$ be two distinct numbers in this set. Then
$$
P(x)=\frac{(x-x_{j})P_{0,1,...,j-1,j+1,...,k}(x)-(x-x_{i})P_{0,1,...,i-1,i+1,...,k}(x)}{(x_{i}-x_{j})}
$$
is the kth Lagrange polynomial that interpolates f at the *k*+1 points $x_{0},x_{1},...,x_{k}$.

| $x_0$   | $P_{0}$ |           |             |               |                 |
| ------- | ------- | --------- | ----------- | ------------- | --------------- |
| $x_{1}$ | $P_{1}$ | $P_{0,1}$ |             |               |                 |
| $x_{2}$ | $P_{2}$ | $P_{1,2}$ | $P_{0,1,2}$ |               |                 |
| $x_{3}$ | $P_{3}$ | $P_{2,3}$ | $P_{1,2,3}$ | $P_{0,1,2,3}$ |                 |
| $x_{4}$ | $P_{4}$ | $P_{3,4}$ | $P_{2,3,4}$ | $P_{1,2,3,4}$ | $P_{0,1,2,3,4}$ |



To avoid the multiple subscripts, we let $Q_{i,j}(x)$, for 0 ≤ *j* ≤ *i*, denote the interpolating polynomial of degree *j* on the (*j* + 1) numbers $x_{i−j}, x_{i−j+1}, . . . ,x_{i−1}, x_i$; that is

$Q_{i,j}=P_{i-j,i-j+1,...,i-1,i}$ 



## 3.3 Divided Differences

Suppose that $P_{n}(x)$ is the *n*th Lagrange polynomial that agrees with the function $f$ at the distinct numbers $x_0 , x_1 , . . . , x_n$ . Although this polynomial is unique, there are alternate algebraic representations that are useful in certain situations. The divided differences of f with respect to $x_0, x_1, . . . , x_n$ are used to express $P_n(x)$ in the form
$$
P_{n}(x)=a_{0}+a_{1}(x-x_{0})+a_{2}(x-x_{0})(x-x_{1})+...+a_{n}(x-x_{0})...(x-x_{n-1}),
$$
So
$$
a_{0}=P_{n}(x_{0})=f(x_{0})
$$

$$
P_{n}(x_{1})=a_{0}+a_{1}(x-x_{0})=f(x_{1})
$$

⇥
$$
a_{1} = \frac{f(x_{1})-f(x_{0})}{x_{1}-x_{0}}.
$$
Define:$f[x_i]=f(x_i)$ ; $f[x_i,x_{i+1}]=\frac{f[x_{i+1}]-f[x_i]}{x_{i+1} - x_i}$;$f[x_{i},x_{i+1},x_{i+2}]=\frac{f[x_{i+1},x_{i+2}]-f[x_{i},x_{i+1}]}{x_{i+2} -x_{i}}$... so on

| $x_{0}$ | $f[x_{0}]$ |                                              |                                                        |                                                              |
| ------- | ---------- | -------------------------------------------- | ------------------------------------------------------ | ------------------------------------------------------------ |
| $x_{1}$ | $f[x_{1}]$ | $f[x_0,x_1]=\frac{f[x_1]-f[x_0]}{x_1-x_0}$   |                                                        |                                                              |
| $x_{2}$ | $f[x_{2}]$ | $f[x_1,x_2] = \frac{f[x_2]-f[x_1]}{x_2-x_1}$ | $f[x_0,x_1,x_2]=\frac{f[x_1,x_2]-f[x_0,x_1]}{x_2-x_0}$ |                                                              |
| $x_{3}$ | $f[x_{3}]$ | $f[x_2,x_3]=\frac{f[x_3]-f[x_2]}{x_3-x_2}$   | $f[x_1,x_2,x_3]=\frac{f[x_2,x_3]-f[x_1,x_2]}{x_3-x_1}$ | $f[x_0,x_1,x_2,x_3]=\frac{f[x_1,x_2,x_3]-f[x_0,x_1,x_2]}{x_3-x_0}$ |
| $x_{4}$ | $f[x_{4}]$ | $f[x_4,x_3]=\frac{f[x_4]-f[x_3]}{x_4-x_3}$   | $f[x_2,x_3,x_4]=\frac{f[x_3,x_4]-f[x_3,x_3]}{x_3-x_2}$ | ...                                                          |
| $x_5$   | $f[x_5]$   | $f[x_5,x_4]=\frac{f[x_5]-f[x_4]}{x_5-x_4}$   | $f[x_3,x_4,x_5]=\frac{f[x_4,x_5]-f[x_3,x_4]}{x_5-x_3}$ | ...                                                          |



### Theorem 3.6

Suppose that$ f ∈ C^n[a,b]$ and $x_0, x_1, . . . ,x_n $are distinct numbers in [*a*, *b*]. Then a number $\xi$ exists in (*a*, *b*) with
$$
f[x_0,x_1,...,x_n]=\frac{f^(n)(\xi)}{n!}
$$


### Forwrad Differences

The **Newton forward-differences formula**, is constructed by making use of the forward difference notation $\Delta$ introduced in Aiken's $\Delta^2$ method. With this notation
$$
f[x_0,x_1]=\frac{f(x_1)-f(x_0)}{x_1-x_0}=\frac1h(f(x_1)-f(x_0))=\frac1h\Delta f(x_0)
$$

$$
f[x_0,x_1,x_2]=\frac{1}{2h}(\frac{\Delta f(x_1)-\Delta f(x_0)}{h})=\frac{1}{2h^2}\Delta^2 f(x_0)
$$

and, in general,
$$
f[x_0,x_1,...,x_k]=\frac{1}{k!h^k}\Delta^{k}f(x_0)
$$
Since $f [x0 ] = f (x0 )$, Eq has the following form.

#### <span style="color:blue">Newton Forward-Difference Formula</span>

$$
P_n(x)=f(x_0)+\sum_{k=1}^{n}(_{k}^{s})\Delta^kf(x_0)
$$

#### <span style="color:blue">Newton Backward-Difference Formula</span>

$$
P_n(x)=f[x_n]+\sum_{k}^{n}(-1)^k(_{k}^{-s})\nabla^kf(x_n)
$$



## 3.4 Hermite interpolation

​	Suppose that we are given $n+1$ distinct number $x_0,x_1,...,x_n$ in $[a.b]$ and nonnegative integers $m_0,m_1,...,m_n$, and $m=max \{m_0,m_1,...,m_n\}$. The osculating polynomial approximating a function $f\in C^{m}[a,b]$ at $x_i$,for each $i=0,...,n$,is the polynomial of least degree that has the same values as the function $f$ and all its derivatives of oder less than or equal to $m_i$ at each $x_i$. The degree of this osculating polynomial is at most
$$
M = \sum_{i=0}^{n}m_i + n
$$
Because the number of conditions to be satisfied is $\sum_{i=0}^{n}m_i +(n+1)$, and a polynomial of degree M has M+1 coefficients that can be used to satisfy these conditions.



### Definition 3.8

Let $x_0,x_1,...,x_n$ be $n+1$ distinct numbers in $[a,b]$ and for $i=0,1,...,n $ let $m_i$ be a nonnegative integer. Suppose that $f\in C^{m}[a,b]$, where $m=max_{0\le i \le n}m_i$.

The osculating polynomial approximating f is the polynomial $P(x)$ of least degree such that:
$$
\frac{d^{k}P(x_i)}{dx^{k}} = \frac{d^{k}f(x_i)}{dx^{k}}, for \: each \: i=0,1,...,n. \: and \: k=0,1,...,m_i
$$


### Hermite Polynomials

The case when $m_i=1$, for each $i=0,1,...,n$,gives the Hermite Polynomials.

If $f\in C^{1}[a,b]$ and $x_0,x_1,...,x_n \in [a,b]$ are distinct, the unique polynomial of least degree agreeing with $f$ and $f'$ at $x_0,...,x_n$ is the Hermite polynomial of degree at most $2n+1$ given by 
$$
H_{2n+1}(x) = \sum_{j=0}^{n}f(x_j)H_{n,j}(x)+\sum_{j=0}^{n}f'(x_j)\hat{H}_{n,j}(x),
$$
Where, for $L_{n,j}(x)$ denoting the jth Lagrange coefficient polynomial of degree n, we have
$$
H_{n,j}(x)=[1-2(x-x_j)L'_{n,j}(x_j)]L^2_{n,j}(x) \quad \hat{H}_{n,j}(x)=(x-x_j)L^2_{n,j}(x).
$$
Moreover, if $f\in C^{2n+2}[a,b]$, then
$$
f(x)=H_{2n+1}(x) + \frac{(x-x_0)^2...(x-x_n)^2}{(2n+2)!}f^{2n+2}(\xi(x))
$$
for some (generally unkown) $xi(x)$ in the interval (a,b).



**Proof**:

First recall that:
$$
\begin{eqnarray}

L_{n,j}(x_j)=
\begin{cases}
0 & if\: i\ne j \\
1   & if \: i=j
\end{cases}
\end{eqnarray}
$$
Hence when $i\ne j$,

$H_{n,j}(x_i)=0$ And $\hat{H}_{n,j}(x_i)=0$, whereas, for each i,

$H_{n,i}(x_i)=[1-2(x_i-x_i)L'_{n,i}(x_i)]\cdot1$

and

$\hat{H}_{n,i}=(x_i-x_i)\cdot 1^2=0$

As a consequence
$$
H_{2n+1}(x_i)=\sum_{j=0\\j\ne i}^{n}f(x_j)\cdot0+f(x_i)\cdot1+\sum_{j=0}^{n}f'(x_j)\cdot0=f(x_i)
$$
So $H_{2n+1}$ agree with $f$ at $x_0,x_1,...,x_n$.

To show the agreement of $H'_{2n+1}$ with $f'$ at the nodes, first note that $L_{n,j}(x)$ is a factor of $H'_{n,j}(x)$, so $H'_{n,j}(x_i)=0$ when $i \ne j$. In addition, when $i=j$ we have $L_{n,i}(x_i)=1$, so
$$
\begin{align}
H'_{x,i}(x_i)&=-2L'_{n,i}(x_i)\cdot L^2_{n,i}(x_i)+[1-2(x_i-x_i)L'_{n,i}(x_i)]\\
&=-2L'_{n,i}(x_i)+2L'_{n,i}(x_i)=0
\end{align}
$$
Hence,$H'_{n,j}(x_i)=0$ for all i and j.

Finally.
$$
\begin{align}
\hat{H}'_{n,j}(x_i)&=L^2_{n,j}(x_i)+(x_i-x_j)2L_{n,j}(x_i)L'_{n,j}(x_i)\\
&=L_{n,j}(x_i)[L_{n,j}(x_i)+2(x_i-x_j)L'_{n,j}(x_i)]
\end{align}
$$
So $\hat{H}'_{n,j}(x_i) = 0$ if $i \ne j$ and $\hat{H}'_{n,i}(x_i)=1$. Combining these facts, we have
$$
H'_{2n+1}(x_i)=\sum_{j=0}^{n}f(x_j)\cdot0+\sum_{j=0\\j\ne i}^{n}f'(x_j)\cdot0+f'(x_i)\cdot1=f'(x_i)
$$
Therefore, $H_{2n+1}$ agrees with $f$ and $H'_{2n+1}$ with $f'$ at $x_0,x_1,...,x_n.$



==**Example**==:

Use the Hermite polynomial that agrees with the data listed in Table 3.15 to find an approximation of f (1.5).

| k    | $x_k$ | $f(x_k)$  | $f'(x_k)$  |
| ---- | ----- | --------- | ---------- |
| 0    | 1.3   | 0.6200860 | -0.5220232 |
| 1    | 1.6   | 0.4554022 | -0.5698959 |
| 2    | 1.9   | 0.2818186 | -0.5811571 |

**Solution**:

We first compute the Lagrange polynomials and their derivatives. This gives:
$$
L_{2,0}=\frac{(x-x_1)(x-x_2)}{(x_0-x_1)(x_0-x_2)}=\frac{50}{9}x^2-\frac{175}{9}x+\frac{152}{9},
$$

$$
L'_{2,0}(x)=\frac{100}{9}x-\frac{175}{9}
$$

$$
L_{2,1}=\frac{(x-x_0)(x-x_2)}{(x_1-x_0)(x_1-x_2)}=\frac{-100}{9}x^2+\frac{320}{9}x-\frac{247}{9}
$$

$$
L'_{2,1}(x)=\frac{-200}{9}x+\frac{320}{9}
$$

$$
L_{2,2}=\frac{(x-x_0)(x-x_1)}{(x_2-x_0)(x_2-x_1)}=\frac{50}{9}x^2-\frac{145}{9}x+\frac{104}{9}
$$

$$
L'_{2,2}=\frac{100}{9}x-\frac{145}{9}
$$

$H_{2,j}(x)$ and $\hat{H}_{2,j}(x)$

$$
\begin{align}
H_{2,0}(x)&=[1-2(x-1.3)(-5)](\frac{50}{9}x^2-\frac{175}{9}x+\frac{152}{9})^2\\
&=(10x-12)(\frac{50}{9}x^2-\frac{175}{9}x+\frac{152}{9})^2
\end{align}
$$

$$
H_{2,1}(x)=1 \cdot (-\frac{100}{9}x^2+\frac{320}{9}x-\frac{247}{9})^2
$$

$$
H_{2,2}(x)=10(2-x)(\frac{50}{9}x^2-\frac{145}{9}x+\frac{104}{9})^2
$$

$$
H'_{2,0}(x)=(x-1.3)(\frac{50}{9}x^2-\frac{175}{9}x+\frac{152}{9})^2
$$

$$
H'_{2,1}(x)=(x-1.6)(-\frac{100}{9}x^2+\frac{320}{9}x-\frac{247}{9})^2
$$

$$
H'_{2,2}(x)=(x-1.9)(\frac{50}{9}x^2-\frac{145}{9}x+\frac{104}{9})^2
$$

Finally:
$$
H_5(x)=0.6200860H_{2,0}(x)+0.4554022H_{2,1}(x)+0.2818186H_{2,2}(x)-0.5220232H'_{2,0}(x)-0.5698959H'_{2,1}(x)-0.5811571H'_{2,2}(x)
$$



## 3-5 Cubic Spline Interpolation

用单次多项式逼近函数，高次多项式会震荡不规律。

另一种方法是将逼近区间划分为一组子区间，并在每个子区间上构造一个(通常)不同的逼近多项式。这叫做分段多项式近似。（An alternative approach is to divide the approximation interval into a collection of subintervals and construct a (generally) different approximating polynomial on each sub- interval. This is called piecewise-polynomial approximation.）



**Piecewise-polynomial approximation**(分段多项式近似)

最简单的是线性插值（缺点：可能没有差异，这样的差值可能不是平滑的，通常要求需要平滑）

另一种方法是使用埃尔米特型的分段多项式。在区间段中使用。（但是，使用埃尔米特型插值，需要知道其导数）

最常见的分段多项式逼近在每对连续节点之间使用三次多项式，称为三次样条插值。一般的三次多项式包含四个常数，因此三次样条曲线具有足够的灵活性，以保证插值不仅在区间上连续可微，而且具有连续的二阶导数。然而，三次样条的构造并不假设插值函数的导数与它所逼近的函数的导数一致，甚至在节点处也是如此。(参见图3.8)。

==Example==

Construct a natural cubic spline that passes through the points (1, 2), (2, 3), and (3, 5).
$$
S_0(x)=a_0 + b_0(x-1)+c_0(x-1)^2+d_0(x-1)^3
$$

$$
S_1(x)=a_1+b_1(x-2)+c_1(x-2)^2+d_1(x-2)^3
$$

$2=f(1)=a_0$,$3=f(2)=a_0+b_0+c_0+d_0$,$3=f(2)=a_1$,$5=f(3)=a_1+b_1+c_1+d_1$.

$S'_0(2)=S'_1(2)$: $b_0+2c_0+3d_0=b1$, and :

$S''_0(2)=S''_1(2)$: $2c_0+6d_0=2c_1$

The final two come from the natural boundary conditions:

$S''_0(1)=0$:$2c_0=0$ and $S''_1(3)=0$:$ 2c_1+6d_1=0$

x in [1,2]:

$S(x)=2+3/4*(x-1)+1/4*(x-3)^3$

x in [2,3]

$S(x)=3+3/2*(x-2)+3/4*(x-2)-1/4*(x-2)^3$



在每个区间用一个三阶多项式拟合，保证端点的函数值等于给定值，同时两个区间之间共用点的导数一致。



## 3-6 Parametric Curves

有些曲线不能用函数表示，可以利用参数方程对曲线进行拟合

已知$(x_0,y_0),(x_1,y_1),...,(x_n,y_n)$.使用参数$t\in [t_0,t_n],t_0<t_1<...<t_n$,(一般，$t\in[0,1]$)

然后$x_i=x(t_i),y_i=y(t_i)$ for each i = 0,1,2,...,n

x,y使用 Lagrange interpolating polynomials 估计



同样可以使用参数分段拟合，例如在区间$[0,1]$，

$x(0)=x_0,x(1)=x_1,y(0)=y_0,y(1)=y_1$

一般需要知道$x'(0),x'(1),y'(0),y'(1)$.

也可以使用引导点(guidepoint，不同的引导点会改变曲线形状),

guidepoint for$(x_0, y_0)$ is $(x_0 + α_0, y_0 + β_0)$, and the guidepoint for $(x_1, y_1)$ is $(x_1 − α_1, y_1 − β_1)$.

$x(0) = x_0, x(1) = x_1, x′(0) = α_0, and\: x′(1) = α_1,y'(0)=\beta_0,y'(1)=\beta_1$.

则：
$$
x(t)=[2(x_0-x_1)+(\alpha_0+\alpha_1)]t^3+[3(x_1-x_0)-(\alpha_1+2\alpha_0)]t^2+\alpha_0t+x_0\\
y(t)=[2(y_0-y_1)+(\beta_0+\beta_1)]t^3+[3(y_1-y_0)-(\beta_1+2\beta_0)]t^2+\beta_0t+y_0
$$
不同的引导点：

<img src="/Users/zhouzhuofei/wen/assets/截屏2020-08-14 11.39.28.png" alt="截屏2020-08-14 11.39.28" style="zoom:50%;" />

