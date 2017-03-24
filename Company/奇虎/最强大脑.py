# -*- coding:utf-8 -*-
#获取从1到n符合要求的列表
def isCenter():
    # 颜色
    colorString = raw_input()
    # 第一次
    firstString = raw_input()
    # 第二次
    secondString = raw_input()
    # flag
    forward, backward = False, False
    # 逆制颜色
    reversedColorString = colorString[::-1]
    # 正向查找
    forwardIndex = colorString.find(firstString)
    if forwardIndex != -1:
        index = colorString.find(secondString,forwardIndex + len(firstString))
        if index != -1:
            forward = True
        
    backwardIndex = reversedColorString.find(firstString)
    if backwardIndex != -1:
        index = reversedColorString.find(secondString,backwardIndex + len(firstString))
        if index != -1:
            backward = True
    
    if forward and backward:
        print "both"
    elif forward:
        print "forward"
    elif backward:
        print "backward"
    else:
        print "invalid"

        
    
while True:
    isCenter()

'''
    
题目描述
									
小B乘火车和朋友们一起在N市到M市之间旅行。
她在路途中时睡时醒。当她醒来观看窗外的风景时，注意到每个火车站都有一种特别颜色的旗帜，
但是她看到的旗帜仅仅是经过的一小部分。
小B在乘车过程中有两次清醒的时间，她到达旅程终点时处于睡梦中。
出站时，她和朋友们谈论着一路的见闻，朋友们觉得很有意思。
他们把N到和M之间经过车站的旗帜颜色依次列出来，然后告诉你小B记得的旗帜颜色序列，
让你判断小B究竟是从N和M之间哪些方向才能看到所说颜色的旗帜，还是根本就不可能看到？
颜色用字母代表，相同的字母代表相同的颜色，不同的字母则表示不同的颜色。
'''
