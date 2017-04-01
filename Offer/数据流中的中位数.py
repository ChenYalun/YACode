# -*- coding:utf-8 -*-
class Solution:
    tempList = []
    def Insert(self, num):
        self.tempList.append(num)
    def GetMedian(self,n):
        self.tempList.sort()
        l = len(self.tempList)
        if l % 2 == 0:
            return (self.tempList[l / 2 - 1] + self.tempList[l / 2]) / 2.0
        return self.tempList[l / 2]

s = Solution()
s.Insert(10)   
s.Insert(11)  
s.Insert(12)  
s.Insert(13) 


print s.GetMedian()        