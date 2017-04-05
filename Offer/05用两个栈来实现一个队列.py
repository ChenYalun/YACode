# -*- coding:utf-8 -*-
class Solution:
    tempList1 = []
    tempList2 = []
    def push(self, node):
        self.tempList1.append(node)
    def pop(self):
        # 栈2为空
        if self.tempList2 == []:
            while self.tempList1:
                self.tempList2.append(self.tempList1.pop())
            return self.tempList2.pop()
        # 栈2不为空,直接弹出栈顶元素即可
        return self.tempList2.pop()

'''
思路:
1.push:直接在栈1中追加元素即可

2.pop:
如果栈2为空,把栈1中的元素从栈顶到栈尾删除并且逐个压入栈2中,弹出栈2中的栈顶元素
'''