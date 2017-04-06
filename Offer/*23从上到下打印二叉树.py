# -*- coding:utf-8 -*-
class TreeNode:
    def __init__(self, x):
        self.val = x
        self.left = None
        self.right = None

'''
要点:
使用队列(dataList)

每次打印一个结点的时候,如果该结点有子结点,则把该结点的子结点放到一个队列的末尾,
接下来到队列的头部取出最早进入队列的结点,重复操作,
直到队列中的所有结点都被打印出来




'''        
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

