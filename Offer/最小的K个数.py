# -*- coding:utf-8 -*-
class Solution:
    @classmethod
    def quickSort(self,tempList):
        if len(tempList) <= 1:
            return tempList
        else:
            pivot = tempList[0]
            return Solution.quickSort([x for x in tempList[1:] if x < pivot] ) + \
            [pivot] + \
            Solution.quickSort([x for x in tempList[1:] if x >= pivot])
    def GetLeastNumbers_Solution(self, tinput, k):
        # 容错处理
        if len(tinput) < k:
            return []
        sortList = Solution.quickSort(tinput)
        result = []
        for x in xrange(k):
            result.append(sortList[x])
        return result

s = Solution()
print s.GetLeastNumbers_Solution([4,5,1,6,2,7,3,3,8],50)