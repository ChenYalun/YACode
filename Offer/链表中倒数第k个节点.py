# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

class Solution:
    def FindKthToTail(self, head, k):
        tempList = []
        while head:
            tempList.append(head)
            head = head.next
        # 进行容错处理
        if k <=0 or k > len(tempList):
            return 
        return tempList[-k]

a = ListNode(1)
b = ListNode(2)
c = ListNode(3)
d = ListNode(4)
e = ListNode(5)    
a.next = b
b.next = c
c.next = d
d.next = e
s = Solution()
print s.FindKthToTail(a,2)
        
