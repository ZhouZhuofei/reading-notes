# Numerical Differentiation and Integration

[TOC]



## Numerical differentiation



The derivative of the function $f$ at $x_0$ is:
$$
f'(x_0)=lim_{h\to 0}\frac{f(x_0+h)-f(x_0)}{h}
$$
To approximate $f'(x_0)$,we suppose first that $x_0 \in (a,b)$, where $f \in C^2[a,b]$, and that $x_1=x_0+h$,for some $h \ne 0$.$x_1 \in (a,b)$.we construct the first Lagrange Polynomial $P_{0,1}(x)$ for $f$ determined by $x_0$ and $x_1$.
$$
\begin{align}
f(x) &=P_{0,1}(x)+\frac{(x-x_0)(x-x_1)}{2!}f''(\xi(x))\\
&=\frac{f(x_0)(x-x_0-h)}{-h}+\frac{f(x_0+h)(x-x_0)}{h}+\frac{(x-x_0)(x-x_0-h)}{2}f''(\xi(x))
\end{align}
$$
Differentiation:
$$
\begin{align}
f'(x)=\frac{f(x_0)}{-h}+\frac{f(x_0+h)}{h}+\frac{2(x-x_0)-h}{2}f''(\xi(x))+\frac{(x-x_0)(x-x_0-h)}{2}D_x(f''(\xi(x)))
\end{align}
$$
So:
$$
f'(x) \approx \frac{f(x_0+h)-f(x_0)}{h}
$$
when x=x_0.
$$
f'(x_0)=\frac{f(x_0+h)-f(x_0)}{h}-\frac h2 f''(\xi(x))
$$
For small values of $h$, the difference quotient $[f(x_0+h)-f(x_0)]/h$ can be used to approximate $f'(x_0)$ with an error bounded by $M\frac h2$.This formula is konwn as the **forward-difference formula** if $h>0$,and the **backward-difference formula** if $h <0$.



Suppose that ${x_0,x_1,...,x_n}$ are distinct numbers in some interval $I$ and that $f \in C^{n+1}(I)$.
$$
f(x)=\sum_{k=0}^{n}f(x_k)L_{k}(x)+\frac{(x-x_0)(x-x_1)...(x-x_n)}{(n+1)!}f^{(n+1)}(\xi(x))
$$
So:
$$
f'(x)=\sum_{k=0}^{n}f(x_k)L'_k(x)+D_x[\frac{(x-x_0)(x-x_1)...(x-x_n)}{(n+1)!}]f^{(n+1)}(\xi(x))+\frac{(x-x_0)(x-x_1)...(x-x_n)}{(n+1)!}D_x[f^{(n+1)}(\xi(x))]
$$
we again have a problem estimating the truncation error unless $x$ is one of the numbers $x_j$.so $D_x[f^{(n+1)}(\xi(x))]=0$.
$$
f'(x)=\sum_{k=0}^{n}f(x_k)L'_k(x)+\frac{f^{(n+1)}(\xi(x))}{(n+1)!}\prod_{k=0 \\k\ne j}^{n}(x_j-x_k)
$$

**Three-Point Formula**

$x_1=x_0+h$,and $x_2=x_0+2h$, for some $h\ne0$
$$
f'(x_0)=\frac 1h [-\frac 32 f(x_0)+2f(x_1)-\frac12f(x_2)]+\frac{h^2}{3}f^{(3)}(\xi_0)
$$

$$
f'(x_1)=\frac 1h[-\frac 12f(x_0)+\frac12f(x_2)]-\frac{h^2}{6}f^{(3)}(\xi_1)
$$

$$
f'(x_2)=\frac1h[\frac12f(x_0)-2f(x_1)+\frac32f(x_2)]+\frac{h^2}{3}f^{(3)}(\xi_2)
$$

**Five-point Midpoint Formula**
$$
f'(x_0)=\frac{1}{12h}[f(x_0-2h)-8f(x-h)+8f(x_0+h)-f(x_0+2h)]+\frac{h^4}{30}f^5(\xi)
$$
where $ξ$ lies between $x_0 − 2h$ and $x_0 + 2h$.

**Five-point Endpoint Formula**
$$
f'(x_0)=\frac{1}{12h}[-25f(x_0)+48f(x_0+h)-36f(x_0+2h)+16f(x_0+3h)-3f(x_0+4h)]+\frac{h^4}{5}f^{(5)}(\xi)
$$
Where $\xi$ lies between $x_0$ and $x_0+4h$.



Expand a function $f$ ina third Taylor polynomial about a point $x_0$ and evaluate at $x_0+h$ and $x_0-h$. Then 
$$
f(x_0+h)=f(x_0)+f'(x_0)h+\frac12f''(x_0)h^2+\frac{1}{6}f'''(x_0)h^3+\frac{1}{24}f^{(4)}(\xi_1)h^4
$$
and
$$
f(x_0-h)=f(x_0)-f'(x_0)h+\frac{1}{2}f''(x_0)h^2-\frac16f'''(x_0)h^3+\frac{1}{24}f^{(4)}(\xi_{-1})h^4
$$
Where $x_0-h<\xi_{-1}<x_0<\xi_1<x_0+h$
$$
f(x_0+h)+f(x_0-h)=2f(x_0)+f''(x_0)h^2+\frac{1}{24}[f^{(4)}(\xi_1)+f^{(4)}(\xi_{-1})]h^4
$$
so
$$
f''(x_0)=\frac{1}{h^2}[f(x_0-h)-2f(x_0)+f(x_0+h)]-\frac{h^2}{24}[f^{(4)}(\xi_1)+f^{(4)}(\xi_{-1})]
$$
Suppose $f^{(4)}$ is continuous on $[x_0-h,x_0+h]$.Since $\frac12[f^{(4)}(\xi_1)+f^{(4)}(\xi_{-1})]$ is between $f^{(4)}(\xi_1)$ and $f^{(4)}(\xi_{-1})$, the Intermediate Value Theorem implies that a number $\xi$ exists between $\xi_1$ and $\xi_{-1}$, and hence in $(x_0-h,x_0+h)$, with
$$
f^{(4)}(\xi)=\frac12[f^{(4)}(\xi_1)+f^{(4)}(\xi_{-1})]
$$
So **Second Derivative Midpoint Formula**
$$
f''(x_0)=\frac{1}{h^2}[f(x_0-h)-2f(x_0)+f(x_0+h)]-\frac{h^2}{12}f^{(4)}(\xi)
$$
for some $\xi$, where $x_0-h<\xi<x_0+h$



**Round-Off Error Instability**
$$
f'(x_0)=\frac{1}{2h}[f(x_0+h)-f(x_0-h)]-\frac{h^2}{6}f^{(3)}(\xi_1)
$$


## Richardson's Extrapolation

​	extrapolation can be applied whenever it is known that an approximation technique has an error term with a predictable form, one that depends on a parameter, usually the step size $h$.Suppose that for each number $h\ne 0$ we have a formula $N_1(h)$ that approximates an unknown constant $M$, and that the truncation error involved with the approximation has the form
$$
M-N_1(h)=K_1h+K_2h^2+K_3h^3+...
$$
for some collection of unknown constants $K_1,K_2,K_3...$.

> truncation(截断，切断顶端)

The truncation error is $O(h)$, so unless there was a large variation in magnitude among the constants $K_1,K_2,K_3,...$,
$$
M-N_1(0.1)\approx 0.1K_1, \quad M-N_1(0.01)\approx 0.01K_1
$$
and, in general, $M-N_1(h)\approx K_1 h$.

The object of extrapolation is to find an easy way to combine these rather inaccurate $O(h)$ approximations in appropriate way to produce formulas with a higher-order truncation error.

Suppose, for example, we can combine the $N_1(h)$ formulas to produce an $O(h^2)$ approximation formula, $N_2(h)$, for $M$ with
$$
M-N_2(h)=\hat{K_2}h^2+\hat{K_3}h^3+...,
$$
for some, again unknown, collection of constants $\hat{K_2},\hat{K_3},..$ Then we would have:
$$
M-N_2(0.1)\approx 0.01\hat{K_2}, \quad M-N_2(0.01)\approx0.0001\hat{K_2}
$$
and so on.If the constants $K_1$ and $\hat{K_2}$ are roughly of the same magnitude, then the $N_2(h)$ approximations would be much better than the corresponding $N_1(h)$ approximations, The extrapolation continues by combining the $N_2(h)$ approximations in a manner that produces formulas with $O(h^3)$ truncation error, and so on.
$$
M=N_1(h)+K_1(h)+K_2h^2+k_3h^3+...
$$
so we replace the parameter *h* by half its

value. Then we have a second *O*(*h*) approximation formula
$$
M=N_1(\frac h2)+K_1\frac h2 +K_2\frac{h^2}{4}+K_3\frac{h^3}{8}+...
$$

$$
2(N_1(\frac h2)+K_1\frac h2+K_2\frac{h^2}{4}+K_3\frac{h^3}{8}+...)-N_1(h)-K_1(h)-K_2(h^2)-...=M
$$

So:
$$
M=N_1(\frac h2)+[N_1(\frac h2)-N_1(h)]+K_2(\frac{h^2}{2}-h^2)+K_3(\frac{h^3}{4}-h^3)+...
$$
Define

$N_2(h)=N_1(\frac h2)+[N_1(\frac h2)-N_1(h)]$

$M=N_2(h)-\frac{K_2}{2}h^2-\frac{3K_3}{4}h^3-...$

**For example**:

$h=0.1:f'(1.8)\approx 0.5406722, and\quad h=0.05: f'(1.8)\approx 0.5479795$

So implies that

$N_1(0.1)=0.5406722, N_1(0.05)=0.5479795$

$N_2(0.1)=N_1(0.05)+(N_1(0.05)-N_1(0.1))=0.555287$



同理:

$M=N_1(h)+K_1h^2+K_2h^4+K_3h^6+...$-1

$M=N_1(\frac h2)+K_1\frac{h^2}{4}+K_2\frac{h^4}{16}+K_3\frac{h^6}{64}+...$-2

4 * 2-1:

$3M=[4N_1(\frac h2)-N_1(h)]+K_2(\frac{h^2}{4}-h^4)+...$

Defining :

$N_2(h)=\frac 13[4N_1(\frac h2)-N_1(h)]=N_2(\frac h2)+\frac13[N_1(\frac h2)-N_1(h)]$

if we get:

$15M=[16N_2(\frac h2)-N_2(h)]+...$

So we define:

$N_j(h)=N_{j-1}(\frac h2)+\frac{N_{j-1}(h/2)-N_{j-1}(h)}{4^{j-1}-1}$



## Elements of Numerical Integration

The basic idea is to select a set of distinct nodes $x_0,x_1,x_2,...,x_n$ from the interval $[a,b]$.Then integrate the Lagrange interpolating polynomial
$$
P_n(x)=\sum_{i=0}^{n}f(x_i)L_i(x)
$$

$$
\begin{align}
\int_a^b f(x)dx&=\int_a^b \sum_{i=0}^{n}f(x_i)L_i(x)dx+\int_a^b \prod_{i=0}^{n}(x-x_i)\frac{f^{(n+1)}(\xi(x))}{(n+1)!}dx\\
&=\sum_{i=0}^na_if(x_i)+\frac{1}{(n+1)!}\int_a^b\prod_{i=0}^{n}(x-x_i)f^{(n+1)}(\xi(x))dx
\end{align}
$$

Among them:$a_i=\int_a^b L_i(x)dx$

Therefore:$\int_a^b f(x)dx\approx \sum_{i=0}^{n}a_if(x_i)$

Error given by:$E(f)=\frac{1}{(n+1)!}\int_a^b \prod_{i=0}^{n}(x-x_i)f^{(n+1)}(\xi(x))dx$



**Trapezoidal Rule**
$$
\int_a^bf(x)dx=\frac h2 [f(x_0)+f(x_1)]-\frac{h^3}{12}f''(\xi)
$$
Proof:
Let $x_0=a,x_1=b,h=b-a$.

So
$$
P_1(x)=\frac{(x-x_1)}{(x_0-x_1)}f(x_0)+\frac{(x-x_0)}{(x_1-x_0)}f(x_1)
$$
Then :
$$
\begin{align}
\int_a^bf(x)dx&=\int_a^b P_1(x)dx+\frac 12\int_a^bf''(\xi(x))(x-x_0)(x-x_1)dx\\
&=[\frac{(x-x_1)^2}{2(x_0-x_1)}f(x_0)+\frac{(x-x_0)^2}{2(x_1-x_0)}f(x_1)]|_a^b+\frac 12f''(\xi(x))[\frac{x^3}{3}-\frac{(x_1+x_0)}{2}x^2+x_0x_1x]|_a^b\\
&=\frac{(x_1-x_0)}{2}[f(x_0)+f(x_1)]-\frac{h^3}{12}f''(\xi)
\end{align}
$$


**Simpson’s Rule**

Let $x_0=a,x_1=a+h,x_2=b,h=\frac{b-a}{2}$
$$
\int_{x_0}^{x_1}f(x)dx=\frac h3 [f(x_0)+4f(x_1)+f(x_2)]-\frac{h^5}{90}f^{(4)}(\xi)
$$


In a conclusion :

***Theorem***

Suppose that $\sum_{i=0}^{n}a_if(x_i)$ denotes the $(n+1)$-point closed Newton-Cotes Formula with $x_0=a,x_n=b,h=\frac{(b-a)}{n}$,There is $\xi$ in $[a,b]$ for which:
$$
\int_a^bf(x)dx=\sum_{i=0}^{n}a_if(x_i)+\frac{h^{n+3}f^{(n+2)}(\xi)}{(n+2)!}\int_0^nt^2(t-1)...(t-n)dt
$$
if n is even and $f\in C^{(n+2)}[a,b]$
$$
\int_a^bf(x)dx=\sum_{i=0}^{n}a_if(x_i)+\frac{h^{n+2}f^{(n+1)}(\xi)}{(n+1)!}\int_0^nt(t-1)...(t-n)dt
$$
n=1:Trapezoidal rule

n=2:Simpson’s rule

n=3:Simpson’s Three-Eighths rule

n=4:
$$
\int_{x_0}^{x_4}f(x)dx=\frac{2h}{45}[7f(x_0)+32f(x_1)+12f(x_2)+32f(x_3)+7f(x_4)]-\frac{8h^7}{945}f^{(6)}(\xi)
$$


***Open Newton Cotes Formula***:don't include the endpoint $[a,b]$.

nodes $x_i =x_0+ih$,for each $i=0,1,...,n$

Suppose that $\sum_{i=0}^{n}a_if(x_i)$ denotes the $(n+1)$-point closed Newton-Cotes Formula with $x_0=a+h,x_n=b-h,h=\frac{(b-a)}{n+2}$,There is $\xi$ in $[a,b]$ for which:
$$
\int_a^bf(x)dx=\sum_{i=0}^{n}a_if(x_i)+\frac{h^{n+3}f^{(n+2)}(\xi)}{(n+2)!}\int_{-1}^{n+1}t^2(t-1)...(t-n)dt
$$
if n is even:
$$
\int_a^bf(x)dx=\sum_{i=0}^{n}a_if(x_i)+\frac{h^{n+2}f^{(n+1)}(\xi)}{(n+1)!}\int_{-1}^{n+1}t(t-1)...(t-n)dt
$$
n=0:Midpoint rule
$$
\int_{x_{-1}}^{x_1}f(x)dx=2hf(x_0)+\frac{h^3}{3}f''(\xi)
$$
n=1:
$$
\int_{x_{-1}}^{x_2}f(x)dx=\frac{3h}{2}[f(x_0)+f(x_1)]+\frac{3h^3}{4}f''(\xi)
$$
n=2:
$$
\int_{x_{-1}}^{x_3}f(x)dx=\frac{4h}{3}[2f(x_0)-f(x_1)+2f(x_2)]+\frac{14h^5}{45}f^{(4)}(\xi)
$$
n=3:
$$
\int_{x_{-1}}^{x_4}f(x)dx=\frac{5h}{24}[11f(x_0)+f(x_1)+f(x_2)+11f(x_3)]+\frac{95h^5}{144}f^{(4)}(\xi)
$$

## Composite Numerical Integration



The Newton-Cotes Formulas are generally unsuitable for use over large integration intervals.

So we use the lower-order Newton-Cotes formulas.

For example:

Approximate $\int_0^4 e^x dx$.

1. $\int_0^4 e^x dx \approx \frac 23 (e^0+4e^2+e^4)=56.76958$, error =  −3.17143.
2. Use $\int_0^2 e^xdx,\int_2^4e^xdx$ to approximate, error = −0.26570.
3. Use $\int_0^1e^xdx,\int_1^2e^xdx,\int_2^3e^xdx,\int_3^4e^xdx$ to approximate, error= −0.01807

分段使用Simpson's rule估计

So with $h=(b-a)/n$ and $x_j=a+jh$ for each $j=0,1,2,...,n$
$$
\begin{align}
\int_a^b f(x)dx &=\sum_{j=1}^{n/2}\int_{x_{2j-2}}^{x_{2j}}f(x)dx\\
&=\sum_{j=1}^{n/2}\{\frac{h}{3}[f(x_{2j-2})+4f(x_{2j-1})+f(x_{2j})]-\frac{h^5}{90}f^{(4)}(\xi_j)\}
\\
&=\frac{h}{3}[f(x_0)+2\sum_{j=1}^{(n/2)-1}f(x_{2j})+4\sum_{j=1}^{n/2}f(x_{2j-1})+f(x_n)]-\frac{h^5}{90}\sum_{j=1}^{n/2}f^{(4)}(\xi_j)
\end{align}
$$
for some $\xi_j$ with $x_{2j-2}<\xi_j<x_{2j}$, provided that $f \in C^{4}[a,b]$ 

Error approximation:
$$
E(f)=-\frac{h^5}{90}\sum_{j=1}^{n/2}f^{(4)}(\xi_j)
$$
$x_{2j-2}<\xi_j<x_{2j}$, for each $j=1,2,...,n/2$.

$min_{x\in[a,b]}f^{(4)}(x)\leq f^{(4)}(\xi_j)\leq max_{x\in [a,b]}f^{(4)}(x)$

so 

$\frac n2 min_{x\in[a,b]}f^{(4)}(x)\leq \sum_{j=1}^{n/2}f^{(4)}(\xi_j)\leq \frac{n}{2}max_{x\in [a,b]}f^{(4)}(x)$

and

$min_{x\in[a,b]}f^{(4)}(x)\leq \frac{2}{n} \sum_{j=1}^{n/2}f^{(4)}(\xi_j)\leq max_{x\in [a,b]}f^{(4)}(x)$

By the intermediate Value Theorem,$\mu \in [a,b]$.such that:
$$
f^{(4)}(\mu)=\frac 2n \sum_{j=1}^{n/2}f^{(4)}(\xi_j)
$$
Thus $E(f)$
$$
E(f)=-\frac{h^5}{90}\sum_{j=1}^{n/2}f^{(4)}(\xi_j)=-\frac{h^5}{180}nf^{(4)}(\mu)
$$
Since $h=(b-a)/n$
$$
E(f)=-\frac{h^5}{180}nf^{(4)}(\mu)=-\frac{(b-a)}{180}h^4f^{(4)}(\mu)
$$




**Theorem**

Let $f\in C^2[a,b],h=(b-a)/n$ and $x_j=a+jh$, for each $j=0,1,...,n$. There exists a $\mu \in (a,b)$ for which the **Composite Trapezoidal rule** for *n* subintervals can be written with its error term as 
$$
\int_a^bf(x)dx=\frac h2 [f(a)+2\sum_{j=1}^{n-1}f(x_j)+f(b)]-\frac{(b-a)}{12}h^2f''(\mu)
$$
**Theorem**

Let $f\in C^2[a,b],h=(b-a)/(n+2)$ and $x_j=a+(j+1)h$ for each$ j=-1,0,1,..n+1$ There exists a $μ ∈ (a,b)$ for which the **Composite Midpoint rule** for *n* + 2 subintervals can be written with its error term as
$$
\int_a^bf(x)dx=2h\sum_{j=0}^{n/2}f(x_{2j})+\frac{b-a}{6}h^2f''(\mu)
$$


***

## Exercise Set

1.

a. $\int_1^2 xlnx dx, n=4$ $h=(2-1)/4=\frac 14$ So $\int_1^2 xlmx dx \approx \frac 18[1ln1+2(f(1+1/4)+f(1+1/2)+f(1+3/4))+f(2)]$ 

$f(\frac 54)=\frac 54 ln \frac 54=0.278929$,$f(\frac 32)=\frac 32 ln \frac 32=0.608198$,$f(\frac 74)=\frac 74 ln \frac 74=0.979328$,$f(1)=1ln1=0$,$f(2)=2ln2=1.386294$

$Result=0.6399005$

b.$\int_{-2}^{2}x^3 e^x dx, n=4$, $h=(2-(-2))/4=1$, $\frac 12 [f(-2)+f(2)+2(f(-1)+f(0)+f(1))]$

$Result=31.365286$

c.$\int_0^2 \frac{2}{x^2+4}dx, n=6$ So$h=(2-0)/6=\frac 13$, $\frac 16[f(0)+f(2)+2(f(\frac 13)+f(\frac 23)+f(1)+f(\frac43)+f(\frac53)]$ 

$Result = 0.784241$

***

## Romberg integration

we showed that for $h=(b-a)/n$ and $x_j = a+ jh$. We have :
$$
\int_a^b f(x) dx = \frac h2 [f(a) + 2\sum_{j=1}^{n-1}f(x_j)+f(b)]-\frac{(b-a)f''(\mu)}{12}h^2.
$$
for some number $\mu$ in $(a,b)$.

If $f \in C^{\infty}[a,b]$,The composite Trapezoidal rule can also written with an error term in the form:
$$
\int_a^b f(x)dx = \frac h2[f(a) + 2\sum_{j=1}^{n-1}f(x_j)+f(b)]+K_1h^2+K_2h^4+K_3h^6+\cdots,
$$


By Richardson extrapolation: 
$$
\sum_{j=1}^{m-1}K_jh^{\alpha j} + O(h^{2m})
$$
by this foumula:
$$
R_{k,j}=R_{k,j-1}+\frac{1}{4^{j-1}-1}(R_{k,j-1} - R_{k-1,j-1}), for \: k=j,j+1,...
$$
For example:

approximating $\int_{0}^{\pi}sinxdx$.
$$
\begin{align}
R_{1,1} = \frac{\pi}{2}[\sin0 + \sin \pi] = 0
\end{align}
$$

$$
R_{2,1} = \frac{\pi}{4}[\sin0+2\sin\frac{\pi}{2}+sin \pi]=1.57079633
$$

and so on:
$$
R_{5,1}=\frac{\pi}{32}[\sin 0+2(\sin\frac{\pi}{16}+\sin\frac{\pi}{8}+\cdots+\sin\frac{15\pi}{16})+\sin \pi]=1.99357034
$$
The $O(h^4)$ approximations are:
$$
R_{2,2} = R_{2,1}+\frac 13(R_{2,1}-R_{1,1})=2.09439511;R_{3,2}=R_{3,1}+\frac 13(R_{3,1}-R_{2,1})=2.00455976;\\
R_{4,2}=R_{4,1}+\frac13(R_{4,1}-R_{3,1})=2.00026917;R_{5,2}=R_{5,1}+\frac13(R_{5,1}-R_{4,1})=1.99357034.
$$
follwing the fomula:

so on:

$O(h^{10})$:
$$
R_{5,5} = R_{5,4}+\frac{1}{255}(R_{5,4}-R_{4,4}) = 1.99999999
$$


***Julia code for the way***:



```julia
function romberg(a,b,f,n)
    h = (b-a)
    result = zeros(n,n)
    result[1,1] = (f(a)+f(b))*h/2
    for i = 2:n
        w = f(a)+f(b)
        for j = 1:(2^(i-1)-1)
            w = w + 2*f(a+j*(h/2^(i-1)))
        end
        result[i,1] = w*(h/2^i)
    end
    for i = 2:n
        for j = i:n
            result[j,i] = result[j,i-1]+(1/(4^(i-1)-1))*(result[j,i-1]-result[j-1,i-1])
        end
    end
    return result
end

f(x) = sin(x)
print(romberg(0,π,f,5))
#=
5×5 Array{Float64,2}:
 1.92367e-16  0.0      0.0      0.0      0.0
 1.5708       2.0944   0.0      0.0      0.0
 1.89612      2.00456  1.99857  0.0      0.0
 1.97423      2.00027  1.99998  2.00001  0.0
 1.99357      2.00002  2.0      2.0      2.0
=#

```



## Adaptive Quadrature Methods



> How can we determine what technique should be applied on various portions of the interval of integration, and how accurate can we expect the final approximation to be?



We consider an adaptive quadrature method and see how it can be used to reduce approximation error and also predict an error estimate for the approximation that does not rely on knowledge of higher derivatives of the function.

​	Suppose that we want to approximate $\int_a^b f(x)dx$ to within a specified tolerance $\varepsilon>0$. The first step is to apply Simpson's rule with step size $h=(b-a)/2$.
$$
\int_a^b f(x)dx = S(a,b)-\frac{h^5}{90}f^{(4)}(\xi), for \: some \: \xi \in(a,b)
$$
Where we denote the Simpson's rule approximation on $[a,b]$ by:
$$
S(a,b) = \frac h3 [f(a)+4f(a+h)+f(b)]
$$
The next step is to determine an accuracy approximation that does not require $f^{(4)} (ξ )$. To do this, we apply the Composite Simpson’s rule with $n = 4$ and step size $(b−a)/4 = h/2$, giving:
$$
\int_a^b f(x)dx=\frac h6[f(a)+4f(a+\frac h2)+2f(a+h)+4f(a+\frac{3h}{2})+f(b)]-(\frac h2)^4\frac{(b-a)}{180}f^{(4)}(\hat{\xi})
$$
To simplify notation, let:
$$
S(a,\frac{a+b}{2})=\frac h6[f(a)+4f(a+\frac h2)+f(a+h)];\\
S(\frac{a+b}{2},b)=\frac h6 [f(a+h)+4f(a+\frac{3h}{2})+f(b)];
$$
So:
$$
\int_a^b f(x)dx=S(a,\frac{a+b}{2})+S(\frac{a+b}{2},b)-\frac{1}{16}\frac{(h)^5}{90}f^{(4)}(\hat{\xi})
$$
The error estimation is derived by assuming that ξ ≈ ξ or, more precisely, that $f^{(4)}(\xi) \approx f^{(4)}(\hat{\xi})$


$$
S(a,\frac{a+b}{2})+S(\frac{a+b}{2},b)-\frac{1}{16}\frac{(h)^5}{90}f^{(4)}(\hat{\xi}) \approx S(a,b)-\frac{h^5}{90}f^{(4)}(\xi)\\
\frac{h^5}{90}f^{(4)}(\xi) \approx \frac{16}{15}[S(a,b)-S(a,\frac{a+b}{2})-S(\frac{a+b}{2},b)]\\
|\int_a^b f(x)dx - S(a,\frac{a+b}{2})-S(\frac{a+b}{2},b)|\approx \frac{1}{16}\times \frac{h^5}{90}f^{(4)}(\xi)
$$
So, Thus, if:
$$
\\
|S(a,b)-S(a,\frac{a+b}{2})-S(\frac{a+b}{2},b)|<15\varepsilon\\
$$


we expect have:
$$
|\int_a^b f(x)dx - S(a,\frac{a+b}{2})-S(\frac{a+b}{2},b)| < \varepsilon
$$


we use to approximate error.



Julia code for the methods, only calculate 2 steps:

```julia
function Adaptive_Quadratic_Method(f, a, b)
  #calculate S(a,b)
  h = (b-a)/2
  S1 = (h/3)*(f(a)+f(b)+4*f(a+h))
  #calcilate S' and S''
  S2 = (h/6)*(f(a)+4*f(a+h/2)+2*f(a+h)+4*f(a+3h/2)+f(b))
  result = 1/15 * abs(S1-S2)
  return result
end
  
```



## Gaussian Quadrature

dont understand



## Multiple Integrals

​	We discuss that:
$$
\iint\limits_R f(x,y)dA
$$
where $R = \{(x,y)|a\leq x\leq b,c\leq y \leq d \}$.

