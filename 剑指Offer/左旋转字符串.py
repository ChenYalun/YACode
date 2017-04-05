# -*- coding:utf-8 -*-
class Solution:
    def LeftRotateString(self, s, n):
        left = s[:n]
        right = s[n:]
        return right + left



s = Solution()
print s.LeftRotateString("ABC1234", 2)