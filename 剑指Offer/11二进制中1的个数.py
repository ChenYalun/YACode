# -*- coding:utf-8 -*-

#方法一:
class Solution:
    def NumberOf1(self, n):
        # 为了避免死循环,直接设置位数为32
        return sum([(n>>i & 1) for i in range(0,32)])


# 方法二C语言:
'''
#include<stdio.h>
int a(int n) {
    int s = 0;
    while (n) {
        s ++;
        n = (n - 1) & n;
    }
    return s;
}

int main () {
printf("%d",a(-123));
}

'''

'''
补充:
1.位运算共5种,与& 或| 异或^  左移<< 右移 >>
位移运算优先级次于加减乘除,高于与或异或

2.做位运算的时候,会自动转化为二进制运算

3.左移运算时,如果是正数,前面补0 如果是负数,前面补1

思路:
1.判断整数最后一位是否为1,判断方法:与1做位与运算
2.从尾到头对数据移位

注意:当数为负数时,陷入死循环

正确解法:
1.判断整数最后一位是否为1,判断方法:与1做位与运算
2.不对原数据进行移位操作,而是对判断数据移位:
  判断数据的最低位是不是1
  把1左移1位,判断数据的次低位是不是1
  把1左移2位,判断数据的倒数第3位是不是1
  ....BaseException以此类推

方法三C语言:
        # 1的个数
        s = 0
        # 左移的数
        unsigned int flag = 1
        while (flag) {
            if n & flag:
                s += 1
            flag = flag << 1
        }
        return s




更好的解法:
依据:把一个整数减去1,再和原整数做与运算,会把该整数最右边的一个1变为0
'''   
s = Solution()
print s.NumberOf1(-2)