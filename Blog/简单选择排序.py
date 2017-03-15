# -*- coding:utf-8 -*-
# 2017.03.15
# 陈亚伦

#选择排序-简单选择排序
def selectionSort(tempList):
	n = len(tempList)
	if n <= 1:
		return tempList
	for x in xrange(0,n):
		# 假定索引x对应的是最小值
		index = x
		for y in xrange(x + 1,n):
			# 如果找到比索引index对应的值还要小的值,交换两者位置
			if tempList[index] > tempList[y]:
				tempList[index], tempList[y] = tempList[y], tempList[index]
	return tempList



print selectionSort([])
print selectionSort([5,10,2,7,0,30])

