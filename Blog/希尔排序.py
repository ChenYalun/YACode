# -*- coding:utf-8 -*-
# 2017.03.15
# 陈亚伦

#插入排序-希尔排序(我觉得叫分组排序更直观)
def insertionSortShell(tempList):
	n = len(tempList)
	if n <= 1:
		return tempList
	
	# 确定分组,假定n = 6
	group = n / 2 # 此时group = 3,分成3组,3组元素索引分别为3与3-3,4与4-3,5与5-3
	while group > 0:
		#x从3到5
		for x in xrange(group,n):
			# 每组元素:x,x-group,x-group-group ......插入排序
			temp = tempList[x]
			y = x
			# 这里使用简单的插入排序
			while y >= group and tempList[y - group] > temp:
				tempList[y] = tempList[y - group]
				y -= group
			tempList[y] = temp

		group /= 2
	return tempList

#插入排序-希尔排序(互换法)
def insertionSortShellExchange(tempList):
	n = len(tempList)
	if n <= 1:
		return tempList
	# 确定分组,假定n = 6
	group = n / 2 # 此时group = 3,分成3组,3组元素索引分别为3与3-3,4与4-3,5与5-3
	while group > 0:
		#x从3到5
		for x in xrange(group,n):
			# 每组元素:x,x-group,x-group-group ......插入排序
			y = x
			m = tempList[x]
			while y >= group and tempList[y - group] > m:
				# 这里直接交换位置
				tempList[y], tempList[y - group] = tempList[y - group], tempList[y]
				y -= group

		group /= 2
	return tempList

print insertionSortShell([])
print insertionSortShellExchange([])
print insertionSortShell([1,8,10,2,4,0])
print insertionSortShellExchange([1,8,10,2,4,0])
