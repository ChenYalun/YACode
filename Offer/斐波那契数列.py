# -*- coding:utf-8 -*-
# 斐波那契数列
class Solution:
    def Fibonacci(self, n):
        if n < 0 or n > 39:
            return 
        if n == 0:
            return 0
        if n == 1:
            return 1
        i = 2
        s = 0
        a = 0
        b = 1
        while i <= n:
            s = a + b
            a = b
            b = s
            i += 1
        return s
# 递归也可以
def fib1(n):
    if n == 0:
        return 0
    elif n == 1:
        return 1
    else:
        return fib1(n-1) + fib1(n-2)