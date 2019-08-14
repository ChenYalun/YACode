//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=268 lang=swift
 *
 * [268] 缺失数字
 *
 * https://leetcode-cn.com/problems/missing-number/description/
 *
 * algorithms
 * Easy (50.98%)
 * Total Accepted:    28.1K
 * Total Submissions: 54.1K
 * Testcase Example:  '[3,0,1]'
 *
 * 给定一个包含 0, 1, 2, ..., n 中 n 个数的序列，找出 0 .. n 中没有出现在序列中的那个数。
 *
 * 示例 1:
 *
 * 输入: [3,0,1]
 * 输出: 2
 *
 *
 * 示例 2:
 *
 * 输入: [9,6,4,2,3,5,7,0,1]
 * 输出: 8
 *
 *
 * 说明:
 * 你的算法应具有线性时间复杂度。你能否仅使用额外常数空间来实现?
 *
 */

// 想到求和法
// 执行用时 :200 ms, 在所有 Swift 提交中击败了100.00%的用户
/*
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        let count = nums.count
        var sum = (count * (count + 1)) >> 1
        for idx in 0..<count {
            sum -= nums[idx]
        }
        return sum
    }
}
 */

// 发现还可以使用异或法...
class Solution {
    func missingNumber(_ nums: [Int]) -> Int {
        // 完整没有缺失的异或结果是从0一直到count
        /*
        var s = 0
        for idx in 0..<nums.count {
            s ^= idx
        }
         */
        let count = nums.count
        var res = count
        for idx in 0..<count {
            res = res^nums[idx]^idx
        }
        return res
    }
}

// 还有一种二分法, 需要排序, 效率不高

let so = Solution()
assert(so.missingNumber([]) == 0)
assert(so.missingNumber([0,2]) == 1)
assert(so.missingNumber([3,0,1]) == 2)
assert(so.missingNumber([9,6,4,2,3,5,7,0,1]) == 8)



