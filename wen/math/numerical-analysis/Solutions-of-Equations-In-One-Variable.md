# Solutions of Equations In One Variable

## 2.1 The Bisection Method

### Algorithm

**INPUT** : endpoints *a*, *b*; tolerance *TOL*; maximum number of iterations *N*0.

**OUTPUT** : approximate solution *p* or message of failure.

**Step 1** : *Set i = 1;FA=f(a).*

**Stps 2** : *While i < N0 do Steps3-6.*

​		**Step 3** : Set *p*=*a*+(*b*−*a*)/2; (Computep.)*;FP=f(p)*

​		**Step 4** : *If FP = 0 or (b-a)/2 < TOL then*

​							*OUTPUT(p);Stop*

​		**Step 5** : *set i = i+1*

​		**Step 6** : *IF FA dot FP > 0 then set a = p; FA=FP*

​													*else set b = p*

**Step 7** : OUTPUT (‘Method failed after *N*0 iterations, *N*0 =’, *N*0); (*The procedure was unsuccessful*.)

​				STOP. 

***

### Theorem 2.1

Suppose that f ∈ *C*[*a*, *b*] and f (*a*) · f (*b*) < 0. The Bisection method generates a sequence {pn} approximating a zero *p* of f with
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
the sequence pn converges to *p* with rate of convergence *O* 􏰖(1/2^n) 􏰑; that is,
$$
p_n = p + O(\frac{1}{2^{n}})
$$



***

## 2.2 Fixed-Point lteration

### Definition 2.2

The number *p* is a **fixed point** for a given function *g* if *g*( *p*) = *p*.

***

### Algorithm

**INPUT** : initial approximation *p*0; tolerance *TOL*; maximum number of iterations *N*0.

**OUTPUT** : approximate solution *p* or message of failure.

**Step 1** : Set i = 1.

**Step 2** : While i <= N0  do Steps 3-6.

​		**Step 3** : Set *p* = *g*( *p*0).

​		**Step 4** : If|*p*−*p*0|<*TOL* then

​							OUTPUT ( *p*); 

​							*STOP*.

​		**Step 5** : Set*i*=*i*+1.

​		**Step 6** : Set *p*0 = *p*.

**Step 7** : OUTPUT (‘The method failed after *N*0 iterations, *N*0 =’, *N*0); (*The procedure was unsuccessful*.)

​				*STOP*

***

### Theorem 2.4 Fixed-Point Theorem

Let *g* ∈ *C*[*a*, *b*] be such that *g*(*x*) ∈ [*a*, *b*], for all *x* in [*a*, *b*]. Suppose, in addition, that *g*′ exists on (*a*, *b*) and that a constant 0 < *k* < 1 exists with
$$
|g'(x)|\leq k \quad for \quad all \: x \in (a,b)
$$
Then for any number *p*0 in [*a*, *b*], the sequence defined by
$$
p_{n} = g(p_{n-1})
$$
converges to the unique fixed point *p* in [*a*, *b*].

***Proof*** : 

Theorem 2.3 implies that a unique point *p* exists in [*a*, *b*] with *g*( *p*) = *p*. Since *g* maps [*a*, *b*] into itself, the sequence { *p**n* }∞*n*=0 is defined for all *n* ≥ 0, and *p**n* ∈ [*a*, *b*] for all *n*. Using the fact that |*g*′(*x*)| ≤ *k* and the Mean Value Theorem 1.8, we have, for each *n*,
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
Hence pn converges to p.

***

## 2.3 Newton's Method And its Extensions

### Newton Method

Suppose:
$$
f \in C^{2}[a,b]
$$
Let *p*0 ∈ [*a*, *b*] be an approximation to *p* such that f ′( *p*0) != 0 and | *p* − *p*0| is “small.” 
$$
f(p) = f(p_{0}) + (p-p_{0})f'(p_{0}) + \frac{1}{2}(p-p_{0})^{2}f''(\xi(p))
$$
where ξ ( *p*) lies between *p* and *p*0 . Since f ( *p*) = 0, this equation gives:
$$
0=f(p_{0}) + (p-p_{0})f'(p_{0}) + \frac{1}{2}(p-p_{0})^{2}f''(\xi(p))
$$
Newton’s method is derived by assuming that since | *p* − *p*0 | is small, the term involving

( *p* − *p*0)^2 is much smaller, so:
$$
0 \approx f(p_{0}) + (p-p_{0})f'(p_{0})
$$
Solving for *p* gives:
$$
p \approx p_{0} - \frac{f(p_{0})}{f'(p_{0})} \equiv p_{1}
$$
This sets the stage for Newton’s method, which starts with an initial approximation *p*0 and generates the sequence { *p**n* }∞*n*=0 , by
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

### Theorem 2.6

Let :
$$
f \in C^{2}[a,b]
$$
If *p* ∈ (*a*,*b*) is such that f(*p*) = 0 and f′(*p*)!= 0, then there exists a δ > 0 such that Newton’s method generates a sequence {*p**n*}∞*n*=1 converging to *p* for any initial approximation *p*0 ∈ [*p* − δ, *p* + δ].



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

Suppose { *p**n*}∞*n*=0 is a sequence that converges to *p*, with *p**n* ̸= *p* for all *n*. If positive constants λ and α exist with
$$
\lim_{n \to \infty}\frac{|p_{n+1}-p|}{|p_{n} - p|^{\alpha}} = \lambda
$$
then { *p**n*}∞*n*=0 **converges to** **p** **of order** α, **with asymptotic error constant** λ.

1. If α = 2, the sequence is **quadratically convergent**.
2. If α = 1 (and λ < 1), the sequence is **linearly convergent**.

