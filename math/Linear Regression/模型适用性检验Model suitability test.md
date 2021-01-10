# 模型适用性检验 Model suitability test

***

[TOC]

诊断违背基本回归假设的方法

主要假设：

1. 响应变量$y$与回归变量之间的关系是线性，或近似线性的
2. 误差项$\varepsilon$有0均值
3. 误差项$\varepsilon$有常数方差$\sigma^2$
4. 误差不相关
5. 误差正态分布



## 残差分析

残差：$e_i = y_i - \hat{y_i}$

寻找离群点，极端值

### 标准化残差

$$
d_i = \frac{e_i}{\sqrt{MS_{残}}}, \: (i = 1,2,\cdots,n)
$$

有较大的标准化残差（for example: $d_i >3)能表明是离群点。

### 学生化残差

$e = (I-H)y = (I-H)(X\beta+\varepsilon)$

So $e = X\beta-X(X'X)^{-1}X'X\beta+(I - H)\varepsilon = (I-H)\varepsilon$

$Var(e) = Var[(I-H)\varepsilon] = (I-H)\varepsilon(I-H)' = \sigma^2(I-H)$

So:$Var(e_i) = \sigma^2(1-h_{ii})$, and $Cov(e_i,e_j)=-\sigma^2h_{jj}$

由于$0<h_{ii}<1$使用MS计算回高估$Var(e_i)$,$e_i$的方差取决于$x_i$位置，一般而言，靠近x空间中心的点比更远位置的点的残差有更大的方差，对模型假设的违背更可能出现在较远的点中，为普通残差（或标准化残差）通常较小，所以不容易被发现。

强杠杆点，将回归直线拽向它。

学生化残差：
$$
r_i = \frac{e_i}{MS_{残}(1-h_{ii})}
$$
当模型正确，无论$x_i$的位置如何，$Var(r_i)=1$,$r_i$越大，，越有可能出现问题。

### PRESS 残差

$y_i - \hat{y}_{(i)}$,所计算出的量，$\hat{y}_{(i)}$为基于除了第$i$个观测点的其他所有观测值的第$i$个响应变量的拟合值。

$e_{(i)}=\frac{e_i}{1-h_{ii}}$

$标准化PRESS$: $\frac{e_i}{\sqrt{\sigma^2(1-h_{ii})}}$



使用$MS_{残}$估计$\sigma^2$时，即学生化残差。

残差的**内部尺度**：通过$n$个观测值的模型得到的$\sigma^2$的内部生成的估计值。

移除第$i$个观测值后的数据集的$\sigma^2$的估计值，记为：$S_{(i)}^{2}=\frac{(n-p)MS_{残}-e_{i}^2/(1-h_{ii})}{n-p-1}$

**R-学生化残差**：$t_i=\frac{e_i}{\sqrt{S_{(i)}^2(1-h_{ii})}}$



## 正态概率图

- 理想的
- 轻尾分布
- 重尾分布
- 正的偏斜
- 负的偏斜



残差图：

1. 理想型
2. 漏斗模式
3. 双弓模式
4. 非线性模式



## 偏回归图和偏残差图

## PRESS统计量

PRESS统计量定义为：
$$
PRESS = \sum_{i=1}^{n}[y_i-\hat{y}_{(i)}]^2=\sum_{i=1}^{n}[\frac{e_i}{1-h_{ii}}]^2
$$
PERSS越小越好。

> 所有的模型都是错误的，但有的模型是有用的。



## 回归的失拟

