# -*- coding:utf-8 -*-
from copy import *
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
'''      
# 方法一:额外空间,等价于 求字符串包含子字符串  
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
'''
# 方法二:
class Solution:
    # 根左右遍历,返回数据
    def root1HasRoot2(self, pRoot1, pRoot2):
        # p2为空,说明比较完毕
        if not pRoot2:
            return True
        # p1为空 或者数据不一致
        if not pRoot1 or pRoot1.val != pRoot2.val:
            return False
        # p1的左与p2的左  p1的右与p2的右 
        return self.root1HasRoot2(pRoot1.left,pRoot2.left) and self.root1HasRoot2(pRoot1.right,pRoot2.right)
        
    def HasSubtree(self, pRoot1, pRoot2):
        # 都为空
        if  not pRoot2 or not pRoot1:
            return False
        # 递归判断pRoot1 与 pRoot2, pRoot1左结点 与 pRoot2, pRoot1右结点 与 pRoot2
        return self.root1HasRoot2(pRoot1, pRoot2) or self.HasSubtree(pRoot1.left, pRoot2) or self.HasSubtree(pRoot1.right, pRoot2)
                


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
