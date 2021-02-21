# Block chain programming



## Basic knowledge



##### finite field

The mathmatical definition of a **finite field**

A finite set of number and two operations + and $\cdot$ ,and satisfy the following property:

> 一个有限的数字集以及两个运算+（加法）和·（乘法），并且满足下面的性质:

- if $a$ and $b$ in a set, $a + b, a \cdot b$ also in the set, closed.
- Exist $0$, $a+0 = a$
- Exist $1$, $a\cdot 1=a$
- if $a$ in a set, $(-a)$ also in the set
- if $a\in A$, $a^{-1} \in A$



The set size is defined $p$, we call that the order of set.

> 集合大小定义为p，我们称之为集合的阶。



##### mod

> 模运算



we use mod to define $+$ and $\cdot$ in finite field

we define $+$:

$F_{n} = {0,1,2,..., n-1}$

$a, b \in F_{n}, a+b = (a+b)\%n$

For example: $7, 8 \in F_{11}$, $7+8=(7+8) \% 11 = 4$,so we calculate $7+8=4$ in a new $+_f$



Define $-$:

$a \in F_{n},-_f a = (-a)\% n$

For example: $7 \in F_{11}$, $-_f 7 = (-7)\%11=4$



Define $*$:
$a, b \in F_n, a*b=(a*b)\%n$

For example : $(3*12)\%13=10$



Define ^:

$a \in F_n, b \in N^+, a^b = mod(a^b, n)$

If b<0,$a^{-3} = a^{-3}*a^{1-p}=a^{p-4}$

$a^{p-1}=1$,so we can add n += p-1 until n>0(before we should define $inv$ in Julia)



Define $\div$:

> We have a theorem: when $p$ is prime num, $n^{p-1} \% p = 1$

$a/b = a \cdot_f (1/b) = a \cdot_f b^{-1}$

$b^{p-1}\%p=1$

$b^{-1} = b^{-1} \cdot_f b^{p-1}=b^{p-2}$

So : $2/7 = 2 \cdot 7 ^{(19-2)} = 2 \cdot 7^{17} \% 19$





All code in Julia

```julia
import .Base: *, +, -, /, <, <=, ==, >, >=, ^, inv
struct FieldElement
	Num::Int
	Prime::Int	
end

#show
function Base.show(io::IO, A::FieldElement)
	print(io, "FieldElement[$(A.Prime)]:$(A.Num)")
end

#+,-
function +(A::FieldElement, B::FieldElement)
	if A.Prime != B.Prime
		return "Cannot add two numbers in different Fields"
	else
		res = mod(A.Num + B.Num, B.Prime)
		return FieldElement(res, B.Prime)
	end
end
function -(A::FieldElement, B::FieldElement)
	if A.Prime != B.Prime
		return "cannot sub two numbers in different fields"
	else
		res = mod(A.Num-B.Num, B.Prime)
		return FieldElement(res, B.Prime)
	end
end



#⋅
function *(A::FieldElement, B::FieldElement)
	if A.Prime != B.Prime
		return "can multiple two nums in different fields"
	else
		res = mod(A.Num * B.Num, B.Prime)
		return FieldElement(res, B.Prime)
	end
end

#inv
function inv(A::FieldElement)
	return FieldElement(mod(A.Num^(A.Prime-2), A.Prime), A.Prime)
end

#^
function ^(A::FieldElement, B::Integer)
	n = B
	while n < 0
		n += A.Prime -1
	end
	res = mod(A.Num^n, A.Prime)
	return FieldElement(res, A.Prime)
end


#/
function /(A::FieldElement, B::FieldElement)
	if A.Prime != B.Prime
		return "cannot div two nums in different fields"
	else
		res = mod(A.Num * B.Num^(B.Prime-2), B.Prime)
		return FieldElement(res, B.Prime)
	end
end
```

for python:

```python
class FieldElement:
  def __init__(self, num, prime):
    if num >= prime or num < 0:
      error = "Num {} not in field range 0 to {}".format(num, prime - 1)
      raise ValueError(error)
    self.num = num
    self.prime = prime
  def __repr__(self):
    return "FieldElement_{}({})".format(self.num, self.prime)
  
  def __eq__(self, other):
    if other is None:
      return false
    return self.num == other.num and self.prime == other.prime
  
  def __ne__(self, other):
    return not (self == other)
  
  def __add__(self, other):
    if self.prime != other.prime:
      raise TypeError("Cannot add two numbers in different Fields")
    num = (self.num + other.num) % self.prime
    return self.__class__(num, self.prime)
  def __sub__(self, other):
    if self.prime != other.prime:
      raise TypeError("Cannot sub two numbers in different Fields")
    num = (self.num - other.num) % self.prime
    return self.__class__(num, self.prime)
  def __pow__(self, exponent):
    n = exponent
    while n < 0:
      n += self.prime -1
    num = pow(self.num, n, self.prime)
    return self.__class__(num, self.prime)
  def __mul__(self, other):
    if self.prime != other.prime:
      raise TypeError('Cannot multiply two nums in different fields')
    num = (self.num * other.num) % self.prime
    return self.__class__(num, self.prime)
  def __truediv__(self, other):
    if self.prime != other.prime:
      raise TypeError('Cannot divide two nums in different fields')
     
    num = self.num * pow(other.num, self.prime - 2, self.prime) % self.prime
    return self.__class__(num, self.prime)
  
  

```

##### Elliptic curve

Elliptic curve standard format: $y^2 = x^3 + ax +b$

define a struct: Point on Elliptic curve.



*Point addition*:

A line only intersect at one point, two point and three point in Elliptic curve.

Define:

We find any pint $P_1(x_1, y_1)$ and $P_2(x_2, y_2)$,

$P_1+P_2$: Draw aline throgh $P_1, P_2$ to find the third intersection on Elliptic Curve,then find the third point of symmetry on the X-axis.

Let's start define add on Elliptic Curve:

1. Addition identity elements
2. reversible
3. Associative
4. Commutative

Exist $I$, for any $A$: $A+I=A$, In Elliptic Curve, we call the point for infinity point.

Reversible: $A+(-A)=I$

- The two points are perpendicular to the X-axis or one of them is infinity.
- The two different points aren't perpendicular to the X-axis.
- the two points are same.

_**Infinity point**_:$(Inf, Inf)$

$A + (Inf, Inf)=A, A+(-A)=(Inf, Inf)$, $-A=(A.x, -A.y)$

$P_1(x_1, y_2), P_2(x_2, y_2)$ to find $P_3(x_3, y_3), x_1 \ne x_2$

The slope: $k=\frac{y_2 - y_1}{x_2 - x_1}$, 

$y = k(x-x_1) + y_1$

$y^2 = x^3+ax+b$

So:$(k(x-x_1)+y_1)^2 = x^3+ax+b \to x^3-k^2x^2+(a+2k^2x_1-2ky_1)x+b-k^2x_1^2+2kx_1y_1-y_1^2=0$

We konw the solution for the equation is $(x_1, y_1),(x_2, y_2),(x_3, y_3)$:

$(x-x_1)(x-x_2)(x-x_3)=0 \to x^3 - (x_1+x_2+x_3)x^2+(x_1x_2+x_1x_3+x_2x_3)x - x_1x_2x_3=0$

So: $k^2 =(x_1+x_2)+x_3 \to x_3 = k^2-x_1 -x_2$

$y_3 = -(k(x_3 - x_1)+y_1)=k(x_1-x_3)-y_1$

if $P_1=P_2$  to calculate $P_1+P_2$:

Tangent to $P_1$ and find another intersection point with the elliptic curve.

$k = \frac{3x_1^2 + a}{2y_1}$

$x_3 = k^2 - 2x_1$

$y_3 = k(x_1 - x_3) - y_1$

 if tangent is perpendicular x-axis. We return $(Inf, Inf)$



all code python:

```python
class FieldElement:
  """
  def a infinity Field {0, 1, ..., n-1}, the add and sub .e.g all are use mod
  to calculate.
  """
  def __init__(self, num, prime):
    if num >= prime or num < 0:
      error = "Num {} not in field range 0 to {}".format(num, prime - 1)
      raise ValueError(error)
    self.num = num
    self.prime = prime
  def __repr__(self):
    return "FieldElement_{}({})".format(self.num, self.prime)
  
  def __eq__(self, other):
    if other is None:
      return False
    return self.num == other.num and self.prime == other.prime
  
  def __ne__(self, other):
    return not (self == other)
  
  def __add__(self, other):
    if self.prime != other.prime:
      raise TypeError("Cannot add two numbers in different Fields")
    num = (self.num + other.num) % self.prime
    return self.__class__(num, self.prime)
  def __sub__(self, other):
    if self.prime != other.prime:
      raise TypeError("Cannot sub two numbers in different Fields")
    num = (self.num - other.num) % self.prime
    return self.__class__(num, self.prime)
  def __rmul__(self, coefficient):
      sum = coefficient*self.num % self.prime
      return self.__class__(sum, self.prime)
  def __pow__(self, exponent):
    n = exponent
    while n < 0:
      n += self.prime -1
    num = pow(self.num, n, self.prime)
    return self.__class__(num, self.prime)
  def __mul__(self, other):
    if self.prime != other.prime:
      raise TypeError('Cannot multiply two nums in different fields')
    num = (self.num * other.num) % self.prime
    return self.__class__(num, self.prime)
  def __truediv__(self, other):
    if self.prime != other.prime:
      raise TypeError('Cannot divide two nums in different fields')
     
    num = self.num * pow(other.num, self.prime - 2, self.prime) % self.prime
    return self.__class__(num, self.prime)


class Point:
  """
  define a Elliptic curve calculate the point on a curve.
  """
  def __init__(self, x, y, a, b, inf):
    if inf is False and y**2 != x**3 + a * x +b:
      error = "Point not on the curve"
      raise ValueError(error)
    self.a = a
    self.b = b
    self.x = x
    self.y = y
    self.inf = inf

  def __add__(self, other):
    if self.a != other.a or self.b != other.b:
      raise TypeError("two Points cann't add in different curve")
    if self.inf is True:
      return other
    if other.inf is True:
      return self
    if self.x != other.x:
      k = (other.y - self.y)/(other.x - self.x)
      x3 = k**2 - self.x - other.x
      y3 = k * (self.x - x3) - self.y
      return self.__class__(x3,y3,self.a, self.b, False)
    if self == other and self.y == 0*self.x:
      return self.__class__(None, None, self.a, self.b, True)
    if self == other:
      k = (3*self.x**2 + self.a)/(2*self.y)
      x3 = k**2 - 2*self.x
      y3 = k*(self.x -x3) - self.y
      return self.__class__(x3, y3, self.a, self.b, False)
    if self.x == other.x and self.y != other.y:
      return self.__class__(None, None, self.a, self.b, True)


  def __rmul__(self, coefficient):

    coef = coefficient
    current = self
    result = self.__class__(None, None, self.a, self.b, True)
    while coef:
        if coef & 1:
            result += current
        current += current
        coef >>= 1
    return result
  def __repr__(self):
    if self.inf == True:
      return "Point(Infinity)"
    else:
      return "Point({}, {}, {},{})".format(self.x, self.y, self.a, self.b)
    
  def __eq__(self, other):

    return self.x == other.x and self.y == other.y and self.a == other.a and self.b == other.b and self.inf == other.inf


P = 2**256 - 2**32 -977
class C256Field(FieldElement):
  def __init__(self, num, prime=None):
    super().__init__(num=num, prime=P)
  
  def __repr__(self):
    return '{:x}'.format(self.num).zfill(64)

A = 0
B = 7
class C256Point(Point):
  def __init__(self, x, y, a=None, b=None, inf=False):
    a, b = C256Field(A), C256Field(B)
    if type(x) == int:
      super().__init__(x=C256Field(x), y=C256Field(y), a=a, b=b, inf=inf)
    else:
      super().__init__(x=x,y=y,a=a,b=b,inf=inf)




a = 0
b = 7
p = 2**256 - 2**32 -977
Gx = 0x79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798
Gy = 0x483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8
n = 0xfffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141

n1 = 115792089237316195423570985008687907852837564279074904382605163141518161494337
x = FieldElement(Gx, p)
y = FieldElement(Gy, p)
seven = FieldElement(7, p)
zero = FieldElement(0, p)
G = Point(x,y,zero,seven, False)
print(n*G)
print(C256Point(Gx, Gy))
print(n * C256Point(Gx, Gy))

        
```



##### Public key cryptography $P=eG$

$e$ for private key, $P$ for public key.

**Elliptic Curve Digital Signature Algorithm** ECDSA

Assumption : k is 256 Num, and $kG = R$

we now focus on R x-axis, named $r$

this function equals decrete log problem:$uG+vP = kG$

$k$ is a random, $u$ and $v$ is provided by signer, $G$ and $P$ are known.

$P = ((k-u)/v)G= eG$

Signature hash

You message =>hash => z

`z = int(hashlib.sha256(b'your message').hexdigest(), base=16)`

$u = z/s, v=r/s$

$uG + vP = R=kG$

$u+ve=k \to (z+re)/s = k$ So $s = (z +re)/k$

Steps:

- The receiving signer provides $(r, s)$ as the signature, and $z$ is the hash value of the signed content. $P$ is public key
- Calculate $u=z/s, v = r/s$
- Calculate $uG+vP = R$
- if R 's x-axis = r, the signature is valid.

Do more

```python
class FieldElement:
  """
  def a infinity Field {0, 1, ..., n-1}, the add and sub .e.g all are use mod
  to calculate.
  """
  def __init__(self, num, prime):
    if num >= prime or num < 0:
      error = "Num {} not in field range 0 to {}".format(num, prime - 1)
      raise ValueError(error)
    self.num = num
    self.prime = prime
  def __repr__(self):
    return "FieldElement_{}({})".format(self.num, self.prime)
  
  def __eq__(self, other):
    if other is None:
      return False
    return self.num == other.num and self.prime == other.prime
  
  def __ne__(self, other):
    return not (self == other)
  
  def __add__(self, other):
    if self.prime != other.prime:
      raise TypeError("Cannot add two numbers in different Fields")
    num = (self.num + other.num) % self.prime
    return self.__class__(num, self.prime)
  def __sub__(self, other):
    if self.prime != other.prime:
      raise TypeError("Cannot sub two numbers in different Fields")
    num = (self.num - other.num) % self.prime
    return self.__class__(num, self.prime)
  def __rmul__(self, coefficient):
      sum = coefficient*self.num % self.prime
      return self.__class__(sum, self.prime)
  def __pow__(self, exponent):
    n = exponent
    while n < 0:
      n += self.prime -1
    num = pow(self.num, n, self.prime)
    return self.__class__(num, self.prime)
  def __mul__(self, other):
    if self.prime != other.prime:
      raise TypeError('Cannot multiply two nums in different fields')
    num = (self.num * other.num) % self.prime
    return self.__class__(num, self.prime)
  def __truediv__(self, other):
    if self.prime != other.prime:
      raise TypeError('Cannot divide two nums in different fields')
     
    num = self.num * pow(other.num, self.prime - 2, self.prime) % self.prime
    return self.__class__(num, self.prime)


class Point:
  """
  define a Elliptic curve calculate the point on a curve.
  """
  def __init__(self, x, y, a, b, inf):
    if inf is False and y**2 != x**3 + a * x +b:
      error = "Point not on the curve"
      raise ValueError(error)
    self.a = a
    self.b = b
    self.x = x
    self.y = y
    self.inf = inf

  def __add__(self, other):
    if self.a != other.a or self.b != other.b:
      raise TypeError("two Points cann't add in different curve")
    if self.inf is True:
      return other
    if other.inf is True:
      return self
    if self.x != other.x:
      k = (other.y - self.y)/(other.x - self.x)
      x3 = k**2 - self.x - other.x
      y3 = k * (self.x - x3) - self.y
      return self.__class__(x3,y3,self.a, self.b, False)
    if self == other and self.y == 0*self.x:
      return self.__class__(None, None, self.a, self.b, True)
    if self == other:
      k = (3*self.x**2 + self.a)/(2*self.y)
      x3 = k**2 - 2*self.x
      y3 = k*(self.x -x3) - self.y
      return self.__class__(x3, y3, self.a, self.b, False)
    if self.x == other.x and self.y != other.y:
      return self.__class__(None, None, self.a, self.b, True)


  def __rmul__(self, coefficient):

    coef = coefficient
    current = self
    result = self.__class__(None, None, self.a, self.b, True)
    while coef:
        if coef & 1:
            result += current
        current += current
        coef >>= 1
    return result
  def __repr__(self):
    if self.inf == True:
      return "Point(Infinity)"
    else:
      return "Point({}, {}, {},{})".format(self.x, self.y, self.a, self.b)
    
  def __eq__(self, other):

    return self.x == other.x and self.y == other.y and self.a == other.a and self.b == other.b and self.inf == other.inf


P = 2**256 - 2**32 -977
class C256Field(FieldElement):
  def __init__(self, num, prime=None):
    super().__init__(num=num, prime=P)
  
  def __repr__(self):
    return '{:x}'.format(self.num).zfill(64)

A = 0
B = 7
N = 0xfffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141
Gx = 0x79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798
Gy = 0x483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8


class C256Point(Point):
  def __init__(self, x, y, a=None, b=None, inf=False):
    a, b = C256Field(A), C256Field(B)
    if type(x) == int:
      super().__init__(x=C256Field(x), y=C256Field(y), a=a, b=b, inf=inf)
    else:
      super().__init__(x=x,y=y,a=a,b=b,inf=inf)

  def __repr__(self):
    return 'Point({}, {})'.format(self.x, self.y)

  #Sec 序列化
  def sec(self):
    """
    return the binary version of sec format
    """
    return b'\x04'+self.x.num.to_bytes(32, 'big') + self.y.num.to_bytes(32, 'big')

class PrivateKey:
  def __init__(self, secret):
    self.secret = secret
    self.point = secret * G
  def hex(self):
    return '{:x}'.format(self.secret).zfill(64)

  def sign(self, z):
    k = self.deterministic_k(z)
    r = (k*G).x.num
    k_inv = pow(k, N-2, N)
    s = (z + r*self.secret) * k_inv % N
    if s > N/2:
      s = N - s
    
    return Signature(r, s)
  def deterministic_k(self, z):
    """RFC"""
    k = b'\x00' * 32
    v = b'\x01' * 32
    if z > N:
      z -= N
    
    z_bytes = z.to_bytes(32, 'big')
    secret_bytes = self.secret.to_bytes(32, 'big')
    s256 = hashlib.sha256
    k = hmac.new(k, v + b'\x00' + secret_bytes + z_bytes, s256).digest()
    v = hmac.new(k, v, s256).digest()
    k = hmac.new(k, v + b'\x01' + secret_bytes + z_bytes, s256).digest()
    v = hmac.new(k, v, s256).digest()
    while True:
      v = hmac.new(k, v, s256).digest()
      candidate = int.from_bytes(v, 'big')
      if candidate >= 1 and candidate < N:
        return candidate
      k = hmac.new(k, v + b'\x00', s256).digest()
      v = hmac.new(k, v, s256).digest()




class Signature:
  def __init__(self, r, s):
    self.r = r
    self.s = s
  def __repr__(self):
    return 'Signature({:x}, {:x})'.format(self.r, self.s)
  




G = C256Point(Gx, Gy)
def Verify(PublicKey, z, sig):
  s_inv = pow(sig.s, N - 2, N)
  u = z * s_inv % N
  v = sig.r * s_inv % N
  total = u * G + v * PublicKey
  return total.x.num == sig.r





import hashlib
import hmac
#private Key
e = int(hashlib.pbkdf2_hmac('sha256', b'your secret password45789', b'salt', 100000).hex(), base=16)
#message, which needed signature
z = int(hashlib.pbkdf2_hmac('sha256', b'your message password1', b'salt', 100000).hex(), base=16)


sign1 = PrivateKey(e).sign(z)
Publickey = e * G
#提供公钥，信息的hash,以及签名(r,s), 进行验证
print(Verify(Publickey, z, sign1))


```



##### 序列化(serialization)

for Public Key $P = (x, y)$, uncompress SEC format:

1. 以0x04作为前缀
2. 以大端序整数形式放入32字节的x轴坐标
3. 以大端序整数形式放入32字节的y轴坐标

if compress



for $x$ on the curve, only have two $y$, make that: $y^2 = x^3 + ax + b$.

if $(x,y)$ on the Field of curve, $-y\%p=(p-y)\%p$, $(x, p-y)$ also on the curve.

If we know the $x$, the y wil be the $y$ or $p-y$.

$p >2$, $p \%2 \ne 0$, if $y$ is odd, $p-y$ is even.



ways:

1. 以y的奇偶性作为前缀，如果y是偶数，则为0x02，否则为0x03。

2. 以大端序整数的形式放入32字节的x轴坐标.



对于签名的序列化，我们产生$(r,s)$

签名序列化的标准是DER（Distinguished Encoding Rules，可分别编码规则）格式。

1. 以0x30字节作为前缀。
2. 编码剩余签名的长度（通常为0x44或者0x45）。
3.  追加标记字节0x02。
4.  以大端序编码r，如果r的第一个字节大于等于0x80，则在r前置0x00，计算r序列化的长度并置于r的编码结果前，追加以上内容。
5.  追加标记字节0x02。
6. 以大端序编码s，如果s的第一个字节大于等于0x80，则在s前置0x00，计算s序列化的长度并置于s的编码结果前，追加以上内容

```python
class Signature:
  """..."""
    def der(self):
    rbin = self.r.to_bytes(32, 'big')
    rbin = rbin.lstrip(b'\x00')
    if rbin[0] & 0x80:
      rbin = b'\x00' + rbin
    result = bytes([2, len(rbin)]) + rbin
    sbin = self.s.to_bytes(32, 'big')
    sbin = sbin.lstrip(b'\x00')
    if sbin[0] & 0x80:
      sbin = b'\x00' + sbin
    result += bytes([2, len(sbin)]) + sbin
    return bytes([0x30, len(result)]) + result
  
import hashlib
import hmac
#private Key
e = int(hashlib.pbkdf2_hmac('sha256', b'your secret password45789', b'salt', 100000).hex(), base=16)
#message, which needed signature
z = int(hashlib.pbkdf2_hmac('sha256', b'your message password1', b'salt', 10000).hex(), base=16)


sign1 = PrivateKey(e).sign(z)
print(sign1.der().hex())
```



使用Base58

转录公钥

```python
BASE58_ALPHABET = '123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'

def encode_base58(s):
    count = 0
    for x in s:
        if x == 0:
            count += 1
        else:
            break
    num = int.from_bytes(s, 'big')
    prefix = '1' * count
    result = ''
    while num > 0:
        num, mod = divmod(num, 58)
        result = BASE58_ALPHABET[mod] + result
    return prefix + result

print(encode_base58(b"\x02\x93>\xc2\xd2\xb1\x11\xb9'7\xec\x12\xf1\xc5\xd2\x0f23\xa0\xad!\xcd\x8b6\xd0\xbc\xa7\xa0\xcf\xa5\xcb\x87\x01"))
s = int('7c076ff316692a3d7eb3c3bb0f8b1488cf72e1afcd929e29307032997a838a3d',16).to_bytes(32, "big")
h = bytes.fromhex('7c076ff316692a3d7eb3c3bb0f8b1488cf72e1afcd929e29307032997a838a3d')
print(encode_base58(s))
print(encode_base58(h))
```



比特币地址的生成步骤：

1. 对于比特币主链地址，采用0x00前缀，测试链采用0x6f。
2. 对SEC格式（包括压缩的和未压缩的）做一次sha256运算，之后再做一次ripemd160哈希运算。这两次哈希运算被称为一次hash160运算。
3.  将步骤1的前缀和步骤2的结果拼接。
4. 对步骤3的结果做一次hash256，并取其前四个字节。

```python
def encode_base58_checksum(b):
    return encode_base58(b + hashlib.sha256(h).digest()[:4])
```



1.  拼接步骤3和步骤4的结果，使用Base58对其编码。



##### Trade

一个交易包括:
- 版本号(Version)
- 输入(Input)
- 输出(Output)
- 时间锁(Locktime)




