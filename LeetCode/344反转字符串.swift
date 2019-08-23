//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=344 lang=swift
 *
 * [344] 反转字符串
 *
 * https://leetcode-cn.com/problems/reverse-string/description/
 *
 * algorithms
 * Easy (66.82%)
 * Total Accepted:    68.4K
 * Total Submissions: 101.5K
 * Testcase Example:  '["h","e","l","l","o"]'
 *
 * 编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。
 *
 * 不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。
 *
 * 你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。
 *
 *
 *
 * 示例 1：
 *
 * 输入：["h","e","l","l","o"]
 * 输出：["o","l","l","e","h"]
 *
 *
 * 示例 2：
 *
 * 输入：["H","a","n","n","a","h"]
 * 输出：["h","a","n","n","a","H"]
 *
 */

// 交换两个字符的位置
// 执行用时 :416 ms, 在所有 Swift 提交中击败了82.76%的用户
class Solution {
    func reverseString(_ s: inout [Character]) {
        for idx in 0..<s.count / 2 {
            // 元组直接赋值: (a, b) = (b, a)
            (s[idx], s[s.count - idx - 1]) = (s[s.count - idx - 1], s[idx])
            
            // 也可以利用Swift的交互函数: s.swapAt(idx, s.count - idx - 1)
        }
    }
}



var a: [Character] = ["h","e","l","l","o"]
Solution().reverseString(&a)
print(a) // ["o","l","l","e","h"]

var b: [Character] = ["H","a","n","n","a","h"]
Solution().reverseString(&b)
print(b) // ["h","a","n","n","a","H"]



