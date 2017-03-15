# -*- coding:utf-8 -*-
# 2017.03.15
# 陈亚伦

#计数排序
def countsort(tempList):
	if len(tempList) <= 1:
		return tempList
		
	maxValue = max(tempList)
	minValue = min(tempList)

	# 创建计数列表countList
	countList = [0] * (maxValue - minValue + 1)
	# 获取元素出现次数
	for e in tempList:
		countList[e - minValue] += 1
	index = 0
    # 填值
	for a in xrange(maxValue - minValue + 1):
		for c in xrange(countList[a]):
			tempList[index] = a + minValue
			index += 1
	return tempList
	
    
    

    
    
print countsort([1,6,3,2,3])