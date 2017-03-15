# -*- coding:utf-8 -*-
# 2017.03.15
# 陈亚伦

#归并排序
def mergeSort(tempList):
	length = len(tempList)
	if length <= 1:
		return tempList
	# 二分列表
	middle = length / 2
	leftList = mergeSort(tempList[:middle])
	rightList = mergeSort(tempList[middle:])

	return merge(leftList,rightList)

def merge(leftList,rightList):
	leftIndex,rightIndex = 0, 0
	result = []
	while leftIndex < len(leftList) and rightIndex < len(rightList):
		if leftList[leftIndex] < rightList[rightIndex]:
			result.append(leftList[leftIndex])
			leftIndex += 1
		else:
			result.append(rightList[rightIndex])
			rightIndex += 1

	result += leftList[leftIndex:]
	result += rightList[rightIndex:]
	return result


print mergeSort([2,5,1,2,0,6,3])
