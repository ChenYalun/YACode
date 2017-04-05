# -*- coding:utf-8 -*-
#替换空格
'''
# 方法一:库函数
class Solution:
    # s 源字符串
    def replaceSpace(self, s):
        result = s.replace(" ", "%20")
        return result
'''

# 方法二
# 思路
'''
1.首先遍历字符串s1,获取其中空格的数量,并开辟刚刚好的空间s2,容纳新字符串

2.a指针指向s1的末尾,b指针指向s2的末尾,a指针向前移动复制字符,b指针也向前移动,填充相应位置的字符

3.a指针遇到空格时,b指针向前移动3格,插入替换的字符'%20',a指针继续移动

'''

class Solution:
    # s 源字符串
    def replaceSpace(self, s):
        # 获取源字符数量
        count = s.count(" ")
        # 新建目标字符串
        target = []
        # 遍历字符串
        for x in s[::-1]:
            # 替换空格
            if x == ' ':
                x = "%20"
            # 拼接新字符串
            target.insert(0, x)
        return "".join(target)


s = Solution()
print s.replaceSpace("We Are Happy")      
            