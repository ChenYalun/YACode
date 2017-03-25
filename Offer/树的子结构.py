# -*- coding:utf-8 -*-
from copy import *
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 根左右遍历,返回数据
    tempStr = ""
    def rootLeftRight(self, p):
        self.tempStr += str(p.val)
        if p.left:
            self.rootLeftRight(p.left)
        if p.right:
            self.rootLeftRight(p.right)
        
    def HasSubtree(self, pRoot1, pRoot2):
        if not pRoot2 or not pRoot1:
            return False
        # 获取pRoot1数据
        self.rootLeftRight(pRoot1)
        root1Str = deepcopy(self.tempStr)
        # 清空数据
        self.tempStr = ""
        # 获取pRoot2数据
        self.rootLeftRight(pRoot2)
        root2Str = deepcopy(self.tempStr)
        if root2Str in root1Str:
            return True
        else:
            return False
        


a = TreeNode(1)
b = TreeNode(2)
c = TreeNode(3)
d = TreeNode(4)
e = TreeNode(5)

a.left = b
a.right = c
b.left = d
b.right = e


x = TreeNode(2)
y = TreeNode(4)
z = TreeNode(5)
x.left = y
x.right = z

s = Solution()
print s.HasSubtree(a, x)
