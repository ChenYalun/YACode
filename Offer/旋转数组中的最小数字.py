# -*- coding:utf-8 -*-
#旋转数组中的最小数字
class Solution:
    def minNumberInRotateArray(self, rotateArray):
    	if not rotateArray:
    		return 0
        else:
        	return min(rotateArray)

s = Solution()
print s.minNumberInRotateArray([22,8])