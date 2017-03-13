# -*- coding:utf-8 -*-
# 二维数组中的查找
class Solution:
    # array 二维列表
    def Find(self, target, array):
        for item in array:
            for e in item:
                if e == target:
                    return True
        return False