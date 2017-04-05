# -*- coding:utf-8 -*-
# 从尾到头打印链表
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    # 返回从尾部到头部的列表值序列，例如[1,2,3]
    def printListFromTailToHead(self, listNode):
        valList = []
        while listNode != None:
            valList.insert(0, listNode.val)
            listNode = listNode.next
        return valList

'''
方法一:遍历链表,每次都将数据插入到数组头部,返回数组

方法二:逆置链表

方法三:遍历链表,递归输出该节点后面的节点,再输出该节点(剑指offer做法)


'''
a = ListNode(10)
b = ListNode(12)
c = ListNode(14)
d = ListNode(16)
a.next = b
b.next = c
c.next = d
s = Solution()
print s.printListFromTailToHead(a)