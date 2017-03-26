# -*- coding:utf-8 -*-
class Solution:
    def LastRemaining_Solution(self, n, m):
		if n == 0:
			return -1
		temp = 0
		for i in xrange(n-1):
			temp = (temp + m) % (i + 2)
		return temp




s = Solution()
print s.LastRemaining_Solution(8, 3)
				