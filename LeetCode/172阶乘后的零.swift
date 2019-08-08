//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=172 lang=swift
 *
 * [172] 阶乘后的零
 *
 * https://leetcode-cn.com/problems/factorial-trailing-zeroes/description/
 *
 * algorithms
 * Easy (38.52%)
 * Total Accepted:    15.8K
 * Total Submissions: 40.2K
 * Testcase Example:  '3'
 *
 * 给定一个整数 n，返回 n! 结果尾数中零的数量。
 *
 * 示例 1:
 *
 * 输入: 3
 * 输出: 0
 * 解释: 3! = 6, 尾数中没有零。
 *
 * 示例 2:
 *
 * 输入: 5
 * 输出: 1
 * 解释: 5! = 120, 尾数中有 1 个零.
 *
 * 说明: 你算法的时间复杂度应为 O(log n) 。
 *
 */

// 思路: 只有 2（它的倍数） 与 5 （它的倍数）相乘才有 0 出现。
// 一个数字进行拆分后 2 的个数肯定是大于 5 的个数的，所以能匹配多少对取决于 5 的个数
// 那么问题又变成了 统计阶乘数里有多少个 5 这个因子。

// 执行用时 :4 ms, 在所有 Swift 提交中击败了100.00%的用户
// 方法一:递归
/*
class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        return n == 0 ? 0 : n / 5 + trailingZeroes(n / 5)
    }
}
*/


// 执行用时 :8 ms, 在所有 Swift 提交中击败了93.33%的用户
// 方法二:迭代
class Solution {
    func trailingZeroes(_ n: Int) -> Int {
        var num = n, count = 0
        while num != 0 {
            count += num / 5
            num = num / 5
        }
        return count
    }
}


let so = Solution()
print(so.trailingZeroes(5))

