# coding=utf-8  
# -*- coding:utf-8 -*-
'''
# 方法一:使用库函数
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
'''

'''
思路:
一个数据栈 一个辅助栈(存放最小元素)

如果数据栈的元素小于辅助栈的栈顶元素,则该元素进辅助栈和数据栈,否则只进数据栈


'''
# 方法二:添加辅助栈
class Solution:
	tempList = []
	minList = []
	def push(self, node):
		# 数据栈为空时,都入栈
		self.tempList.append(node)
		if self.minList == []:
			self.minList.append(node)
		# 新数据小于辅助栈中栈顶元素
		elif node < self.minList[-1]:
			self.minList.append(node)
	def pop(self):
		# 容错
		if len(self.tempList) < 1:
			return 
		# 弹出元素
		else:
			a = self.tempList.pop()
			b = self.minList.pop()
			# 两者不是相同元素,minList不出栈
			if a !=  b:
				self.minList.append(b)
	def top(self):
			return None if len(self.tempList) < 1 else self.tempList[-1]
	def min(self):
			return None if len(self.minList) < 1 else self.minList[-1]

        	
s = Solution()
print s.pop()     