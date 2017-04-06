# coding=utf-8  
# -*- coding:utf-8 -*-

class Solution:
    def IsPopOrder(self, pushV, popV):
        # 容错处理:为空或者两者不相等
		if not pushV  or len(popV) != len(pushV):
			return
		tempList = []
		for e in pushV:
			# 进栈
			tempList.append(e)
			# 当tempList不为空且 两元素相等 出栈
			while len(tempList) and tempList[-1] == popV[0]:
				popV.pop(0)
				tempList.pop()
		# 还剩下元素,说明不符合出规则
		if len(tempList):
			return False
		else:
			return True

        	
s = Solution()
print s.IsPopOrder([1,2,3,4,5], [4,5,3,2,1])     