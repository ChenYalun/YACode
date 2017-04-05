# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
class Solution:
    tempList = []
    def FindFirstCommonNode(self, pHead1, pHead2):
        while pHead1:
            self.tempList.append(pHead1)
            pHead1 = pHead1.next
        while pHead2:
            if pHead2 in self.tempList:
                return pHead2
            pHead2 = pHead2.next