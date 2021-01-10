# 线性模型 Linear Model

***

***

[TOC]



## linear model

Definition

if you have $(x_{1},y_{1}),(x_{2},y_{2}),...(x_{n},y_{n})$ ,these data can :
$$
y = \beta_{0} + \beta_{1}x +\epsilon
$$


Suppose $E(\epsilon)=0, Var(\epsilon)=\sigma^{2}$.

So:
$$
E(y|x) = \beta_{0}+\beta_{1}x
$$

$$
Var(y|x)=\sigma^{2}
$$

⇥:
$$
\hat{y}=\hat{\beta_{0}} + \hat{\beta_{1}}x
$$





Matrix X and Matrix $\beta$
$$
y = 
	\begin{bmatrix}
		y_1 \\
		y_2 \\
		\vdots \\
		y_n \\
	\end{bmatrix}
	
\quad
X = 
	\begin{bmatrix}
		x_1 & 1 \\
		x_2 & 1 \\
		\vdots & \vdots \\
		x_n & 1 \\
	\end{bmatrix}
\quad
\beta =
	\begin{bmatrix}
		\beta_1 \\
		\beta_0 \\
	\end{bmatrix}
$$

$$
y - \hat{y} = y - X\beta \\
(y-\hat{y})^2 = (y-X\beta)'(y-X\beta)=y'y-\beta ' X'y- y'X\beta+\beta 'X'X\beta
$$

标量$\beta 'X'y = y'X\beta$，

So:
$$
\frac{\partial{(y-\hat{y})^2}}{\partial{\beta}}=-2X'y+2X'X\hat{\beta}=0
$$
So:$\hat{\beta} = (X'X)^{-1}X'y$,$\hat{y} = X\hat{\beta}=X(X'X)^{-1}X'y=Hy$

$e = y-\hat{y}=(I-H)y$



## 斜率与截距的假设检验：

误差服从正态分布（误差服从独立正态分布，切均值为0，方差为$\sigma^2$.

假设斜率等于常数

$H_0: \beta_1 = \beta_{10}, H_1: \beta_1 \ne \beta_{10}$

$t_0 = \frac{\hat{\beta_1}- \beta_{10}}{Se(\hat{\beta_1})}$

$Se(\hat{\beta_1})=\sqrt{\frac{MS_c}{S_{xx}}}$

if $|t_0|> t_{\alpha/2,n-2}$,so refuse $H_0$

截距：

$t_0 = \frac{\hat{\beta_0}- \beta_{00}}{\sqrt{MS_c(1/n+\bar{x}^2/S_{xx})}}$

回归显著性：$H_0:\beta_1 = 0$

当$|t_0|>t_{\alpha/2, n-2}$, 拒绝$H_0$，回归是显著的。

## 方差分析

$SS_{回}=\sum_{i=1}^{n}(\hat{y_i}- \bar{y})^2$

$SS_{残} = \sum_{i=1}^{n}(y_i - \hat{y_i})^2$

$SS_{总}=\sum_{i=0}^{n}(y_i- \bar{y})^2$

自由度：$df_{总} = df_{回}+df_{残}$

$n-1=1+(n-2)$

假设:$H_0: \beta_1 =0 $

$F_0 = \frac{SS_{回}/df_{回}}{SS_{残}/df_{残}}=\frac{SS_{回}/1}{SS_{残}/(n-2)}=\frac{MS_{回}}{MS_{残}}$

$F_0 > F_{\alpha,1,n-2}$拒绝$H_0$.

## 区间估计

斜率$\beta_1$的$100(1-\alpha)\%$置信区间：

$\hat{\beta_1}-t_{\alpha/2,n-2}Se(\hat{\beta_1})\leq \hat{\beta_1}\leq \hat{\beta_{1}}+t_{\alpha/2,n-2}Se(\hat{\beta_1})$

截距$\beta_0$的$100(1-\alpha)\%$置信区间：

$\hat{\beta_0}-t_{\alpha/2,n-2}Se(\hat{\beta_0})\leq \hat{\beta_0}\leq \hat{\beta_{0}}+t_{\alpha/2,n-2}Se(\hat{\beta_0})$

响应变量均值的区间估计：

$\hat{\mu}_{y/x_0}=\hat{\beta_0}+\hat{\beta_1}x_0$

$\hat{\mu}_{y/x_0}-t_{\alpha/2, n-2}\sqrt{MS_c(\frac 1n+\frac{(x_0-\bar{x})^2}{S_{xx}})}\leq E(y|x_0)\leq\hat{\mu}_{y/x_0}+t_{\alpha/2, n-2}\sqrt{MS_c(\frac 1n+ \frac{(x_0-\bar{x})^2}{S_{xx}})}$

新观测值的预测：

$\hat{y_0}=\hat{\beta_0}+\hat{\beta_1}x_0$

$\hat{\mu}_{y/x_0}-t_{\alpha/2, n-2}\sqrt{MS_c(1+\frac 1n+\frac{(x_0-\bar{x})^2}{S_{xx}})}\leq y_0\leq\hat{\mu}_{y/x_0}+t_{\alpha/2, n-2}\sqrt{MS_c(1+\frac 1n+ \frac{(x_0-\bar{x})^2}{S_{xx}})}$

## 决定系数

$R^2 = \frac{SS_{回}}{SS_{总}}=1-\frac{SS_{残}}{SS_{总}}$

y中$R^2$的变异性是由回归模解释。

$R^2$较大，也不意味着回归模型能进行精确的预测。

