# coding=utf-8  
# -*- coding:utf-8 -*-
'''
思路:
取出左上角坐标和右下角坐标定位一次要打印的数据

一次旋转打印后,往对角线分别前进和后退一个单位

注意单行或单列情况


'''
class Solution:
    # matrix类型为二维列表，需要返回列表
    def printMatrix(self, matrix):
        # 取出行数/列数
        row = len(matrix)
        col = len(matrix[0])

        # 容错处理
        if row ==  0 or col == 0:
            return
        # 定义坐标
        left,top,right,bottom = 0, 0, col - 1, row - 1
        # 临时列表
        tempList = []
        # 循环开始
        while left <= right and top <= bottom:
            # 左向右移动
            for i in xrange(left, right + 1):
                tempList.append(matrix[top][i])
            # 上向下移动
            for i in xrange(top + 1, bottom + 1):
                tempList.append(matrix[i][right])
            # 右向左移动
            if top != bottom: # 单行数据
                for i in xrange(right - 1, left - 1, -1):
                    tempList.append(matrix[bottom][i])
            # 下向上移动
            if left != right: # 单列数据
                for i in xrange(bottom - 1, top, -1):
                    tempList.append(matrix[i][left])
            
            # 一次旋转打印结束
            left += 1
            top += 1
            right -= 1
            bottom -= 1
        return tempList
        



s = Solution()
a = [[1,2,3,4],[11,12,13,14],[21,22,23,24],[31,32,33,34]]
print s.printMatrix(a)        