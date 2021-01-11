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
    
    def __sub__(self. other):
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
