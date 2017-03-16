# -*- coding:utf-8 -*-
class Solution:
    @classmethod
    # 返回一个数字在数组中出现的次数
    def countOfNumber(self,e,tempList):
        i = 0
        for x in tempList:
            if x == e:
                i += 1
        return i
    def FindNumsAppearOnce(self, array):
        # 容纳字符出现次数的列表
        tempList = []
        for x in array:
            if Solution.countOfNumber(x, array) == 1:
                tempList.append(x)
        return tempList

  


s = Solution()
print s.FindNumsAppearOnce([2,3,1,2,5,0,5,3])
