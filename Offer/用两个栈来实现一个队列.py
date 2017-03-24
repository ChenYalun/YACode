# -*- coding:utf-8 -*-
class Solution:
    tempList = []
    def push(self, node):
        self.tempList.append(node)
    def pop(self):
        if len(self.tempList) > 0:
            a = self.tempList[0]
            self.tempList.remove(a)
            return a
        else:
            return None
