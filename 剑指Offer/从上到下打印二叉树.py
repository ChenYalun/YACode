# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None
class Solution:
    # 返回从上到下每个节点值列表，例：[1,2,3]
    def PrintFromTopToBottom(self, root):
        # 空树
        if not root:
            return []
        # 数值/节点列表
        dataList,nodeList = [], [root]
        while len(nodeList):
            # 删除第一个节点并添加其值
            rootNode = nodeList.pop(0)
            dataList.append(rootNode.val)
            if rootNode.left:
                nodeList.append(rootNode.left)
            if rootNode.right:
                nodeList.append(rootNode.right)
        return dataList

