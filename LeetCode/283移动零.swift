//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=283 lang=swift
 *
 * [283] 移动零
 *
 * https://leetcode-cn.com/problems/move-zeroes/description/
 *
 * algorithms
 * Easy (54.66%)
 * Total Accepted:    60.3K
 * Total Submissions: 107.7K
 * Testcase Example:  '[0,1,0,3,12]'
 *
 * 给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。
 *
 * 示例:
 *
 * 输入: [0,1,0,3,12]
 * 输出: [1,3,12,0,0]
 *
 * 说明:
 *
 *
 * 必须在原数组上操作，不能拷贝额外的数组。
 * 尽量减少操作次数。
 *
 *
 */

// 思路: 用一个临时变量i标记非零值索引, 从左往右遍历数组, 遇到非零值, 放到nums[i]的位置, 同时i自增i, 数组遍历完毕, 把从i到nums.count-1位置的所有元素设置为0
// 执行用时 :56 ms, 在所有 Swift 提交中击败了95.73%的用户
class Solution {
    func moveZeroes(_ nums: inout [Int]) {
        var i = 0
        for idx in 0..<nums.count {
            if nums[idx] != 0 {
                nums[i] = nums[idx]
                i += 1
            }
        }
        // 从i到nums.count-1位置的所有元素设置为0
        for idx in i..<nums.count {
            nums[idx] = 0
        }
    }
}



var a = [0,1,0,3,12]
Solution().moveZeroes(&a)
assert(a == [1,3,12,0,0])

var b = [Int]()
Solution().moveZeroes(&b)
assert(b == [Int]())







