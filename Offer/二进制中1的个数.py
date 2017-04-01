# -*- coding:utf-8 -*-
class Solution:
    def NumberOf1(self, n):
        if n >= 0:
            binnum = bin(n)
            return binnum.count("1")
        else:
            binnum = bin(abs(n) - 1)
            return 32 - binnum.count("1")

s = Solution()
print s.NumberOf1(-1)