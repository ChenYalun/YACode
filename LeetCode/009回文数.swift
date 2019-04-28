//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

示例 1:

输入: 121
输出: true
示例 2:

输入: -121
输出: false
解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
示例 3:

输入: 10
输出: false
解释: 从右向左读, 为 01 。因此它不是一个回文数。
进阶:你能不将整数转为字符串来解决这个问题吗？
*/
/*
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        let dataStr = String(x).reversed().map(String.init)
        let result = dataStr.joined(separator: "")
        return result == String(x)
    }
}
*/

// 参考答案:
// 1.考虑特殊case, 如负数-12、末尾数为0的非零数120, 这些不是回文数
// 2.反转一半数字避免整数溢出问题(分个数为奇数和偶数两种情况)
class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        // case1: 小于0, 如-12
        // case2: 这个数不为0且末尾数为0,如 120
        if x < 0 || (x % 10 == 0 && x != 0) { return false }
        
        var old = x
        var new = 0
        // 遍历一半, 如12321
        /*
         第0次:old:1232 new:1
         第1次:old:123 new:12
         第2次:old:12 new:123
         */
        // 最终结果old:12 new:123
        while old > new {
            new = new * 10 + old % 10
            old /= 10
        }
        // 个数为奇数: new再除以10, 两者相等, 说明是回文数, 如11211等
        // 个数为偶数: 两者直接就相等也说明是回文数, 如11、22等
        if old == new / 10 || old == new{ return true }
        return false
    }
}

let solution = Solution()
print(solution.isPalindrome(-123342))
