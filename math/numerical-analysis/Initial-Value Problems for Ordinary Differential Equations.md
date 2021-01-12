# Initial-Value Problems for Ordinary Differential Equations 常微分方程的初值问题

[TOC]







## 初值问题的初等理论 The elementary theory of Initial-value problem

*******
Definition 5.1:A function $f (t, y)$ is said to satisfy a **Lipschitz condition** in the variable y on a set $D \in R^2$,if a constant $L > 0$ exists with
$$
|f(t, y_1) - f(t, y_2)|\leq L|y_1 - y_2|
$$
whenever $(t, y1)$ and $(t, y2)$ are in $D$. The constant $L$ is called a Lipschitz constant for $f$ .


> Show that $f(t, y) = t| y|$ satisfies a Lipschitz condition on the interval $D = \{ (t, y) | 1 ≤
t≤2 \quad and\quad −3≤y≤4 \}$.
> 对于属于$D$中的任意两个点$(t, y_1), (t, y_2)$有
$$
|f(t, y_1) - f(t, y_2)|\leq |t|||y_1|-|y_2|| \leq 2|y_1 - y_2|
$$
Thus $f$ satisfies a Lipschitz condition on $D$ in the variable $y$ with Lipschitz constant $2$. 

******
Definition 5.2: $A$ set $D \in R^2$ is said to be convex(凸面) if whenever $(t_1,y_1)$ and $(t_2,y_2)$ belong to $D$, then $((1−λ)t_1 +λt_2,(1−λ)y_1 +λy_2)$ also belongs to $D$ forevery $λ$ in $[0,1]$.





