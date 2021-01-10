# 修正模型的不适用性的变换和加权 Modifies the transformation and weighting of the model's inapplicability

***

[TOC]



## 方差稳定化变换

| $\sigma^2$ 与$E(y)$的关系  | 变换                                                         |
| -------------------------- | ------------------------------------------------------------ |
| $\sigma^2 \sim E(y)$       | $y'=\sqrt{y}$ （平方根变换，对柏松分布）                     |
| $\sigma \sim E(y)(1-E(y))$ | $y'=sim^{-1}(\sqrt{y})$   (arcsin变换；对二项比例$0\leq y_i \leq 1$) |
| $\sigma^2 \sim [E(y)]^2$   | $y'=ln(y)$（对数变化）                                       |
| $\sigma^2 \sim [E(y)]^3$   | $y'=y^{-1/2}$（平方根倒数变化）                              |
| $\sigma \sim [E(y)]^4$     | $y'=y^{-1}$（倒数变化)                                       |
| $\sigma^2 \sim 常数$       | $y'=y$                                                       |



## 模型线性化变换

| 可线性化函数                       | 变换                       | 线性形式                     |
| ---------------------------------- | -------------------------- | ---------------------------- |
| $y=\beta_0 x^{\beta_1}$            | $y'=log y, x' = logx$      | $y'=log\beta_0 + \beta_1x'$  |
| $y = \beta_0 e^{\beta_1x}$         | $y'=ln y$                  | $y' = ln \beta_0 + \beta_1x$ |
| $y=\beta_0+\beta_1log x$           | $x'=logx$                  | $y' = \beta_0 + \beta_1 x'$  |
| $y = \frac{x}{\beta_0x - \beta_1}$ | $y'=\frac 1y, x'=\frac 1x$ | $y' = \beta_0 - \beta_1x'$   |



## 选择变换的分析方法

### 对$y$进行变换： 博克斯-考克斯方法



合适的程序是使用：
$$
\begin{equation}
y^{(\lambda)} = \left \{
\begin{aligned}
\frac{y^{\lambda}-1}{\lambda \dot{y}^{\lambda-1}}, \lambda \ne 0\\
\dot{y}lny, \lambda = 0 
\end{aligned}
\right .
\end{equation}
$$
其中：$\dot{y} = ln^{-1}[1/n\sum_{i=1}^{n} lny_i]$

拟合的模型：
$$
y^{(\lambda)} = X\beta + \varepsilon
$$


采用最大似然估计：计算每个不同的$\lambda$的$SS_{残}$,选择最小的。

### 对x进行变换

通过最小二乘拟合模型：

$\hat{y} = \hat{\beta_0} + \hat{\beta_1}x$

猜想$\alpha_0 =1$.$w = xlnx$

最小二乘估计:$\hat{y} = \hat{\beta_0^*}+ \hat{\beta_1^*}x+ \lambda w$

改变 $\alpha_0 = \lambda/\beta_1 +1 $

改变$x' = x^{-\alpha}$ if $\alpha \ne 0$ 

If $\alpha = 0, x' = lnx$, 

$ w = x'lnx'$

迭代$\alpha$会稳定在一个值范围内。

## 广义最小二乘与加权最小二乘



### 广义最小二乘

通常的线下模型$y = X\beta + \varepsilon$所做的假设为$E(\varepsilon)=0,Var(\varepsilon)=\sigma^2 I$.，有时候这两个假设是不合理的，现考虑假设$Var(\varepsilon)=\sigma^2 V$，式中的$V$为已知的$n\times n$ 矩阵，如果$V$式对角且对角元素不相等，则观测值$y$不相关但方差不相等；而如果$V$某些非对角元素非0，则$y$相关。

