//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=66 lang=swift
 *
 * [66] 加一
 *
 * https://leetcode-cn.com/problems/plus-one/description/
 *
 * algorithms
 * Easy (39.21%)
 * Total Accepted:    61K
 * Total Submissions: 154K
 * Testcase Example:  '[1,2,3]'
 *
 * 给定一个由整数组成的非空数组所表示的非负整数，在该数的基础上加一。
 *
 * 最高位数字存放在数组的首位， 数组中每个元素只存储一个数字。
 *
 * 你可以假设除了整数 0 之外，这个整数不会以零开头。
 *
 * 示例 1:
 *
 * 输入: [1,2,3]
 * 输出: [1,2,4]
 * 解释: 输入数组表示数字 123。
 *
 *
 * 示例 2:
 *
 * 输入: [4,3,2,1]
 * 输出: [4,3,2,2]
 * 解释: 输入数组表示数字 4321。
 *
 *
 */

/*
// 执行用时 : 16 ms , 在所有 Swift 提交中击败了 74.42% 的用户
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var re = [Int]()
        var digit = 0
        for idx in (0..<digits.count).reversed() {
            var a = digits[idx]
            if idx == digits.count - 1 {
                // 末位加一操作
                a += 1
            } else {
                // 非末位加上原先的进位
                a += digit
                digit = 0
            }

            if (a + digit == 10) || a == 10 {
                // 需要进位
                re.append(0)
                // 设置进位值
                digit += 1
            } else {
                // 不需要进位
                re.append(a + digit)
            }
        }

        if digit == 1 {
            // 说明进位之后没处理完
            re.append(1)
        }
        return re.reversed()
    }
}
*/

// 执行用时 : 12 ms , 在所有 Swift 提交中击败了 92.25% 的用户
// 避免reversed数组, 而是采用reversed字符串, 效率高了一点点
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        var re = ""
        var digit = 0
        for idx in (0..<digits.count).reversed() {
            var a = digits[idx]
            if idx == digits.count - 1 {
                // 末位加一操作
                a += 1
            } else {
                // 非末位加上原先的进位
                a += digit
                digit = 0
            }
            
            if (a + digit == 10) || a == 10 {
                // 需要进位
                re += "0"
                // 设置进位值
                digit += 1
            } else {
                // 不需要进位
                re += "\(a + digit)"
            }
        }
        
        if digit == 1 {
            // 说明进位之后没处理完
            re += "1"
        }
        var r = [Int]()
        for i in re.reversed() {
            r.append(Int(String(i))!)
        }
        return r
    }
}



var s = Solution()
print(s.plusOne([9,]))






