# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 二叉树的镜像
    def mirror(self, mRoot, nRoot):
        if not mRoot and not nRoot:
            return True
        if mRoot and not nRoot:
            return False
        if not mRoot and nRoot:
            return False
        if mRoot.val != nRoot.val:
            return False
        else:
            return self.mirror(mRoot.left, nRoot.right) and self.mirror(nRoot.right, mRoot.left)


    def isSymmetrical(self, pRoot):
        if not pRoot:
            return True
        if self.mirror(pRoot.left, pRoot.right):
            return True