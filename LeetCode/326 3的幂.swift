//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=326 lang=swift
 *
 * [326] 3的幂
 *
 * https://leetcode-cn.com/problems/power-of-three/description/
 *
 * algorithms
 * Easy (44.33%)
 * Total Accepted:    23.5K
 * Total Submissions: 52.3K
 * Testcase Example:  '27'
 *
 * 给定一个整数，写一个函数来判断它是否是 3 的幂次方。
 *
 * 示例 1:
 *
 * 输入: 27
 * 输出: true
 *
 *
 * 示例 2:
 *
 * 输入: 0
 * 输出: false
 *
 * 示例 3:
 *
 * 输入: 9
 * 输出: true
 *
 * 示例 4:
 *
 * 输入: 45
 * 输出: false
 *
 * 进阶：
 * 你能不使用循环或者递归来完成本题吗？
 *
 */


// 循环
// 执行用时 :72 ms, 在所有 Swift 提交中击败了80.43%的用户
/*
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        var i = 1
        while i < n {
            i *= 3
        }
        return i == n
    }
}
 */

// 原理: 3 的幂次的质因子只有 3, int 类型，正数范围是 0 - 231，在此范围中允许的最大的 3 的次方数为 319 = 1162261467
// 3 9 27 81 243 ...
// 执行用时 :76 ms, 在所有 Swift 提交中击败了78.26%的用户
class Solution {
    func isPowerOfThree(_ n: Int) -> Bool {
        return n > 0 && 1162261467 % n == 0
    }
}

assert(Solution().isPowerOfThree(27))
assert(!Solution().isPowerOfThree(0))
assert(Solution().isPowerOfThree(1))
assert(Solution().isPowerOfThree(9))
assert(!Solution().isPowerOfThree(45))


