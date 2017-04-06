# -*- coding:utf-8 -*-
'''
class Solution:
    @classmethod
    # 根据任一数,返回1的个数
    def count(self,number):
        tempList = list(str(number))
        # 计数器
        i = 0
        for x in tempList:
             if x == "1":
                  i += 1
        return i

    # 区间1到n
    def NumberOf1Between1AndN_Solution(self, n):
        # 计数器
        i = 0
        for x in xrange(1,n + 1):
            i += Solution.count(x)
        return i
'''

class Solution:
    # 区间1到n
    def NumberOf1Between1AndN_Solution(self, n):
        # 计数器
        i = 0
        for x in xrange(1,n + 1):
            i += Solution.count(x)
        return i
s = Solution()
print s.NumberOf1Between1AndN_Solution(13)