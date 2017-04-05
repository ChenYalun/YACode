# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
'''
# 方法一:开辟额外空间,遍历一次链表

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
'''

'''
方式二:使用指针,遍历一次链表
n指针指向链表的第k个结点
m指针指向链表的第1个结点
两个指针同时移动,直到n指针指向最后一个结点,此时
m指针指向的就是倒数第k个结点

'''
class Solution:
    def FindKthToTail(self, head, k):
        # 进行容错处理
        if k <= 0 or not head:
            return 
        # 使n指向第k个结点
        n = head
        while k > 1:
            # 进行容错处理
            if n.next:
                n = n.next
            else:
                return 
            k -= 1

        # n,m两者一起移动
        m = head
        while n.next:
            n = n.next
            m = m.next
        return m

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
print s.FindKthToTail(a,1)
        
'''
扩展1:
求链表的中间结点:当结点总数为奇数时,返回中间结点,当结点总数为偶数时,返回中间两个的任何一个

解决思路:
p指针,m指针都指向首结点
p指针每次移动1步
m指针每次移动两步

当m指针走到头,或者m指针要走的下步为空时
p指针指向的就是中间结点


扩展2:
判断一个单项链表是否构成环形结构

解决思路:
p指针,m指针都指向首结点
p指针每次移动1步
m指针每次移动两步


当m指针追上了p指针(两指针指向元素相同),那么就是环形链表
如果m指针走到链表尾部都没有追上第一个指针,那么就不是环形链表

'''