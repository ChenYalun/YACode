# -*- coding:utf-8 -*-
# 调整数组顺序使奇数位于偶数前面,并且奇数 偶数的相对位置不变
'''
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
'''

# 交换位置,调整数组顺序使奇数位于偶数前面,不要求奇数 偶数的相对位置不变
'''
思路:
定义n指针指向首元素,m指针指向末尾元素
n右移,一直到它指向偶数元素
m左移,一直到它指向奇数元素
此时,两者交换位置


'''
class Solution:
    def func(self, a):
        return a % 2 == 0
    def reOrderArray(self, array):
        n = 0
        m = len(array) - 1
        while n < m:
            # 一直到指向偶数
            while n < m and (not self.func(array[n])):
                n += 1
            # 一直到指向奇数
            while n < m and self.func(array[m]):
                m -= 1
            # 交换位置
            if n < m:
                array[n], array[m] = array[m], array[n]
        return array
s = Solution()
print s.reOrderArray([2,1,4,8,9,4,5,7])


'''
扩展:负数位于前面,正数位于后面
'''

def func2(a):
    return a > 0
def re(array):
    n = 0
    m = len(array) - 1
    while n < m:
        # 一直到指向偶数
        while n < m and (not func2(array[n])):
            n += 1
        # 一直到指向奇数
        while n < m and func2(array[m]):
            m -= 1
        # 交换位置
        if n < m:
            array[n], array[m] = array[m], array[n]
    return array

print re([2,1,-4,-8,9,-4,5,7])