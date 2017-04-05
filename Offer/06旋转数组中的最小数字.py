# -*- coding:utf-8 -*-
#旋转数组中的最小数字

'''
三种情况:
1.数组为空

2.部分旋转，例如由（1,2,3,4,5）旋转为（3,4,5,1,2）
此时只需要遍历数组，找到当前数比前面的数小的数即可

3.完全旋转，例如由（1,2,3,4,5）旋转为（1,2,3,4,5），此时第一个数最小。

'''
class Solution:
    def minNumberInRotateArray(self, rotateArray):
		# 数组为空
		if len(rotateArray) == 0:
			return 0
        # 部分旋转,遍历
		length = len(rotateArray) - 1
		for i in xrange(length):
			if rotateArray[i] > rotateArray[i + 1]:
				return rotateArray[i + 1]
		# 完全旋转
		return rotateArray[0]

s = Solution()
print s.minNumberInRotateArray([])