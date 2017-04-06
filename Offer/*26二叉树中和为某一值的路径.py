# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None


'''
思路:
根据路径定义:根结点一定包含在路径中
前序遍历链表:根左右
递归遍历:
如果左结点的值等于 expectNumber - 根结点的值,则找到
如果右结点的值等于 expectNumber - 根结点的值,则找到

临时列表append把符合要求的列表
'''
class Solution:
    # 返回二维列表，内部每个列表表示找到的路径
    def FindPath(self, root, expectNumber):
        # 空结点处理
		if not root:
			return []
		# 符合要求的结点(该结点不为空,左右为空,且数据符合要求)
		# 仅有一个结点的情况
		if root and not root.left and not root.right and root.val == expectNumber:
			return [[root.val]]
		# 临时列表
		tempList = []
		# 递归遍历
		left = self.FindPath(root.left, expectNumber - root.val)
		right = self.FindPath(root.right, expectNumber - root.val)
		# 数组拼接left + right 
		# 把符合要求的数组元素,拼接输出
		for e in left + right:
			tempList.append([root.val] + e)
		return tempList


s = Solution()

a = TreeNode(10)
b = TreeNode(5)
c = TreeNode(12)
d = TreeNode(4)
e = TreeNode(7)

a.left = b
a.right = c
b.left = d
b.right = e

print s.FindPath(a, 22)