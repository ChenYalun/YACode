# -*- coding:utf-8 -*-
class Solution:
    @classmethod
    def countOfNumber(self,e,tempList):
        i = 0
        for x in tempList:
            if x == e:
                i += 1
        return i
        
    def MoreThanHalfNum_Solution(self, numbers):
        length = len(numbers)
        for x in numbers:
            count = Solution.countOfNumber(x,numbers)
            if count > length * 0.5:
                return x
        return None

# print Solution.countOfNumber(4,[1,2,3,4,4,4,5])
s = Solution()
print s.MoreThanHalfNum_Solution([1,2,3,2,2,2,5,4,2])