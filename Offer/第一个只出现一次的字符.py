# -*- coding:utf-8 -*-
class Solution:
    @classmethod
    # 返回一个字符在字符串中出现的次数
    def countOfChar(self,c,string):
        tempList = list(string)
        i = 0
        for x in tempList:
            if x == c:
                i += 1
        return i
    def FirstNotRepeatingChar(self, s):
        # 容纳字符出现次数的列表
        tempList = []
        for x in s:
            tempList.append(Solution.countOfChar(x, s))
        for index in xrange(len(tempList)):
            if tempList[index] == 1:
                return index
        return -1

print Solution.countOfChar("B", "AABBCACDS")    
print Solution.countOfChar("A", "AABBCACDS")     


s = Solution()
print s.FirstNotRepeatingChar("ABBBABBBC")
print s.FirstNotRepeatingChar("")