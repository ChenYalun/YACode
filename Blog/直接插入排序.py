# -*- coding:utf-8 -*-
# 2017.03.15
# 陈亚伦


#插入排序-直接插入
def insertionSort(tempList):
	# 获取列表的长度
	n = len(tempList)
	# 判断列表的长度
	if n <= 1:
		return tempList
	for x in xrange(1,n): # 从头至尾遍历列表中的元素
		for y in xrange(x, 0, -1): # 在已经排好序的列表中逐个扫描
			if tempList[y] < tempList[y - 1]: # 如果当前元素比前面的小
				tempList[y], tempList[y - 1] = tempList[y - 1], tempList[y] # 两者位置互换
	return tempList

print insertionSort([])
print insertionSort([8])
print insertionSort([5,2,7,0,1,5,9])
