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

