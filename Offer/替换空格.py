# -*- coding:utf-8 -*-
#替换空格
class Solution:
    # s 源字符串
    def replaceSpace(self, s):
        result = s.replace(" ", "%20")
        return result
