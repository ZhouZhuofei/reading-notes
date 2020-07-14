# Solutions of Equations In One Variable

***

***

[TOC]

***

***



## 2.1 The Bisection Method

### Algorithm

**INPUT** : endpoints *a*, *b*; tolerance *TOL*; maximum number of iterations *N*~0~.

**OUTPUT** : approximate solution *p* or message of failure.

**Step 1** : *Set i = 1;FA=f(a).*

**Stps 2** : *While i < N~0~ do Steps3-6.*

​		**Step 3** : Set *p*=*a*+(*b*−*a*)/2; (Computep.)*;FP=f(p)*

​		**Step 4** : *If FP = 0 or (b-a)/2 < TOL then*

​							*OUTPUT(p);Stop*

​		**Step 5** : *set i = i+1*

​		**Step 6** : *IF FA dot FP > 0 then set a = p; FA=FP*

​													*else set b = p*

**Step 7** : OUTPUT (‘Method failed after *N*~0~ iterations, *N*~0~ =’, *N*~0~); (*The procedure was unsuccessful*.)

​				STOP. 

***

### Theorem 2.1

Suppose that f ∈ *C*[*a*, *b*] and f (*a*) · f (*b*) < 0. The Bisection method generates a sequence $\{p_{n}\}_{n=1}^{\infty}$approximating a zero *p* of f with
$$
|p_{n} - p| \leq \frac{b-a}{2^{n}}, where \: n \ge 1.
$$
​			

***Proof*** :

For each *n* ≥ 1, we have
$$
b_{n} - a_{n} = \frac{1}{2^{n-1}}(b-a) \quad p \in (a_{n}, b_{n})
$$
Since for all n >=1:
$$
p_{n} = \frac{1}{2}(a_{n} + b_{n})
$$
Its follows that:
$$
|p_{n}-p|\leq \frac{1}{2}(b_{n}-a_{n})=\frac{b-a}{2^{n}}
$$
Because:
$$
|p_{n} - p|\leq (b-a)\frac{1}{2^{n}}
$$
the sequence pn converges to *p* with rate of convergence $O(\frac{1}{2^{n}})$ 􏰑; that is,
$$
p_n = p + O(\frac{1}{2^{n}})
$$



***

## 2.2 Fixed-Point lteration

### Definition 2.2

The number *p* is a **fixed point** for a given function *g* if *g*( *p*) = *p*.

***

### Algorithm

**INPUT** : initial approximation *p*~0~; tolerance *TOL*; maximum number of iterations *N*~0~.

**OUTPUT** : approximate solution *p* or message of failure.

**Step 1** : Set i = 1.

**Step 2** : While i <= N0  do Steps 3-6.

​		**Step 3** : Set *p* = *g*( *p*~0~).

​		**Step 4** : If|*p*−*p*~0~|<*TOL* then

​							OUTPUT ( *p*); 

​							*STOP*.

​		**Step 5** : Set*i*=*i*+1.

​		**Step 6** : Set *p*~0~ = *p*.

**Step 7** : OUTPUT (‘The method failed after *N*~0~ iterations, *N*~0~ =’, *N*~0~); (*The procedure was unsuccessful*.)

​				*STOP*

***

### Theorem 2.4 Fixed-Point Theorem

Let *g* ∈ *C*[*a*, *b*] be such that *g*(*x*) ∈ [*a*, *b*], for all *x* in [*a*, *b*]. Suppose, in addition, that *g*′ exists on (*a*, *b*) and that a constant 0 < *k* < 1 exists with
$$
|g'(x)|\leq k \quad for \quad all \: x \in (a,b)
$$
Then for any number *p*~0~ in [*a*, *b*], the sequence defined by
$$
p_{n} = g(p_{n-1})
$$
converges to the unique fixed point *p* in [*a*, *b*].

***Proof*** : 

Theorem 2.3 implies that a unique point *p* exists in [*a*, *b*] with *g*( *p*) = *p*. Since *g* maps [*a*, *b*] into itself, the sequence $\{p_{n}\}_{n=1}^{\infty}$ is defined for all *n* ≥ 0, and *p~n~* ∈ [*a*, *b*] for all *n*. Using the fact that |*g*′(*x*)| ≤ *k* and the Mean Value Theorem 1.8, we have, for each *n*,
$$
|p_{n}-p| = |g(p_{n-1}) - g(p)|=|g'(\xi_{n})||p_{n-1}-p|\leq k|p_{n-1}-p|
$$
where ξ*n* ∈ (*a*, *b*). Applying this inequality inductively gives:
$$
|p_{n} - p|\leq k|p_{n-1} - p|\leq k^{2}|p_{n-2}-p|\leq ... \leq k^{n}|p_{0} - p|
$$
Since0<*k*<1,wehavelim*n*→∞*k^n* =0 and
$$
\lim_{n \to \infty}|p_{n}-p|\leq \lim_{n \to \infty}k^{n}|p_{0} - p| = 0
$$
Hence p~n~ converges to p.

***

## 2.3 Newton's Method And its Extensions

### Newton Method

Suppose:
$$
f \in C^{2}[a,b]
$$
Let *p*~0~ ∈ [*a*, *b*] be an approximation to *p* such that f ′( *p*~0~) != 0 and | *p* − *p*~0~| is “small.” 
$$
f(p) = f(p_{0}) + (p-p_{0})f'(p_{0}) + \frac{1}{2}(p-p_{0})^{2}f''(\xi(p))
$$
where ξ ( *p*) lies between *p* and *p*~0~ . Since f ( *p*) = 0, this equation gives:
$$
0=f(p_{0}) + (p-p_{0})f'(p_{0}) + \frac{1}{2}(p-p_{0})^{2}f''(\xi(p))
$$
Newton’s method is derived by assuming that since | *p* − *p*~0~ | is small, the term involving

( *p* − *p*~0~)^2 is much smaller, so:
$$
0 \approx f(p_{0}) + (p-p_{0})f'(p_{0})
$$
Solving for *p* gives:
$$
p \approx p_{0} - \frac{f(p_{0})}{f'(p_{0})} \equiv p_{1}
$$
This sets the stage for Newton’s method, which starts with an initial approximation *p*0 and generates the sequence $\{p_{n}\}_{n=1}^{\infty}$ , by
$$
p_{n} = p_{n-1} - \frac{f(p_{n-1})}{f'(p_{n-1})}
$$

***

### Algorithm

**INPUT**: initial approximation p₀; tolerance TOL; maximum number of iterations N₀.
**OUTPUT**: approximate solution p or message of failure.
**Step 1**: Set I = 1.
**Step 2**: While I <= N₀ do Step 3-6.

​		**Step 3**: Set p = p₀ - f(p₀)/f’(p₀).

​		**Step 4**: If |p-p₀| < TOL then
​             OUTPUT(p);
​             STOP.
​		**Step 5**: Set I = I + 1.
​		 **Step 6**: Set p₀ = p.

**Step 7**: OUTPUT(‘The method failed after N₀ iterations, N₀=‘, N₀);
    		STOP.

***

### Newton Method Julia

```julia
using Zygote
function Newton_method(f,p₀,TOL,N₀)
    i = 1
    while i <= N₀
        p = p₀ - f(p₀)/f'(p₀)
        if abs(p - p₀) < TOL
            print("Root is ", p)
            break
        end
        i = i + 1
        p₀ = p
    end
end
```

***

### Theorem 2.6

Let :
$$
f \in C^{2}[a,b]
$$
If *p* ∈ (*a*,*b*) is such that f(*p*) = 0 and f′(*p*)!= 0, then there exists a δ > 0 such that Newton’s method generates a sequence $\{p_{n}\}_{n=1}^{\infty}$converging to *p* for any initial approximation *p*0 ∈ [*p* − δ, *p* + δ].



***Proof*** :

omit

### The Secant Method

​	To circumvent the problem of the derivative evaluation in Newton’s method, we intro- duce a slight variation. By definition,
$$
f'(p_{n-1}) = \lim_{x \to p_{n-1}}\frac{f(x) - f(p_{n-1})}{x - p_{n-1}}
$$
If:
$$
p_{n-2} \quad close \quad to \quad p_{n-1}
$$
Then:
$$
f'(p_{n-1}) \approx \frac{f(p_{n-2})-f(p_{n-1})}{p_{n-2} - p_{n-1}}
$$
Using this approximation for f ′( *p**n*−1) in Newton’s formula gives:
$$
p_{n} = p_{n-1} - \frac{f(p_{n-1})(p_{n-1} - p_{n-2})}{f(p_{n-1}) - f(p_{n-2})}
$$

***

### Algorithm

**INPUT** initial approximations p₀ and p₁; tolerance TOL; maximum number of iterations N₀.
**OUTPUT** approximate solution p or message failure.
**Step 1** Set I = 2;

​			q₀ = f(p₀);
​			q₁ = f(p₁).
**Step 2** While I >= N₀ do Step 3-6.
​		**Step 3** Set p = p₁ - q₁(p₁ - p₀)/(q₁ - q₀).
​		**Step 4** If |p - p₁| < TOL then 
 				OUTPUT(p);
 				STOP.
  	**Step 5** Set I = I + 1.
  	**Step 6** Set p₀ = p₁;
​                        q₀ = q₁;
​                        p₁ = p;
​                        q₁ = f(p).
**Step 7** OUTPUT(‘The method failed after N₀ iterations, N₀ = ‘, N₀);
​             STOP.

***

### The Method of False Position

**INPUT** initial approximations p₀,p₁; tolerance TOL; maximum number of iterations N₀.

**OUTPUT** approximate solution p or message of failure.
 **Step 1** Set I = 2;
            q₀ = f(p₀);
           q₁ = f(p₁).
**Step 2** While I <= N₀ do Step 3-7.
**Step 3** Set p = p₁ - q₁(p₁ - p₀)/(q₁ - q₀).
      **Step 4** If |p - p₁| < TOL then
                OUTPUT(p);
                STOP.
      **Step 5** Set I = I + 1;
                q = f(p).
      **Step 6** If q × q₁ < 0 then set p₀ = p₁;
                                    q₀ = q₁.
      **Step 7** Set p₁ = p;
                 q₁ = q.
 **Step 8** OUTPUT(‘Method failed after N₀ iterations, N₀’, N₀);
        STOP.



***

## 2.4 Error Analysis For Literation Methods

### Definition 2.7

Suppose $\{p_{n}\}_{n=1}^{\infty}$ is a sequence that converges to *p*, with *p~n~* != *p* for all *n*. If positive constants λ and α exist with
$$
\lim_{n \to \infty}\frac{|p_{n+1}-p|}{|p_{n} - p|^{\alpha}} = \lambda
$$
then $\{p_{n}\}_{n=1}^{\infty}$ **converges to** **p** **of order** α, **with asymptotic error constant** λ.

1. If α = 2, the sequence is **quadratically convergent**.
2. If α = 1 (and λ < 1), the sequence is **linearly convergent**.

***

### Theorem 2.8

Let $g \in C[a, b]$ be such that $g(x)\in [a,b]$, for all $x \in [a,b]$. Suppose, in addition, that g' is continuous on (a, b) and a positive constant k < 1 exist with:
$$
|g'(x)|\leq k, \quad for \quad all \quad x\in (a,b)
$$
If g'(p) != 0, then for any number p~0~ != p in [a, b], the sequence 
$$
p_{n} = g(p_{n-1}), \: for \: n\ge 1,
$$
converges only linearly to the unique fixed point *p* in [*a*, *b*].

***

### Theorem 2.9

Let $p$ be a solution of the equation $x=g(x)$. Suppose that $g'(p)=0$ and $g''$ is continuous with $|g''(x)|<M$ on an open interval $I$ containing $p$. Then there exists a $\delta > 0$ such that, for $p_{0} \in [p-\delta, p+\delta]$, the sequence defined by $p_{n}=g(p_{n-1})$, where $n\ge 0$, converges at least Quadratically[^1] to $p$. Moreover, for sufficiently large values of $n$.

[^1]:平方

$$
|p_{n+1}-p|<\frac{M}{2}|p_{n}-p|^{2}
$$

**Proof** :

Choose $k$ in $(0,1)$ and $\delta > 0$ such that on the interval $[p-\delta, p+\delta]$, contained in $I$, we have $|g'(x)|\leq k$ and $g''$ continuous. Since $|g'(x)|\leq k < 1$, the argument used in the proof of Theorem 2.6 in section 2.3 shows that the terms of the sequence $\{p_{n}\}_{n=1}^{\infty}$ are contained in $[p-\delta, p+\delta]$. Expanding $|g(x)|$ in a linear Tylor Polynomial for $x \in [p-\delta, p+\delta]$ gives 
$$
g(x) = g(p)+g'(p)(x-p)+\frac{g''(\xi)}{2}(x-p)^{2}
$$
Where $\xi$ lies between x and p. The hypotheses[^2] $g(p)=p$ and $g'(p)=0$ imply that 
$$
g(x) = p + \frac{g''(\xi)}{2}(x-p)^{2}.
$$
In particular, when $x=p_{n}$,

[^2]:假设

$$
p_{n+1} = g(p_{n})=p+\frac{g''(\xi)}{2}(p_{n}-p)^{2}
$$

With $\xi_{n}$ between $p_{n}$ and $p$. Thus,
$$
p_{n+1}- p = \frac{g''(\xi)}{2}(p_{n}-p)^{2}
$$
Since $|g'(x)|\leq k < 1$ on $[p-\delta, p+\delta]$ and $g$ maps $[p-\delta, p+\delta]$ into itself, its follows from the Fixed-Point Theorem that $\{p_{n}\}_{n=1}^{\infty}$ converges to $p$. But $\xi_{n}$ in between $p$ and $p_{n}$ for each $n$, so $\{p_{n}\}_{n=1}^{\infty}$ also converges to $p$, and
$$
\lim_{n \to \infty} \frac{|p_{n+1}-p|}{|p_{n}-p|^{2}}=\frac{|g''(p)|}{2}
$$
This result implies that the sequence $\{p_{n}\}_{n=1}^{\infty}$ is quadratically convergent if $g''(x) \ne 0$ and of higher-order convergence if $g''(p) = 0$.

​	Because $g''$ is continuous and strictly bounded by $M$ on the interval $[p-\delta, p+\delta]$, this also implies that, for sufficiently large values of $n$.
$$
|p_{n+1}-p|<\frac{M}{2}|p_{n}-p|^{2}
$$

***

### Definition 2.10

A solution $p$ of $f(x)=0$ is a zero of multiplicity $m$ of $f$ if for $x \ne p$, we can write $f(x)=(x-p)^{m}q(x)$, where $\lim_{x \to p}q(x)\ne 0$.

***

### Definition 2.11

The function $f \in C^{1}[a,b]$ has a simple zero at $p$ in $(a,b)$ if and only if $f(p)=0$, but $f'(p) \ne 0$.



**Proof** :

If $f$ has a simple zero at $p$, then $f(P)=0$ and $f(x)=(x-p)q(x)$, where $\lim_{x \to p}q(x) \ne 0$. Since $f \in C^{1}[a,b]$,
$$
f'(p)=\lim_{x \to p}f'(x)=\lim_{x \to p}[q(x)+(x-p)q'(x)]=\lim_{x \to p}q(x) \ne 0
$$
Conversely, if $f(p)=0$, but $f'(p) \ne 0$, expand $f$ in a zeroth Tylor polynomial about $p$. Then
$$
f(x)=f(p)+f'(\xi(x))(x-p) = (x-p)f'(\xi(x))
$$
Where $\xi(x)$ is between $x$ and $p$, Since $f\in C^{1}[a,b]$,
$$
\lim_{x \to p}f'(\xi(x)) = f'(\lim_{x \to p}\xi(x))=f'(p) \ne 0
$$
Letting $q=f' \circ \xi$ gives $f(x) = (x-p)q(x)$, where $lim_{x \to p}q(x) \ne 0$. Thus $f$ has a simple zero at $p$.

***

### Theorem 2.12

The function $f \in C^{m}[a,b]$ has a zero of multiplicity $m$ at $p$ in $(a,b)$ if and only if
$$
0=f(p)=f'(p)=f''(p)=...=f^{m-1}(x), \quad but \quad f^{m}(p) \ne 0
$$

***

## 2.5 Accelerating Convergence

### Aitken's $\Delta^{2}$ Method

Suppose $\{p_{n}\}_{n=1}^{\infty}$ is a linearly convergent with a limit $p$ . To motivate the construction of a sequence $\{\hat{p_{n}}\}_{n=1}^{\infty}$ that converges more rapidly to $p$ than does $\{p_{n}\}_{n=1}^{\infty}$. Let us first assume that the signs of $p_{n}-p,p_{n+1}-p$,and $p_{n+2}-p$ agree and that $n$ is sufficiently large that
$$
\frac{p_{n+1}-p}{p_{n}-p} \approx \frac{p_{n+2}-p}{p_{n+1}-p}.
$$
Then
$$
(p_{n+1}-p)^{2}\approx (p_{n+2}-p)(p_{n}-p)
$$
so
$$
p_{n+1}^{2}-2p_{n+1}p+p^{2}\approx p_{n+2}p_{n}-(p_{n}+p_{n+2})p+p^{2}
$$
and
$$
(p_{n+2}+p_{n}-2p_{n+1})p\approx p_{n+2}p_{n}-p_{n+1}^2
$$
Solving for $p$ gives
$$
p \approx \frac{p_{n+2}p_{n}-p_{n+1}^{2}}{p_{n+2}-2p_{n+1}+p_{n}}
$$
Adding and subtracting the terms $p_{n}^{2}$ and $2p_{n}p_{n+1}$ in the numerator and grouping terms appropriately gives
$$
\begin{align}
p &\approx \frac{p_{n}p_{n+2}-2p_{n}p_{n+1}+p_{n}^{2}-p_{n+1}^{2}+2p_{n}p_{n+1}-p_{n}^{2}}{p_{n+2}-2p_{n+1}+p_{n}} \\
&=\frac{p_{n}(p_{n+2}-2p_{n+1}+p_{n})-(p_{n+1}^{2}-2p_{n}p_{n+1}+p_{n}^{2})}{p_{n+2}-2p_{n+1}+p_{n}} \\
&= p_{n} - \frac{(p_{n+1}-p_{n})^{2}}{p_{n+2}-2p_{n+1}+p_{n}}
\end{align}
$$
**Aitken's $\Delta^{2}$ method** is based on assumption that the sequence $\{\hat{p_{n}}\}_{n=1}^{\infty}$,defined by
$$
\hat{p_{n}}=p_{n} - \frac{(p_{n+1}-p_{n})^{2}}{p_{n+2}-2p_{n+1}+p_{n}}
$$
Converges more rapidly to $p$ than does the original sequence $\{p_{n}\}_{n=0}^{\infty}$



### Definition 2.13

For a given sequence$\{p_{n}\}_{n=0}^{\infty}$ the **forward difference** $\Delta p_{n}$ (real "delta p") is defined by 
$$
\Delta p_{n} = p_{n+1}-p_{n}
$$
Higher powers of the operator $\Delta$ are defined recursively by
$$
\Delta^{k}p_{n}=\Delta(\Delta^{k-1}p_{n}), for \quad k \ge 2
$$
The definition implies that
$$
\Delta^{2}p_{n}=\Delta(p_{n+1}-p_{n})=\Delta p_{n+1}-\Delta p_{n}=(p_{n+2}-p_{n+1})-(p_{n+1}-p_{n})
$$
So $\Delta^{2}p_{n}=p_{n+2}-p_{n+1}+p_{n}$ , are the formula for $\hat{p_{n}}$ given in eq.(2.14) can be written as
$$
\hat{p_{n}}=p_{n}-\frac{(\Delta p_{n}^{2})}{\Delta^{2}p_{n}}
$$

### Theorem 2.14

Suppose that $\{ p_{n}\}_{n=0}^{\infty}$ is a sequence that converges linearly to the limit $p$ and that
$$
\lim_{n\to \infty}\frac{p_{n+1}-p}{p_{n}-p} < 1
$$
Then the Aitken’s 􏰆$\Delta^{2}$ sequence $\{\hat{p_{n}}\}_{n=0}^{\infty}$converges to *p* faster than $\{ p_{n}\}_{n=0}^{\infty}$ in the sense that
$$
\lim_{n\to \infty}\frac{\hat{p_{n}}-p}{p_{n}-p}=0
$$


### Steffensen's Method

*INPUT inital approximation p₀; tolerance TOL; maximum number of iterations N₀.*

*OUTPUT approximate solution p or message of failure.*

*Step 1 Set i = 1*

*Step 2 While i <= N₀ do Step 3-6*

  *Step 3 Set p₁ = g(p₀);*

​        *p₂ = g(p₁);*

​        *p = p₀ - (p₁ - p₀)²/(p₂ - 2p₁ + p₀).*

  *Step 4 If |p - p₀| < TOL then* 

​      *OUTPUT (p)*

​      *STOP.*

  *Step 5 Set i = i + 1*

  *Step 6 Set p₀ = p.*

*Step 7 OUTPUT ("Method failed after N₀ iterations, N₀ = ", N₀)*

​    *STOP.*



### Theorem 2.15

Suppose that $x =g(x)$ has a solution $p$ with $g'(p) \ne 1$.if there exist a $\delta>0$ such that $g\in C^{3}[p-\delta, p+\delta]$, then Steffensen’s method gives quadratic convergence for any $p_{0} \in [p-\delta, p+\delta]$.



## 2.6 Zeros Of Polynomials And Muller's Method



### Theorem 2.16 (Fundamental Theorem of Algebra)

If $P(x)$ is a polynomial of degree $n ≥ 1$ with real or complex coefficients, then $P(x) = 0$ has at least one ( possibly complex) root.



### Horner’s Method

Let 
$$
P(x)=a_{n}x^{n}+a_{n-1}x^{n-1}+a_{n-2}x^{n-2}+...+a_{1}x+a_{0}
$$
Define $b_{n}=a_{n}$ and
$$
b_{k} = a_{k}+b_{k+1}x_{0}, for \quad k=n-1, n-2, ... 1,0.
$$
Then $b_{0}=P(x_{0})$. Moreover, if 
$$
Q(x)=b_{n}x^{n-1}+b_{n-1}x^{n-2}+...+b_{2}x+b_{1}
$$
then
$$
P(x)=(x-x_{0})Q(x)+b_{0}
$$


### Theorem 2.20

If $z = a+bi$ is a complex zero of multiplicity *m* of the polynomial *P*(*x*) with real coefficients, then *z* = *a* − *bi* is also a zero of multiplicity *m* of the polynomial *P*(*x*), and $(x^2 − 2ax + a^2 + b^2)^m$ is a factor of *P*(*x*).



