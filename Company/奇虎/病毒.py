# -*- coding:utf-8 -*-
#获取从1到n符合要求的列表

def getList(c):
    if c == 1:
        return [1]
    else:
        a = []
        a.append(10 ** (c - 1))
        while c != 1:
            for e in getList(c -1):
                m = c
                a.append(10 ** (c - 1) + e)
            c -= 1
            a.append(10 ** (c - 1))
        
        return sorted(a)

def count(number):
    n = int(number)
    length = len(number)
    array = getList(length)
    b = []
    for e in array:
        if e <= n:
            b.append(e)
    s = 0

    return len(b)

while True:
    number = raw_input()
    print count(number)

'''
    
题目描述
									

小B最近对破解和程序攻击产生了兴趣，她迷上了病毒，然后可怕的事情就发生了。
不知道什么原因，可能是小B的技术水平还不够高，小B编写的病毒程序在攻击一个服务器时出现了问题。
尽管成功的侵入了服务器，但并没有按照期望的方式发挥作用。
小B的目的很简单:控制服务器的内存区域，试图在内存中装入从1到n之间的n个自然数，以覆盖内存区域。
可能是小B对编程理解上的问题，病毒似乎没有完全成功。
可能是由于保护机制的原因，内存写入只接受二进制的形式，所以十进制表达中除0和1之外的其他值都没有成功写入内存。
小B希望知道，究竟有多少数成功的写入了服务器的内存！
'''