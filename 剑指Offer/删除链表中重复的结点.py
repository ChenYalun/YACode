# -*- coding:utf-8 -*-
class ListNode:
    def __init__(self, x):
        self.val = x
        self.next = None
class Solution:
    # 查找某数在列表中出现的次数
    def countOfNum(self, e, tempList):
        i = 0
        for ele in tempList:
            if ele == e:
                i += 1
        return i
    def deleteDuplication(self, pHead):
        p1 = pHead
        p2 = pHead
        tempList = []
        while p1:
            tempList.append(p1.val)
            p1 = p1.next

        # 处理数组
        targetList = []
        for e in tempList:
            count = self.countOfNum(e, tempList)
            if count == 1:
                targetList.append(e)

        length = len(targetList)
        # 全部重复处理
        if length <= 0:
            return 
        for i in xrange(length):
            p2.val = targetList[i]
            # 最后一个
            if i == length - 1:
                p2.next = None
                break
            p2 = p2.next
        return pHead





s = Solution()
a = ListNode(2)
b = ListNode(2)
c = ListNode(3)
d = ListNode(3)
e = ListNode(4)
f = ListNode(4)
g = ListNode(2)
h = ListNode(2)
a.next = b
b.next = c
c.next = d
d.next = e
e.next = f
f.next = g
g.next = h

print s.deleteDuplication(a)
