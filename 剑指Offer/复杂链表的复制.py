# -*- coding:utf-8 -*-
from copy import *
class RandomListNode:
    def __init__(self, x):
        self.label = x
        self.next = None
        self.random = None

# 方法一:使用系统库
# class Solution:
#     # 返回 RandomListNode
#     def Clone(self, pHead):
#         p = deepcopy(pHead)
#         return p

class Solution:
    # 返回 RandomListNode
    def Clone(self, pHead):
        # 容错处理
        if not pHead:
            return
        p = RandomListNode(pHead.label)
        # 记录首个结点
        node = p
        while pHead:
            # 复制操作
            if pHead.random:
                p.random = RandomListNode(pHead.random.label)
            if pHead.next:
                p.next = RandomListNode(pHead.next.label)
            pHead = pHead.next
            p = p.next

        return node




s = Solution()
a = RandomListNode(2)
b = RandomListNode(4)
c = RandomListNode(6)
d = RandomListNode(8)
e = RandomListNode(10)
a.next = b
b.next = c
c.next = d
d.next = e


s.Clone(a)