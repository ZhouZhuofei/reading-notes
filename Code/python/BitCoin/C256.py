from base58 import b58encode, b58encode_check
import hashlib
import hmac

class FieldElement:
    """
    FieldElement:
    definte a infinity Field F_p = {0, 1, ..., p-1},It's closed to 
    addition and multiplication。
    1. a in F_p, b in F_p, Then a+b in F_p, a*b in F_p.
    2. if exist 0, a + 0 = a
    3. exist 1, a * 1 = a
    4. if a in F_p, -a also in F_p; a + (-a) = 0;
    5. if a in F_p, a^(-1) also in F_p, a * a^(-1) = 1

    FieldElement need a num(0<num<prime) and a prime.
    
    For example:
    >>> a = FieldElement(7, 13)
    >>> b = FieldElement(6, 13)
    >>> c = FieldElement(12, 13)
    >>> print(a == b)
    False
    >>> print(a == a)
    True
    >>> print(a+c == b)
    True

    for pow:
    >>> a = FieldElement(3, 13)
    >>> b = FieldElement(1, 13)
    >>> print(a**3 == b)
    True
    
    Like these...
    
    """
    def __init__(self, num, prime):
        if num >= prime or num < 0:
            raise ValueError("Num {} not in field 0 to {}".
                format(num, prime-1))
        
        self.num = num
        self.prime = prime

    def __repr__(self):
        return "FE_{}({})".format(self.num, self.prime)
    
    def __eq__(self, other):
        if other is None:
            return False
        return self.num == other.num and self.prime == other.prime

    def __ne__(self, other):
        return not (self == other)
    
    def __add__(self, other):
        if self.prime != other.prime:
            raise TypeError("Cann't add in different fields.")
        num = (self.num + other.num) % self.prime
        return self.__class__(num, self.prime)
    
    def __sub__(self, other):
        if self.prime != other.prime:
            raise TypeError("Cann't sub in different fields")
        num = (self.num - other.num) % self.prime
        return self.__class__(num, self.prime)
        
    def __rmul__(self, coe):
        res = coe * self.num % self.prime
        return self.__class__(res, self.prime)

    def __pow__(self, exponent):
        n = exponent
        while  n < 0:
            n += self.prime - 1
        num = pow(self.num, n, self.prime)
        return self.__class__(num, self.prime)

    def __mul__(self, other):
        if self.prime != other.prime:
            raise TypeError("Cann't multiply two nums in different field")
        num = (self.num * other.num) % self.prime
        return self.__class__(num, self.prime)
    
    def __truediv__(self, other):
        if self.prime != other.prime:
            raise TypeError('Cannot divide two nums in different fields')
     
        num = self.num * pow(other.num, self.prime - 2, self.prime) % self.prime
        return self.__class__(num, self.prime)

class EllipticPoint:
    """
    EllipticPoint:
        define the point on the elliptic curve.(y**2 = x**3 + ax +b).
    the point on the curve. and have a unique add and mul.
    >>> EllipticPoint(x, y, a, b)

    """
    def __init__(self, x, y, a, b):
        self.a = a
        self.b = b
        self.x = x
        self.y = y
        if self.x is None and self.y is None:
            return
        if self.y ** 2 != self.x ** 3 + self.a * self.x + self.b:
            raise ValueError('({}, {}) is not on the curve'.format(x, y))
    
    def __repr__(self):
        if self.x == None and self.y == None:
            return "Point(infinity)"
        else:
            return "point({},{},{},{})".format(self.x, self.y, self.a, self.b)
    
    def __add__(self, other):
        if self.a != other.a or self.b != other.b:
            raise TypeError("Points {}, {} are not on the same curve.")
        if self.x is None:
            return other
        if other.x is None:
            return self
        if self.x != other.x:
            k = (other.y - self.y)/(other.x - self.x)
            x3 = k**2 - self.x - other.x
            y3 = k * (self.x - x3) - self.y
            return self.__class__(x3, y3, self.a, self.b)
        if self == other and self.y == 0 * self.x:
            return self.__class__(None, None, self.a, self.b)
        if self == other:
            k = (3*self.x**2 + self.a)/(2*self.y)
            x3 = k**2 - 2*self.x
            y3 = k*(self.x -x3) - self.y
            return self.__class__(x3, y3, self.a, self.b)
        if self.x == other.x and self.y != other.y:
            return self.__class__(None, None, self.a, self.b)

    def __rmul__(self, coe):
        coef = coe
        current = self
        res = self.__class__(None, None, self.a, self.b)
        while coef:
            if coef & 1:
                res += current
            current += current
            coef >>= 1
        return res

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y \
            and self.a == other.a and self.b == other.b
    
    def __ne__(self, other):
        return not (self == other)
    

        







P = 2**256 - 2**32 -977
A = 0
B = 7
N = 0xfffffffffffffffffffffffffffffffebaaedce6af48a03bbfd25e8cd0364141
Gx = 0x79be667ef9dcbbac55a06295ce870b07029bfcdb2dce28d959f2815b16f81798
Gy = 0x483ada7726a3c4655da4fbfc0e1108a8fd17b448a68554199c47d08ffb10d4b8

class C256Field(FieldElement):
    """
    """
    def __init__(self, num, prime=None):
        super().__init__(num=num, prime=P)
    
    def __repr__(self):
        return '{:x}'.format(self.num).zfill(64)
    
    def sqrt(self):
        return self**((P+1) // 4)



class C256Point(EllipticPoint):
    """
    """
    def __init__(self, x, y, a=None, b=None):
        a, b = C256Field(A), C256Field(B)
        if type(x) == int:
            super().__init__(x=C256Field(x), y=C256Field(y), a=a, b=b)
        else:
            super().__init__(x=x, y=y, a=a, b=b)
    
    def __rmul__(self, coe):
        coef = coe % N
        return super().__rmul__(coef)
    
    def __repr__(self):
        if self.x is None:
            return 'C256Point(infinity)'
        else:
            return 'C256Point({}, {})'.format(self.x, self.y)
    
    def verify(self, z, sig):
        s_inv = pow(sig.s, N - 2, N)
        u = z * s_inv % N
        v = sig.r * s_inv % N
        total = u * G + v * self
        return total.x.num == sig.r
    
    def sec(self, compressed=True):
        """
        return the binary version of sec format
        """
        if compressed:
            if self.y.num % 2 == 0:
                return b'\x02' + self.x.num.to_bytes(32, 'big')
            else:
                return b'\x03' + self.x.num.to_bytes(32, 'big')
        else:
            return b'\x04'+self.x.num.to_bytes(32, 'big') + self.y.num.to_bytes(32, 'big')
    
    @classmethod
    def parse(self, sec_bin):
        """
        return a Point object from a SEC binary
        """
        if sec_bin[0] == 4:
            x = int.from_bytes(sec_bin[1:33], 'big')
            y = int.from_bytes(sec_bin[33:65], 'big')
            return C256Point(x=x, y=y)
        is_even = sec_bin[0] == 2
        x = C256Field(int.from_bytes(sec_bin[1:], 'big'))
        #right side of the equation y^2 = x^3 + 7
        alpha = x**3 + C256Field(B)
        beta = alpha.sqrt()
        if beta.num % 2 == 0:
            even_beta = beta
            odd_beta = C256Field(P - beta.num)
        else:
            even_beta = C256Field(P - beta.num)
            odd_beta = beta

        if is_even:
            return C256Point(x, even_beta)
        else:
            return C256Point(x, odd_beta)
    
    def hash160(self, compressed=True):
        return hashlib.new('ripemd160', hashlib.sha256(self.sec(compressed)).digest()).digest()
    
    def address(self, compressed=True, testnet=False):
        """Return address string"""
        h160 = self.hash160(compressed)
        if testnet:
            prefix = b'\x6f'
        else:
            prefix = b'\x00'


        return b58encode_check(prefix + h160).decode("utf-8")


class Signature:
    """
    """
    def __init__(self, r, s):
        self.r = r
        self.s = s

    def __repr__(self):
        return 'Signature({:x},{:x})'.format(self.r, self.s) 

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




G = C256Point(Gx, Gy)

class PrivateKey:
    """
    """
    def __init__(self, secret):
        self.secret = secret
        self.point = secret * G  

    def hex(self):
        return '{:x}'.format(self.secret).zfill(64)

    def sign(self, z):
        k = self.deterministic_k(z)  
        r = (k * G).x.num
        k_inv = pow(k, N - 2, N)
        s = (z + r * self.secret) * k_inv % N
        if s > N / 2:
            s = N - s
        return Signature(r, s)

    def deterministic_k(self, z):
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

    def wif(self, compressed=True, testnet=False):
        secret_bytes = self.secret.to_bytes(32, 'big')
        if testnet:
            prefix = b'\xef'
        else:
            prefix = b'\x80'
        
        if compressed:
            suffix = b'\x01'
        else:
            suffix = b''
        
        return b58encode_check(prefix + secret_bytes + suffix).decode("utf-8")


    


#x = bytes.fromhex('7c076ff316692a3d7eb3c3bb0f8b1488cf72e1afcd929e29307032997a838a3d')
#print(b58encode(x).decode('utf-8'))
#priv = PrivateKey(5003)
#print(priv.point.address(compressed=True, testnet=True))
#print(priv.wif(compressed=True, testnet=True))