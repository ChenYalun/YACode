# -*- coding:utf-8 -*-
class Solution:
    # 这里要特别注意~找到任意重复的一个值并赋值到duplication[0]
    # 函数返回True/False
    def duplicate(self, numbers, duplication):
        tempList = []
        for e in numbers:
            if e in tempList:
                duplication[0] = e
                return True
            else:
                tempList.append(e)
        return False
