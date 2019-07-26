//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//


/*
 * @lc app=leetcode.cn id=125 lang=swift
 *
 * [125] 验证回文串
 *
 * https://leetcode-cn.com/problems/valid-palindrome/description/
 *
 * algorithms
 * Easy (39.96%)
 * Total Accepted:    44K
 * Total Submissions: 108.9K
 * Testcase Example:  '"A man, a plan, a canal: Panama"'
 *
 * 给定一个字符串，验证它是否是回文串，只考虑字母和数字字符，可以忽略字母的大小写。
 *
 * 说明：本题中，我们将空字符串定义为有效的回文串。
 *
 * 示例 1:
 *
 * 输入: "A man, a plan, a canal: Panama"
 * 输出: true
 *
 *
 * 示例 2:
 *
 * 输入: "race a car"
 * 输出: false
 *
 *
 */
// 使用双指针法
// 执行用时 :68 ms, 在所有 Swift 提交中击败了54.84%的用户
/*
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var list: [Character] = Array(s.lowercased())
        let count = list.count
        var i = 0, j = count - 1
        while i < j {
            // 非字母数字处理
            while !(list[i] <= "9" && list[i] >= "0" || list[i] <= "z" && list[i] >= "a") && i < count - 1 {
                i += 1
            }
            while !(list[j] <= "9" && list[j] >= "0" || list[j] <= "z" && list[j] >= "a")  && j > 0{
                j -= 1
            }
            // 字符比较
            if i < j && list[i] != list[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}
*/


/*
  优化方案:
 1. 使用asciiValue或者utf8比较
 2. 把utf8添加到新的数组中, 添加的同时过滤非字母不和非数字
 */

// 执行用时 :32 ms, 在所有 Swift 提交中击败了93.55%的用户
class Solution {
    func isPalindrome(_ s: String) -> Bool {
        var numList = [UInt8]()
        // 将字符转化为utf8值, 并过滤非字母数字
        for c in s.utf8 {
            if (c >= 97 && c <= 122){
                numList.append(c - 32)
            } else if (c <= 90 && c >= 65 || c <= 57 && c >= 48) {
                numList.append(c)
            }
        }
        
        var i = 0, j = numList.count - 1
        while i < j {
            // 字符比较
            if numList[i] != numList[j] {
                return false
            }
            i += 1
            j -= 1
        }
        return true
    }
}


let so = Solution()
print(so.isPalindrome("A man, a plan, a canal: Panama"))
print(so.isPalindrome("race a car"))
print(so.isPalindrome(""))
print(so.isPalindrome(" "))
print(so.isPalindrome("!!!"))
print(so.isPalindrome("a."))
print(so.isPalindrome("aba"))
print(so.isPalindrome("abba"))
print(so.isPalindrome("abm dba"))
print(so.isPalindrome(",."))
print(so.isPalindrome(", ."))
