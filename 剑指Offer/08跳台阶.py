# -*- coding:utf-8 -*-
# 跳台阶
class Solution:
    def jumpFloor(self, number):
        if number < 1:
            return
        if number == 1:
            return 1
        if number == 2:
            return 2
        a,b,s,i = 1,2,0,2
        while i < number:
            s = a + b
            a = b
            b = s
            i += 1
        return s

s = Solution()
print s.jumpFloor(1)
print s.jumpFloor(2)
print s.jumpFloor(5)
print s.jumpFloor(8)

'''
本质上还是斐波那契数列的变形
1 2 3 5 8 13 24 34


'''