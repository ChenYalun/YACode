# -*- coding:utf-8 -*-
# 2017.03.15
# 陈亚伦

#交换排序-冒泡排序
def bubbleSort(tempList):
	n = len(tempList)
	for x in xrange(n):
		for y in xrange(1, n - x):# 索引n-x之后的数已经排序好了
			if tempList[y - 1] > tempList[y]:
				tempList[y], tempList[y - 1] = tempList[y - 1], tempList[y]
	return tempList

print bubbleSort([5,10,37,0,30])

#交换排序-冒泡排序优化1
def bubbleSort1(tempList):
	n = len(tempList)
	for x in xrange(n):
		#标志位,倘若没有交换,说明已经排序好了
		flag = True
		for y in xrange(1, n - x):# 索引n-x之后的数已经排序好了
			if tempList[y - 1] > tempList[y]:
				tempList[y], tempList[y - 1] = tempList[y - 1], tempList[y]
				flag = False
		if flag: # 发现并没有发生交换
			return tempList
	return tempList

print bubbleSort1([5,11,2,7,0,30])

#交换排序-冒泡排序优化2
def bubbleSort2(tempList):
	n = len(tempList)
	# 循环范围
	m = n
	for x in xrange(n):
		#标志位,倘若没有交换,说明已经排序好了
		flag = True
		for y in xrange(1, m):# 索引m之后的数已经排序好了
			if tempList[y - 1] > tempList[y]:
				tempList[y], tempList[y - 1] = tempList[y - 1], tempList[y]
				m = y
				flag = False
		if flag: # 发现并没有发生交换
			return tempList
	return tempList

print bubbleSort2([5,10,2,8,0,30])


