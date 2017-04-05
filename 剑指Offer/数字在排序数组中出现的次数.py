# -*- coding:utf-8 -*-
class Solution:
    def GetNumberOfK(self, data, k):
        n = len(data)
        s = 0
        for x in xrange(0,n):
            if k == data[x]:
                s += 1
        return s

s = Solution()
print s.GetNumberOfK([1,2,3,4,5,6,7,8,9,0,3,4],3)        