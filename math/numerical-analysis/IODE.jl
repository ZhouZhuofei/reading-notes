### A Pluto.jl notebook ###
# v0.12.15

using Markdown
using InteractiveUtils

# ╔═╡ d2ab36dc-300b-11eb-1d1c-5732f62ae8ae
md"_notes by zhouzhuofei_"

# ╔═╡ 52c6eb0a-300b-11eb-1b50-e90f895bfdcf
md"""
# Initial-Value Problems for Ordinary Differential Equations

"""

# ╔═╡ 21739304-300c-11eb-3a27-7be860aa7ae9
md"Differential equations are used to model problems in science and engineering that involve the change of some variable with respect to another. Most of these problems require the solution of an **initial-value problem**.

$\frac{dy}{dt} = f(t, y)$ for $a\leq t \leq b$ and an initial-value $y(a) = \alpha$.
"

# ╔═╡ f654ae64-300c-11eb-20ef-35fc44966c21
md"
In common real-life situation, the differential equation that models the problem is too complicated to solve exactly. so two ways to solve these:
1. _simplifying function that can be solve exactly_
2. _use methods for approximating the solution of the original question._
"

# ╔═╡ e519c552-300d-11eb-2c18-fde7ef4e2ff7
Markdown.MD(Markdown.Admonition("correct", "notice", [md"some Definition and theorem can be found in book"]))

# ╔═╡ e13900dc-300e-11eb-3e75-b5ce9239f78f
md"
## Solve Exercise set 5.1
"

# ╔═╡ 6da06f6a-300f-11eb-1d83-8d271fca9624
md"##### 👉  1.1 Use Theorem 5.4 to show that each of the following initial-value problems has a unique solution, and find the solution.

a. $y' = ycost, 0\leq t \leq 1, y(0) = 1$
> use Mean Value Theorem
>
> $\frac{f(t, y_1) - f(t, y_2)}{y1 - y_2}=\frac{\partial}{\partial y}f(t,\xi) = cost$
>
>Thus
>
>$|f(t,y_1) - f(t, y_2)| = |y_1 - y_2||cost| \leq |y_1 - y_2|$
>
>so $f$ satisfies a Lipschitz condition in the variable $y$ with Lipschitz constant $L=1$, and additionally, $f(t,y)$ is continuous when $0\leq t \leq 1$ and $-\infty < y < \infty$. get Theorem 5.4 implies that a unique solution exists to this initial-value problem.

b. $y' = \frac2t y + t^2 e^t, 1\leq t \leq 2, y(1) = 0$
> use mean value theorem:
>
>$|f(t, y_2) - f(t, y_1)| = |y_2 - y_1||\frac2t| \leq 2|y_2 - y_1|$
>
>so $f$ satisfies a Lipschitz condtion in the variable $y$ with Lipschitz constant $L=2$, and additionally, $f(t, y)$ is continuous when $1\leq t \leq 2$ and $-\infty < y < \infty$, get theorem 5.4 implies that a  unique solution exists to this initial-value problem.

c. $y' = -\frac2t y + t^2 e^t, 1\leq t \leq 2, y(1) = \sqrt{2}e$

> use mean value theorem:
>
>$|f(t, y_2) - f(t, y_1)| = |y_2 - y_1||-\frac2t| \leq 2|y_2 - y_1|$
>
>so $f$ satisfies a Lipschitz condtion in the variable $y$ with Lipschitz constant $L=2$, and additionally, $f(t, y)$ is continuous when $1\leq t \leq 2$ and $-\infty < y < \infty$, get theorem 5.4 implies that a  unique solution exists to this initial-value problem.

d.$y' = \frac{4t^3y}{1+t^4}, 0\leq t \leq 1,y(0)=1$

>since we do $\frac{\partial}{\partial y} f= \frac{4t^3}{1+t^4}$, so the $L = max()=2$
>
>so $f$ satisfies a Lipschitz condtion in the variable $y$ with Lipschitz constant $L=2$, and additionally, $f(t, y)$ is continuous when $0\leq t \leq 1$ and $-\infty < y < \infty$, get theorem 5.4 implies that a  unique solution exists to this initial-value problem.

"

# ╔═╡ 24511fc6-3014-11eb-3103-c3194490fd51
md"
##### 👉 1.3 For each choice of $f(t, y)$ given in parts (a)–(d):
i. Does $f$ satisfy a Lipschitz condition on $D=\{ (t,y) | 0\leq t \leq 1, -\infty < y < \infty \}$

ii. can Theorem 5.6 be used to show that initial-value problem.
"

# ╔═╡ 50db1bc8-3014-11eb-3083-2783579a16c6
md"""
a. $f(t,y) = t^2y+1$
> since we do $\frac{\partial}{\partial y}f = t^2$, we can see Lipschitz constant is 1, so $f$ satisfy the Lipschitz condition.accoding to theorem 5.6, we will get a is an initial-value problem.

b. $f(t,y) = ty$
>same as we do $\frac{\partial}{\partial y}f = t$, the Lipschitz constant $L=1$, so $f$ satisfy the Lipschitz condition. according to Theorem 5.6 we will show that an initial-value problem.

c. $f(t,y) = 1-y$
> we do $\frac{\partial}{\partial y}f = -1$, the Lipschitz constant $L=1$, so $f$ satisfy the Lipschitz condition. According to Theorem 5.6 we kown its a initial-value problem.

d. $f(t, y) = -ty + \frac{4t}{y}$
> do $\frac{\partial}{\partial y}f = -t-\frac{4t}{y^2}$, so we konw no maximum value for the function here, so Theorem can't be used.
"""

# ╔═╡ 51de5620-3014-11eb-32e1-895239bc71a6
md"##### 👉 1.5 For the following initial-value problems, show that the given equation implicitly defines a solution.Approximate $y(2)$ using Newton’s method.
"

# ╔═╡ be299f4a-3064-11eb-13c3-fff745460ad7
md"
a. $y' = -\frac{y^3 + y}{(3y^2+1)t}, 1\leq t \leq 2, y(1)=1;y^3t + yt=2$
>Differentiating $y^3t + yt = 2$, $3y^2y't + y^3 + y't + y = 0$, Solving for $y'$ gives the differential equation, and setting $t=1$ and $y=1$ verifies the initial condition. use $t = 2$, $2y^3 + 2y = 2$, use Newton method to solve the ans : $y = 0.6823278038280194$.

b. $y' = \frac{ycost + 2te^y}{sint+t^2e^y+2},1 \leq t \leq 2, y(1) = 0; ysint + t^2e^y+2y =1$
>Differentiating $y'sint + ycost + 2te^y+t^2e^yy'+2y' = 0$,$y(1) = 0$, use $t=2$, $ysin2 + 4e^y+2y=1$,use Newton method to sole :$y = -0.4946599479124357$

```julia
using NumericalAnalysis:SEq1
SEq1.Newton(x->x*sin(2) =4exp(x) +2x -1, 0.0)
```
"

# ╔═╡ 40a4f2aa-3196-11eb-1966-6fe2f1660468
md"##### 👉 1.7 Show that,for any constants $a$ and $b$,the set $D=\{(t,y)|a≤t≤b,−∞<y<∞\}$ is convex.

>suppose $a\leq t_1 \leq b, a \leq t_2 \leq b$, then $\lambda \in [0, 1], 1 - \lambda > 0$, so $(1-\lambda)a \leq (1-\lambda)t_1 \leq (1-\lambda)b$, => $(1-\lambda)a + \lambda a \leq (1-\lambda)t_1 + \lambda t_2 \leq (1-\lambda)b+\lambda b$ so $a\leq (1-\lambda)t_1 + \lambda t_2 \leq b$, 
> we get $((1-\lambda)t_1 + \lambda t_2, (1-\lambda)y_1 + \lambda y_2)$ also in D, so we know for any constant $a$ and $b$ D is convex.
"

# ╔═╡ bdb18b54-3309-11eb-108f-6717c2c0c9e3
md"""
##### 👉 1.9 _Picard's method_ for solving the initial-value problem $y' = f(t,y), a\leq t\leq b, y(a) = \alpha$ is described as follows: Let $y_0(t) = \alpha$ for each $t$ in $[a, b]$.Define a sequence $\{y_k(t)\}$ of functions by $y_k(t) = \alpha + \int_a^t f(\tau, y_{k-1}(\tau))d\tau, k=1,2,...$.

a. Integrate $y'=f(t,y(t))$, and use the initial condition to derive Picard's method.

b. Generate $y_0(t), y_1(t), y_2(t)$ and $y_3(t)$ for the initial-value problem $y'=-y+t+1, 0\leq t \leq 1, y(0)=1$

c. Compare the result in part(b) to the Maclaurin series of the actual solution $y(t) = t+e^{-t}$
"""

# ╔═╡ 40577cdc-3196-11eb-3114-e19b9d5d7d4a
md"
> a.since $y'=f(t,y(t))$, we have:$\int_a^t y'(z)dz = \int_a^tf(z, y(z))dz$, So $y(t)-y(a) = \int_a^tf(z, y(z))dz$ => $y(t) = \alpha + \int_a^t f(z,y(z))dz$

>b. $y(t) = 1$
"

# ╔═╡ Cell order:
# ╟─d2ab36dc-300b-11eb-1d1c-5732f62ae8ae
# ╟─52c6eb0a-300b-11eb-1b50-e90f895bfdcf
# ╟─21739304-300c-11eb-3a27-7be860aa7ae9
# ╟─f654ae64-300c-11eb-20ef-35fc44966c21
# ╟─e519c552-300d-11eb-2c18-fde7ef4e2ff7
# ╟─e13900dc-300e-11eb-3e75-b5ce9239f78f
# ╟─6da06f6a-300f-11eb-1d83-8d271fca9624
# ╟─24511fc6-3014-11eb-3103-c3194490fd51
# ╟─50db1bc8-3014-11eb-3083-2783579a16c6
# ╟─51de5620-3014-11eb-32e1-895239bc71a6
# ╟─be299f4a-3064-11eb-13c3-fff745460ad7
# ╟─40a4f2aa-3196-11eb-1966-6fe2f1660468
# ╟─bdb18b54-3309-11eb-108f-6717c2c0c9e3
# ╟─40577cdc-3196-11eb-3114-e19b9d5d7d4a
