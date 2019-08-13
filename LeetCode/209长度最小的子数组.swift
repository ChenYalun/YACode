//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=209 lang=swift
 *
 * [209] 长度最小的子数组
 *
 * https://leetcode-cn.com/problems/minimum-size-subarray-sum/description/
 *
 * algorithms
 * Medium (38.97%)
 * Total Accepted:    13.4K
 * Total Submissions: 34.1K
 * Testcase Example:  '7\n[2,3,1,2,4,3]'
 *
 * 给定一个含有 n 个正整数的数组和一个正整数 s ，找出该数组中满足其和 ≥ s 的长度最小的连续子数组。如果不存在符合条件的连续子数组，返回 0。
 *
 * 示例:
 *
 * 输入: s = 7, nums = [2,3,1,2,4,3]
 * 输出: 2
 * 解释: 子数组 [4,3] 是该条件下的长度最小的连续子数组。
 *
 *
 * 进阶:
 *
 * 如果你已经完成了O(n) 时间复杂度的解法, 请尝试 O(n log n) 时间复杂度的解法。
 *
 */

// 执行用时 :80 ms, 在所有 Swift 提交中击败了100.00%的用户
class Solution {
    func minSubArrayLen(_ s: Int, _ nums: [Int]) -> Int {
        var minLength = 0
        var left = 0, right = -1
        var sum = 0
        while left < nums.count {
            if sum < s && right < nums.count - 1 {
                // 右指针持续向右移动, 直到sum 大于等于s
                right += 1
                sum += nums[right]
            } else {
                // sum 大于等于s 或者 右指针移动到最后
                sum -= nums[left]
                left += 1
            }
            if sum >= s {
                // 目前sum 大于等于s, 得到长度
                if minLength == 0 || right - left + 1 < minLength {
                    minLength = right - left + 1
                }
            }
        }
        return minLength
    }
}

let so = Solution()
assert(so.minSubArrayLen(100, []) == 0)
assert(so.minSubArrayLen(7, [2,3,1,2,4,3]) == 2)
assert(so.minSubArrayLen(15, [5,1,3,5,10,7,4,9,2,8]) == 2)


