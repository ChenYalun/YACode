# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    def TreeDepth(self, pRoot):
        if not pRoot:
            return 0
        return max(Solution.TreeDepth(self,pRoot.left), Solution.TreeDepth(self,pRoot.right)) + 1



