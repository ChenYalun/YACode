# -*- coding:utf-8 -*-
class Solution:
    def rectCover(self, number):
        if number <= 0:
            return 0
        if number == 1:
            return 1
        if number == 2:
            return 2
        s = 0
        a = 1
        b = 2
        i = 3
        while i <= number:
            s = a + b
            a = b
            b = s
            i += 1
        return s




s = Solution()
print s.rectCover(5)