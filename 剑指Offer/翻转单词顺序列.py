# -*- coding:utf-8 -*-
class Solution:
    def ReverseSentence(self, s):
        # 以空格为分隔符进行切片,返回列表
        tempList = s.split(" ")
        #result = tempList[::-1]
        # 或者使用逆制函数
        tempList.reverse()
        s = ""
        for x in tempList:
            s += x + " "
        return s[:-1]



s = Solution()
print s.ReverseSentence("I Love You")

