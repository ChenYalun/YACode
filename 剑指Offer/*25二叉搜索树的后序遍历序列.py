# -*- coding:utf-8 -*-

'''
思路(根本依据):二叉搜索树中,某结点的左子树(若存在)小于该结点,该节点的右子树(若存在)大于该结点

递归实现

5 7 6 9 11 10 8
根结点 8
左 5 7 6
	
	根 6
	左 5
	右 7


右 9 11 10
	
	根 10
	左 9
	右 11

'''
class Solution:
    def VerifySquenceOfBST(self, sequence):
		# 容错处理
		if len(sequence) <= 0:
			return 
		# 序列长度
		length = len(sequence)
		# 根结点
		root = sequence[-1]
		s = 0
		# 左子树(最后一个元素不需要比较)
		for i in xrange(length - 1):
			if sequence[i] < root :
				s += 1
			else:
				break
		
		# 右子树
		for i in xrange(s, length):
			if sequence[i] < root :
				return False
		
		# 左子树是不是二叉搜索树
		left, right = True, True
		# 如果s 为1 说明不需要递归了,二叉搜索树左结点就只有1个
		if s > 1:
			left = self.VerifySquenceOfBST(sequence[:s])
		# 右子树是不是二叉搜索树
		if s < length - 1:
			right = self.VerifySquenceOfBST(sequence[s:-1])

		return left and right


s = Solution()
print s.VerifySquenceOfBST([5,7,6,9,11,10,8])