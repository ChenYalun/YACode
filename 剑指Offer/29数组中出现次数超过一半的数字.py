# -*- coding:utf-8 -*-
'''
class Solution:
    @classmethod
    def countOfNumber(self,e,tempList):
        i = 0
        for x in tempList:
            if x == e:
                i += 1
        return i
        
    def MoreThanHalfNum_Solution(self, numbers):
        length = len(numbers)
        for x in numbers:
            count = Solution.countOfNumber(x,numbers)
            if count > length * 0.5:
                return x
        return None

'''


'''
思路:

数组中有一个数字出现的次数超过数组长度的一半,也就是说它出现的次数比其他所有数字出现的次数和还要多

遍历一遍数组,保存两个值,一个是次数,一个是数字

如果次数为零,保存下一次遍历的数字
如果下一个数字和之前的数字相等,次数加1
如果下一个数字和之前的数字不等,次数减一


最后一次把次数设置为1的数字就是出现次数最多的

'''
# 方法二:
class Solution:
    # 核对数据检查次数是否超过一半
    def checkCountInArray(self,num,array):
        count = 0
        for e in array:
            if e == num:
                count += 1
        if count > len(array) * 0.5:
            return True
        else:
            return False
        
    def MoreThanHalfNum_Solution(self, numbers):
        # 容错
        if len(numbers) < 1:
            return 0
        count = 1
        number = numbers[0]
        for i in xrange(1, len(numbers)):
            if count == 0:
                count = 1
                number = numbers[i]
            elif numbers[i] == number:
                count += 1
            else:
                count -= 1
        # 检查
        return number if self.checkCountInArray(number,numbers) else 0
            

# print Solution.countOfNumber(4,[1,2,3,4,4,4,5])
s = Solution()
print s.MoreThanHalfNum_Solution([1,2,3,2,4,2,5,2,3])