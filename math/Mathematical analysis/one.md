# Mathematical analysis One

***

***

# 函数

### 实数

定义：设$S$是一个有大小顺序的非空数集，$A$和$B$是它的两个子集，如果满足以下条件：

1. $A \ne \emptyset, B \ne \emptyset$
2. $A\cup B = S$
3. $\forall a \in A, \forall b \in B$, 都有$a<b$
4. $A$中无最大数，

将$A,B$称为$S$的一个分划，记为$(A|B)$。



对有理数系的分划$(A|B)$，必有以下两种情况：

- $B$中存在最小的数，称$(A|B)$是一个有理分划
- $B$中不存在最小的数，称$(A|B)$是一个无理分划

有理数系$Q$的所有分划构成了一个集合（实数集$R$）。



戴德金分割定理：对$R$的任一分划$(A|B)$，$B$中必有最小数。



设集合$E \subset R$，且 $E\ne \empty$，如果存在$M\in R$使得对$\forall x \in E$，有$x\leq M$,称$E$是有上界的，$M$是$E$的一个上界；如果存在$m\in R$,使得对$\forall x \in E$，有$x\geq m$,称$E$是有下界的，$m$是$E$的一个下界。$E$既有上界也有下界，则为c称是$E$有界。



$E\subset R, E\ne \empty$,若$M\in E$满足：

- $M$是$E$的一个上界，即$\forall x \in E$,有$x\leq M$;
- 对所有的$\forall \epsilon>0$, 存在$x' \in E$，使得$x' > M - \epsilon$

则称$M$为$E$的上确界，记为$M=supE=sup_{x\in E}\{x\}$。

若$M\in E$满足：

- $M$是$E$的一个下界，即$\forall x \in E$,有$x\geq M$;
- 对$\forall \epsilon >0,\exists x \in E$，使得$x' <M+\epsilon$

则称为$M$为$E$的下确界，记为$M=infE=inf_{x\in E}\{x\}$。



非空有上界的实数集必有上确界；非空有下界的实数集必有下确界。



常用不等式：

$|x+y| \leq |x| + |y|$

对任意$x \geq -1$和任意整数$n$，有：$(1+x)^n \leq 1 + nx$

对任意$n$个非负实数$x_1,x_2,..,x_n$:$\frac{x_1+x_2+...+x_n}{n} \geq \sqrt[n]{x_1x_2...x_n}$

