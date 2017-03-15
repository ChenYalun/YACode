# -*- coding:utf-8 -*-
# 2017.03.15
# 陈亚伦

#交换排序-快速排序
def quickSort(tempList):
	if len(tempList) <= 1:
		return tempList

	# 基准列表
	pivotList = []
	# 比基准小的列表
	lessList = []
	# 比基准大的列表
	moreList = []
	#将第一个值作为基准
	pivot = tempList[0]
	# 遍历tempList
	for x in tempList:
		# 比基准大,放入moreList
		if x > pivot:
			moreList.append(x)
		# 比基准小,放入lessList
		elif x < pivot:
			lessList.append(x)
		# 与基准相等,放入基准列表中
		else:
			pivotList.append(x)

	# 对lessList和moreList递归操作
	lessList = quickSort(lessList)
	moreList = quickSort(moreList)

	# 返回排序好的列表
	return lessList + pivotList + moreList

print quickSort([5,7,8,2,6,8,0,5])

def quickSort1(tempList):
    if len(tempList) <= 1:
        return tempList
    else:
        pivot = tempList[0]
        return quickSort1([x for x in tempList[1:] if x < pivot])\
         + [pivot] + \
         quickSort1([x for x in tempList[1:] if x >= pivot])



print quickSort1([5,7,8,2,6,8,0,5])

