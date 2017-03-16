# -*- coding:utf-8 -*-
class Solution:
	tempList = []
	def push(self, node):
		self.tempList.append(node)
	def pop(self):
		if len(self.tempList) < 1:
			return 
		else:
			self.tempList.pop()
	def top(self):
		if len(self.tempList) < 1:
			return None
		else:
			return self.tempList[-1]
	def min(self):
		return min(self.tempList)

        	
s = Solution()
print s.pop()
