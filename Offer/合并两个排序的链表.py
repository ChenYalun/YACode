# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
class Solution:
    # 返回合并后列表
    def Merge(self, pHead1, pHead2):
        # 容错
        if not pHead1 and not pHead2:
            return
        tempList = []
        p = pHead1
        p1 = pHead1
        p2 = pHead2
        # 遍历链表1
        while p1:
            tempList.append(p1.val)
            if not p1.next:
                break
            p1 = p1.next
        # 遍历链表2
        while p2:
            tempList.append(p2.val)
            p2 = p2.next
        # p1指向链表1的最后一个结点,p1的下一个结点为pHead2
        p1.next = pHead2
        # 遍历链表3
        resultList = sorted(tempList)
        i = 0
        while p:
            p.val = resultList[i]
            i += 1
            p = p.next
        return pHead1

s = Solution()

a = ListNode(1)  
b = ListNode(3) 
c = ListNode(5) 
d = ListNode(7) 
e = ListNode(9) 
a.next = b
b.next = c
c.next = d
d.next = e

f = ListNode(2) 
g = ListNode(4)   
h = ListNode(5) 
i = ListNode(6) 
j = ListNode(8) 
k = ListNode(10) 
f.next = g
g.next = h
h.next = i
i.next = j
j.next = k


# s.Merge(a, f)
s.Merge(None, None)