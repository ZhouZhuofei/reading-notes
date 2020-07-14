# Mathematical Preliminaries and Error Analysis

***

***



[TOC]

***

***



## 1.1 review of calculus

### limits and continuity

*******



#### Definition 1.1

A function f defined on a set X of real numbers has a limit L at x~0~, written 
$$
\lim_{x \to x_{0}} f(x) = L
$$
if , given any real number  ε > 0, there exists a real number δ > 0 such that
$$
|f(x) - L| < \epsilon ,\quad whenever \quad x \in X \quad and \quad 0<|x-x\_{0}|<\delta
$$

***

#### Definition 1.2

Let  f be a function defined on a set of *X* of real numbers and x~0~ ∈ X, Then f is continuous at x~0~ if
$$
\lim_{x \to x_{0}}f(x) = f(x_{0})
$$
The function f is **continuous on the set** *X* if it is continuous at each number in *X*.

***

#### Definition 1.3

$$
let \quad \{x_{n}\}_{n=1}^{\infty} 
$$

be an infinite sequence of real numbers.This sequence has the **limit** *x* (**converges to** *x*) if, for any ε > 0 there exists a positive integer *N*(ε) such that |*x~n~* − *x*| < ε, whenever *n* > *N*(ε). The notation
$$
\lim_{n \to \infty}x_{n} = x,\quad x_{n} \to x \quad as \quad n \to \infty
$$
means the sequence converges to x.

***

#### Theorem 1.4

If f is a function defined on a set *X* of real numbers and *x*~0~ ∈ *X*, then the following statements are equivalent:

- **a** : f is continuous at x~0~;
- **b** : if x 's sequence in set of X converges to x~0~, then limit n to infty f(x~n~) = f(x~0~).

***

### Differentiability

***

#### Definition 1.5

Let f be a function defined in an open interval containing *x*~0~ . The function f is **differentiable** at *x*~0~ if
$$
f'(x_{0}) = \lim_{x \to x_{0}}\frac{f(x) - f(x_{0})}{x - x_{0}}
$$
exists. The number f ′ (*x*~0~ ) is called the **derivative** of f at *x*~0~ . A function that has a derivative at each number in a set *X* is **differentiable on** *X*.

***

#### Theorem 1.6 

If the function f is differentiable at *x*~0~, then f is continuous at *x*~0~.

***

#### theorem 1.7 Rolle's Theorem

Suppose f ∈ *C*[*a*, *b*] and f is differentiable on (*a*, *b*). If f (*a*) = f (*b*), then a number *c* in (*a*, *b*) exists with f ′(*c*) = 0. 

***

#### theorem 1.8 Mean Value Theorem

If f ∈ *C*[*a*, *b*] and f is differentiable on (*a*, *b*), then a number *c* in (*a*, *b*) exists with
$$
f'(x) = \frac{f(b)-f(a)}{b-a}.
$$

***

#### Theorem 1.9 Extreme Value Theorem

If f ∈ *C*[*a*,*b*], then *c*~1~, *c*~2~∈ [*a*,*b*] exist with f(*c*~1~) ≤ f(*x*) ≤ f(*c*~2~), for all *x* ∈ [*a*,*b*]. In addition, if f is differentiable on (*a*, *b*), then the numbers *c*~1~ and *c*~2~ occur either at the endpoints of [*a*, *b*] or where f ′ is zero.

#### Theorem 1.10 Generalized Rolle's Theorem

Suppose f ∈ *C*[*a*, *b*] is *n* times differentiable on (*a*, *b*). If f (*x*) = 0 at the *n* + 1 distinct numbers*a*≤*x*~0~ <*x*~1~ <...<*x*~n~ ≤*b*,thenanumber*c*in(*x*~0~, *x~n~*),and hence in (*a*,*b*), exists with
$$
f^{(n)}(c) = 0
$$

***

#### Theorem 1.11 Intermediate Value Theorem

If f ∈ *C*[*a*, *b*] and *K* is any number between f (*a*) and f (*b*), then there exists a number *c* in (*a*,*b*) for which f(*c*) = *K*.

***

### Integration

***

#### Definition 1.12 

The **Riemann integral** of the function f on the interval [*a*, *b*] is the following limit, provided it exists:
$$
\int_{a}^{b}f(x)dx = \lim_{max \Delta x_{i} \to 0}\sum_{i=1}^{\infty}f(z_{i})\Delta x_{i},
$$
Where the number :
$$
x_{1},x_{2},...,x_{n}
$$
Satisfy :
$$
a=x_{0}\leq x_{1}\leq x_{2}\leq...\leq x_{n} = b.\quad where \quad \Delta x_{i} = x_{i} - x_{i-1}.
$$
for each i = 1,2,...,n.and arbiterily chosen z~i~ ,let:
$$
z_{i} \in [x_{i-1},x_{i}].
$$

***

#### Theorem 1.13 Weighted Mean Value Theorem for Integrals

Suppose f ∈ *C*[*a*, *b*], the Riemann integral of *g* exists on [*a*, *b*], and *g*(*x*) does not change sign on [*a*, *b*]. Then there exists a number *c* in (*a*, *b*) with
$$
\int_{a}^{b}f(x)g(x)dx = f(c)\int_{a}^{b}g(x)dx
$$
When *g*(*x*) ≡ 1, Theorem 1.13 is the usual Mean Value Theorem for Integrals. It gives the **average value** of the function f over the interval [*a*, *b*] as 
$$
f(c) = \frac{1}{b-a}\int_{a}^{b}f(x)dx
$$
.

***

### Tylor Polynomials

***

#### Theorem 1.14 Taylor's Theorem

Suppose:
$$
f \in C^{n}[a,b], \quad f^{(n+1)} \quad exist \quad on \quad[a,b].x_{0} \in [a,b], \exist \xi \in [x_{0},x] \quad or \quad \exist \xi \in [x, x_{0}].
$$

$$
f(x) = P_{n}(x) + R_{n}(x)
$$
Where:
$$
\begin{align}
 P_{n}(x) &= f(x_{0}) + f'(x_{0})(x-x_{0})+\frac{f''(x_{0})}{2!}(x-x_{0})^{2}+...+\frac{f^{(n)}(x_{0})}{n!}(x-x_{0})^{n} \\
 &=\sum_{k=0}^{n}\frac{f^{(k)}(x_{0})}{k!}(x-x_{0})^{k} \tag{1.12}
\end{align}
$$
And:
$$
R_{n}(x) = \frac{f^{(n+1)}(\xi(x))}{(n+1)!}(x-x_{0})^{n+1}.
$$

***

## 1.2 Round-off Errors and computer Arithmetic

#### Definition 1.15

Suppose that *p*∗ is an approximation to *p*. The **absolute error** is |*p* − *p*∗|, and the **relative error** is|*p* − *p*∗|/*|p|*.

***

#### Definition 1.16

The number *p*∗ is said to approximate *p* to *t* **significant digits** (or figures) if *t* is the largest nonnegative integer for which
$$
\frac{|p-p^{*}|}{|p|}\leq 5\times10^{-t}
$$

***

## 1.3 Algorithms and Convergence

#### Definition 1.17

Suppose that *E*~0~ > 0 denotes an error introduced at some stage in the calculations and *E~n~* represents the magnitude of the error after *n* subsequent operations.:

* If *E~n~* ≈ *CnE*0, where *C* is a constant independent of *n*, then the growth of error is said to be **linear**
*  If *E~n~* ≈ *C**n**E*0, for some *C* > 1, then the growth of error is called **exponential**.

***

#### Definition 1.18

Suppose
$$
\{\beta_{n}\}_{n=1}^{\infty} \quad converge \quad to \quad 0;\{\alpha_{n}\}_{n=1}^{\infty} \to \alpha
$$
 If a positive constant *K* exists with:
$$
|\alpha_{n}-\alpha|\leq K|\beta_{n}|, for \quad large \: n,
$$
then we say that {α*~n~*}∞*n*=1 converges to α with **rate, or order, of convergence** *O*(β*n*). (This

expression is read “big oh of β*n*”.) It is indicated by writing α*n* = α + *O*(β*n)

***

#### Definition 1.19

Suppose:
$$
\lim_{h \to 0}G(h)=0,\lim_{h \to 0}F(h)=L
$$
If a positive constant *K* exists with:
$$
|F(h)-L|\leq K|G(h)|,
$$
for sufficiently small *h*,

then we write *F*(*h*) = *L* + *O*(*G*(*h*)).

***









