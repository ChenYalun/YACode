# -*- coding:utf-8 -*-
class Solution:
    # 判断是否为"   -25  4"形式
    # 如果是,返回"-25  4",如果不是,返回0
    def space(self,s):
        length = len(s)
        if length <= 0 or s.isspace():
            return 0
        index = 0
        for i in xrange(length):
            if ord(s[i]) == 32:
                index += 1
            else:
                return s.replace(" ","",index)

    def StrToInt(self, s):
        newstr = self.space(s)
        # 是否为空
        if newstr == 0:
            return newstr
        # 目标数正负
        target = 1
        # 开始索引
        index = 0
        # 字符串长度
        length = len(newstr)
        # 首个字符
        first = newstr[0]
        # 首字符ASCII码
        firstASC = ord(first)
        # "-"开头
        if firstASC == 45:
            index = 1
            target = -1
        # "+"开头
        elif firstASC == 43:
            index = 1
        elif firstASC < 48 or firstASC > 57:#字母开头
            return 0
        # 最终数值s
        s = 0
        
        for i in xrange(index, length):
            asc = ord(newstr[i])
            if asc < 48 or asc > 57:
                return 0
            s = s + 10 ** (length - i - 1) * (asc - 48)
        return s * target
    

    


s =  Solution()
print s.StrToInt("")
print s.StrToInt("  ")
print s.StrToInt("-252")
print s.StrToInt("+252") 
print s.StrToInt("252") 
print s.StrToInt("2 52") 
print s.StrToInt("    -252")   
print s.StrToInt("    252")     




        