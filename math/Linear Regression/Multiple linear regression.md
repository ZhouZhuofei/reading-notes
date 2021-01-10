# 多元线性回归 Multiple linear regression

***

[TOC]



## 模型Model

方程模型：

$y=X\beta+\varepsilon$

Among them:
$$
y=
	\begin{bmatrix}
		y_1 \\
		y_2 \\
		\vdots \\
		y_n \\
	\end{bmatrix},
	\quad
	X = 
		\begin{bmatrix}
			1 & x_{11} & x_{12} & \cdots &x_{1k} \\
			1 & x_{21} & x_{22} & \cdots &x_{2k} \\
			\vdots & \vdots & \vdots & \ddots & \vdots \\
			1 & x_{n1}& x_{n2} & \cdots & x_{nk}
		\end{bmatrix},
	\quad
	\beta = 
		\begin{bmatrix}
			\beta_0 \\
			\beta_1 \\
			\vdots \\
			\beta_k \\
		\end{bmatrix},
	\quad
	\varepsilon = 
		\begin{bmatrix}
			\varepsilon_1 \\
			\varepsilon_2 \\
			\vdots \\
			\varepsilon_n \\
		\end{bmatrix}
$$
Same as :

$\hat{\beta} = (X'X)^{-1}X'y$

$\sigma^2$的估计：

$\hat{\sigma}^2=\frac{SS_{残}}{n-p}$,$p$个参数，$n$个数据。



## 回归显著性检验

假设：

$H_0: \beta=\beta_1=\cdots=\beta_k=0$,$H_1:\beta_j \ne 0$(至少存在一个$j$)

$F_0 = \frac{SS_{回}/k}{SS_{残}/(n-k-1)}=\frac{MS_{回}}{SS_{残}}$

$F_0 > F_{\alpha, k, n-k-1}$,拒绝$H_0$

## 单个回归系数检验与回归系数子集检验

检验单个回归系数：

$\beta_j$显著性假设：

$H_0:\beta_j=0, \: H_1: \beta_j \ne 0$

$t_0 = \frac{\hat{\beta_j}}{\sqrt{\hat{\sigma^2}C_{jj}}}=\frac{\hat{\beta_j}}{se(\hat{\beta_j})}$

当$|t_0|>t_{\alpha/2, n-k-1}$时，拒绝$H_0$

## 一般线性假设检验

所感兴趣的假设可以表达成$H_0: T\beta=0$其中$T$为$m \times p$常数矩阵。

例如$H_0: \beta_1=\beta_3, \beta_2 = 0$,则：
$$
T = 
	\begin{bmatrix}
		0 & 1& 0& -1\\
		0 &0 &1 &0 \\
	\end{bmatrix}
$$
$T\beta =0$ 即$\beta_1=\beta_3,\beta_2=0$.

**全模型**为$y=X\beta+\varepsilon$

$SS_{残}(全模) = y'y-\hat{\beta}X'y$

简化模型：剩余$p-r$个回归系数

$y=Z\gamma+\varepsilon$,其中$Z$为$n\times(p-r)$矩阵，$\gamma$为未知回归系数的$(p-r)\times 1$向量

如上：
$$
\begin{align}
y &= \beta_0+\beta_1 x_1+\beta_2 x_2 +\beta_3 x_3 +\varepsilon\\
&=\beta_0+\beta_1 x_1+ 0\times x_2+\beta_1 x_3 +\varepsilon \\
& = \beta_0+\beta_1(x_1+x_3)+\varepsilon \\
& = \gamma_0 + \gamma_1 z_1 + \varepsilon
\end{align}
$$
$SS_{残}(简模)=y'y - \hat{\gamma}Z'y$

$SS_{假} = SS_{残}(全模)- SS_{残}(简模)$

自由度:$n-p+r-(n-p)=r$

$F_0 = \frac{SS_{假}/r}{SS_{残}(简模)/(n-p)}=\frac{\hat{\beta}'T'[T(X'X)^{-1}T']^{-1}T\hat{\beta}/r}{SS_{残}(简模)/(n-p)}$

$F_0 > F_{\alpha,r,n-p}$拒绝$H_0:T\beta=0$

扩展假设

$H_0: T\beta=c, \: H_1: T\beta \ne c$

其统计量:

$F_0=\frac{(T\hat{\beta}-c)'[T(X'X)^{-1}T']^{-1}(T\hat{\beta}-c)/r}{SS_{残}(简模)/(n-p)}$



## 置信区间

回归系数的置信区间：

$\hat{\beta_j}-t_{\alpha/2,n-p}\sqrt{\hat{\sigma}^2 C_{jj}}\leq \beta_j \leq \hat{\beta_j}+t_{\alpha/2,n-p}\sqrt{\hat{\sigma}^2 C_{jj}}$

$C_{jj}$ 是$(X'X)^{-1}$对角线元素

响应变量的均值的置信区间估计：
$$
x_0 = 
	\begin{bmatrix}
		1 \\
		x_{01} \\
		x_{02} \\
		\vdots \\
		x_{0k} \\
	\end{bmatrix},
	
$$
拟合值：$\hat{y}_0 = x_0' \hat{\beta}$

方差：$Var(\hat{y}_0) = \sigma^2 x_{0}'(X'X)^{-1}x_0$

响应变量均值的$100(1-\alpha)\%$置信区间为：

$\hat{y}_0-t_{\alpha/2,n-p}\sqrt{\hat{\sigma}^2x_0'(X'X)^{-1}x_0}\leq E(y|x_0) \leq \hat{y}_0+t_{\alpha/2,n-p}\sqrt{\hat{\sigma}^2x_0'(X'X)^{-1}x_0}$



新观测值的预测：

$x_0'=[1, x_{01}, x_{02},\cdots, x_{0k}]$

未来观测值的$100\times(1-\alpha)\%$预测区间：

$\hat{y}_0-t_{\alpha/2,n-p}\sqrt{\hat{\sigma}^2(1+x_0'(X'X)^{-1}x_0)}\leq y_0\leq \hat{y}_0-t_{\alpha/2,n-p}\sqrt{\hat{\sigma}^2(1+x_0'(X'X)^{-1}x_0)}$

## 标准化回归系数

- 用于解决变量之间尺度相差很多，舍入误差过大，消除由$(X'X)^{-1}$矩阵的舍入误差引起的问题。
- 判断回归变量对y的影响程度。

### 单位正态比例

$$
z_{ij} = \frac{x_{ij}-\bar{x_j}}{s_j}\\
y_i^{*} = \frac{y_i-\bar{y_i}}{s_y}\\
S_j^2 = \frac{\sum_{i=1}^{n}(x_{ij}-\bar{x_j})^2}{n-1}\\
S_y^2 = \frac{\sum_{i=1}^n(y_i - \bar{y_i})^2}{n-1}
$$





($i=1,2,\cdots,n$ and $j=1,2,\cdots, k$)
$$
y_i^* = b_1z_{i1}+b_2z_{i2}+\cdots+b_k z_{ik}+\varepsilon_i
$$
$\hat{b} = (Z'Z)^{-1}Z'y^*$



### 单位长度比例

$$
w_{ij} = \frac{x_{ij} - \bar{x_j}}{s_{jj}^{1/2}}, \: (i=1,2,\cdots,n \: and \: j=1,2,\cdots,k)\\
y_i^0 = \frac{y_i - \bar{y}}{SS_{总}^{1/2}}\\
S_{jj} = \sum_{i=1}^{n}(x_{ij} - \bar{x_j})^2\\
SS_{回} = \sum_{i=1}^{n}(y_i - \bar{y})^2
$$

$$
y_i^0 = b_1 w_{i1} + b_2 w_{i2}+ \cdots+b_k w_{ik}+ \varepsilon_{i}
$$

$\hat{b} = (W'W)^{-1}W'y^0$



实际上：$Z'Z = (n-1)W'W$



## VIF:方差膨胀因子

相关形式的$X'X$或$W'W$的逆的主对角线元素称为方差膨胀因子

标准假设：VIF=1，

VIF 越大越存在问题，当$VIF>10$意味着严重的多重共线性问题。

