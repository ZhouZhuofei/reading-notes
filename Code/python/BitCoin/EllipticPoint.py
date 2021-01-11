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
            return "point({},{},{},{})".format(self.x, self.y, 
                    self.a, self.b, self.a)
    
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
    

        




