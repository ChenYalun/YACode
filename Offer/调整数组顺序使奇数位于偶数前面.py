# -*- coding:utf-8 -*-
# 调整数组顺序使奇数位于偶数前面
class Solution:
    def reOrderArray(self, array):
    	# 奇数列表
        oddList = []
        # 偶数列表
        evenList = []
        for x in array:
        	if x % 2 == 0:
        		evenList.append(x)
        	else:
        		oddList.append(x)
        return oddList + evenList

s = Solution()
print s.reOrderArray([2,1,1,8,9,4,5,7])
