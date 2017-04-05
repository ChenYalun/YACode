# -*- coding:utf-8 -*-
# 二维数组中的查找

# 方式一:一个一个查找
'''
class Solution:
    # array 二维列表
    def Find(self, target, array):
        for item in array:
            for e in item:
                if e == target:
                    return True
        return False
'''

# 方法二:

'''
矩阵是有序的，从左下角来看，向上数字递减，向右数字递增，
因此从左下角开始查找
当要查找数字比左下角数字大时 右移
要查找数字比左下角数字小时 上移
'''
class Solution:
    # array 二维列表
    def Find(self, target, array):
        # 容错
        if len(array) <= 1:
            return False
        # n行
        n = len(array)
        # m列
        m = len(array[0])
        # 左下角,第x行,第y列
        x = n - 1
        y = 0
        while x >= 0 and y <= n - 1:
            if array[x][y] > target:
                # 上移
                x -= 1
            elif array[x][y] < target:
                # 右移
                y += 1
            else:
                # 找到返回
                return True
        return False
                
            
        
s = Solution()
print s.Find(71,[[1,2,8,9], [2,4,9,12], [4,7,10,13], [6,8,11,15]])
print s.Find(71,[[1,2,8,9], [4,7,10,13]])