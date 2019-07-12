//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=38 lang=swift
 *
 * [38] 报数
 *
 * https://leetcode-cn.com/problems/count-and-say/description/
 *
 * algorithms
 * Easy (50.50%)
 * Total Accepted:    36.6K
 * Total Submissions: 71.9K
 * Testcase Example:  '1'
 *
 * 报数序列是一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
 *
 * 1.     1
 * 2.     11
 * 3.     21
 * 4.     1211
 * 5.     111221
 * 6.     312211
 * 7.     13112221
 * 8.     1113213211
 * 9.     31131211131221
 * 1 被读作  "one 1"  ("一个一") , 即 11。
 * 11 被读作 "two 1s" ("两个一"）, 即 21。
 * 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
 *
 * 给定一个正整数 n（1 ≤ n ≤ 30），输出报数序列的第 n 项。
 *
 * 注意：整数顺序将表示为一个字符串。
 *
 *
 *
 * 示例 1:
 *
 * 输入: 1
 * 输出: "1"
 *
 *
 * 示例 2:
 *
 * 输入: 4
 * 输出: "1211"
 *
 *
 */
class Solution {
    // 这个函数用于返回给定字符串的结果
    // 比如 "12433355" --> 1112143325
    func say(_ n: String) -> String {
        // 增加一个字符, 用于n中最后一个字符的统计
        let n = n + "_"
        let list = Array(n)
        var re = ""
        var start = 1
        for idx in 0..<list.count - 1 {
            if list[idx] != list[idx + 1] {
                re += String(start)
                re += String(list[idx])
                start = 1
            } else {
                start += 1
            }
        }
        return re
    }
    
    func countAndSay(_ n: Int) -> String {
        if n == 1 {
            return "1"
        }
        // 递归调用
        return say(countAndSay(n - 1))
    }
}


var s = Solution()
//print(s.say("433333233455"))
print(s.countAndSay(0))
print(s.countAndSay(2))
print(s.countAndSay(3))
print(s.countAndSay(4))
print(s.countAndSay(5))
print(s.countAndSay(6))
print(s.countAndSay(7))
print(s.countAndSay(8))
print(s.countAndSay(9))





