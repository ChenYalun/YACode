# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None

# 方法一:逆制链表
class Solution:
    # 返回ListNode
    def ReverseList(self, pHead):
        lastNode = None
        while pHead:
            # 第三个结点
            tempNode = pHead.next
            # 指针改变
            pHead.next = lastNode
            lastNode = pHead
            pHead = tempNode
        return lastNode


# 方法二:逆制数据
class Solution:
    # 返回ListNode
    def ReverseList(self, pHead):
        tempList = []
        p = pHead
        while p:
            tempList.insert(0, p.val)
            p = p.next
        
        # 数据逆制
        i = 0
        p2 = pHead
        while p2:
            p2.val = tempList[i]
            i += 1
            p2 = p2.next
        return pHead


        

        

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
print s.ReverseList(a)
        
