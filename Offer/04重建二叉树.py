# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 返回构造的TreeNode根节点
    def reConstructBinaryTree(self, pre, tin):
        # 空节点
        if len(pre) == 0:
            return None
        # 根节点
        rootNode = TreeNode(pre[0])
        # 根节点pre[0]在中序遍历中的索引
        index = tin.index(pre[0])
        # 递归
        rootNode.left = self.reConstructBinaryTree(pre[1 : index + 1], tin[:index])
        rootNode.right = self.reConstructBinaryTree(pre[index + 1:], tin[index + 1:])
        return rootNode