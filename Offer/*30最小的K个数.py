# -*- coding:utf-8 -*-
'''
# 方法一:快排
class Solution:
    @classmethod
    def quickSort(self,tempList):
        if len(tempList) <= 1:
            return tempList
        else:
            pivot = tempList[0]
            return Solution.quickSort([x for x in tempList[1:] if x < pivot] ) + \
            [pivot] + \
            Solution.quickSort([x for x in tempList[1:] if x >= pivot])
    def GetLeastNumbers_Solution(self, tinput, k):
        # 容错处理
        if len(tinput) < k:
            return []
        sortList = Solution.quickSort(tinput)
        result = []
        for x in xrange(k):
            result.append(sortList[x])
        return result
'''

'''
思路:
时间复杂度 O(nlogK),适合处理海量数据
取出数组前k个数据放在容器中,遍历数据,(n)
1.如果数字大于容器中最大数据,略过(寻找操作)
2.如果数字小于容器中最大数据,替换(插入操作和删除操作)  O(logK)

容器可使用:红黑树/最大堆实现

'''
class Solution:
    def GetLeastNumbers_Solution(self, tinput, k):
        # 容错处理
        if len(tinput) < k or k == 0:
            return []
        # 容器
        tempList = []
        # 添加元素
        for i in xrange(k):
            tempList.append(tinput[i])
        # 数据操作
        for i in xrange(k,len(tinput)):
            # 小于容器中最大值
            if tinput[i] < max(tempList):
                tempList.remove(max(tempList))
                tempList.append(tinput[i])
        return sorted(tempList)

s = Solution()
print s.GetLeastNumbers_Solution([4,5,1,6,2,7,3,3,8],5)