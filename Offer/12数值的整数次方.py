# -*- coding:utf-8 -*-
#数值的整数次方
'''
class Solution:
    def Power(self, base, exponent):
        return base ** (exponent)
'''

'''
方法一:for循环逐个连乘


方法二:判断exponent,递归
exponent是偶数  拆分:exponent / 2   exponent / 2
exponent 是奇数 拆分:(exponent + 1) / 2   (exponent - 1) / 2

'''
class Solution:
    def Power(self, base, exponent):
        # 为0
        if exponent == 0:
            return 1
        # 为1
        if exponent == 1:
            return base 
        # 负数
        flag = 1
        if exponent < 0:
            flag = -1
            exponent = -exponent
        # 结果
        s = 0
        # 奇数
        if exponent % 2 != 0:
            a = (exponent + 1) / 2
            b = exponent - a
            s = self.Power(base, a) * self.Power(base, b)    
        else:
            a = (exponent) / 2
            s = self.Power(base, a) * self.Power(base, a)
        # python 中的三元运算符
        return s if (flag > 0) else (1.0 / s)



s = Solution()
print s.Power(-2.5,-1)

