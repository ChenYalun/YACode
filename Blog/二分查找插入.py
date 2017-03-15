# -*- coding:utf-8 -*-
# 2017.03.15
# 陈亚伦

import bisect 
#插入排序-二分查找插入(模块实现)
# bisect模块实现了一个算法, 用于向一个有序列表中插入一个元素,不改变列表的序列
# 使用这个模块的函数前先确保操作的列表是已排序的


def insertionSortBisect(tempList):  
    for i in xrange(1, len(tempList)):  
        bisect.insort(tempList, tempList.pop(i), 0, i) # 排序列表,移除并插入元素,区间开始,区间结束
    return tempList

print insertionSortBisect([])
print insertionSortBisect([8])
print insertionSortBisect([5,2,7,0,1,5,9])



#插入排序-二分查找插入(自实现)
#二分查找的前提必须待查找的序列有序
# 在有序列表中,返回值m应该所在的索引
def indexOfInsertionSort(tempList, m):
	# 获取列表的长度
	n = len(tempList)
	left, right = 0, n - 1
	while left <= right:
		middle = (left + right) / 2
		if tempList[middle] < m:# 右半部分
			left = middle + 1
		else: #左半部分,含相同元素
			right = middle -1
	return right +1
		
def insertionSortbin(tempList):
	# 获取列表的长度
	n = len(tempList)
	if n <= 1:
		return tempList
	for x in xrange(0,n): # 从头至尾遍历列表中的元素
		m = tempList[x]
		tempList.pop(x)
		index = indexOfInsertionSort(tempList[0:x],m)
		tempList.insert(index , m) #第一个参数是索引,第二个参数是数值
	return tempList
				

print insertionSortbin([])
print insertionSortbin([8])
print insertionSortbin([12,12,16,8,5,10,7])

