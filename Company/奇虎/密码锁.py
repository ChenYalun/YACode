# -*- coding:utf-8 -*-
#获取从1到n符合要求的列表
def isCenter():
    # 临时列表
    tempList = []
    # 计数器
    for i in xrange(3):
        number = raw_input()
        for e in list(number):
            if e == "X":
                tempList.append(True)
            else:
                tempList.append(False)
    for x in xrange(4):
        if tempList[x] != tempList[8 - x]:
            print "NO"
            return 
    print "YES"
    return 
            
    
while True:
    isCenter()

'''
    
题目描述
									

作为一名新手特工，小B接受了大量的秘密间谍训练。
检验她学业成就的时刻到了，她被派到一个基地去执行一项秘密任务，窃取该基地中一个尖端工艺的设计流程。
经过一系列惊险的过程，小B已经成功的抵达了目标区域。
遗憾的是，目标区域高墙围挡，墙上还有电网和红外安保机制，她发现只能通过大门进入。
好在她已经成功的接近了大门，成功正在向她招手。大门是无人值守的，由电子密码组合锁控制。
几分钟前，她发现一名工作人员在终端上输入过密码，并打开了门进入其中。
电子密码锁是一个方形的3x3数字键盘，上面有从1到9的数字按键。
小B推测密码是由不同的字符构成，且是沿按键中心对称的。
她的热传感器能够探测上次按键的余温。
她希望验证一下密码是否是沿按键中心对称，这样就可以极大的减少她尝试的次数，你能帮她吗？
'''