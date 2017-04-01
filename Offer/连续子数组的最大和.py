# -*- coding:utf-8 -*-
class Solution:
    def FindGreatestSumOfSubArray(self, array):
		s = 0
		target = 0
		for e in array:
			s += e
			if s < 0:
				s = 0
			if target < s:
				target = s
		if target == 0:
			target = max(array)
		return target

s = Solution()
print s.FindGreatestSumOfSubArray([1,-2,3,10,-4,7,2,-5])