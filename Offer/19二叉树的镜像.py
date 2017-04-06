# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 返回镜像树的根节点
    def Mirror(self, root):
        # 空树
        if not root:
            return None
        # 交换节点
        root.left, root.right = root.right,root.left
        # 递归
        self.Mirror(root.left)
        self.Mirror(root.right)
        