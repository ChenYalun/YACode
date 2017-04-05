# -*- coding:utf-8 -*-
class Solution:
    def FindNumbersWithSum(self, array, tsum):
        # 过滤
        if len(array) <= 0:
            return []
        # 满足条件的字典
        numDict = {}
        # 遍历列表
        minNum, maxNum = min(array) - 1, max(array) + 1
        for e in array:
            a = tsum - e
            if a in array:
                minNum = min(a, e)
                maxNum = max(a, e)
                numDict[minNum * maxNum] = maxNum
        
        # 最大值
        if len(numDict.keys())> 0:
            maxKey = min(numDict.keys())
            # 对应的value
            maxValue = numDict[maxKey]
            return tsum - maxValue, maxValue
        else:
            return []

                
        
s = Solution()
print s.FindNumbersWithSum([],8)