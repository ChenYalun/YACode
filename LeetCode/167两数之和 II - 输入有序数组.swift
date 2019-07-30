//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=167 lang=swift
 *
 * [167] 两数之和 II - 输入有序数组
 *
 * https://leetcode-cn.com/problems/two-sum-ii-input-array-is-sorted/description/
 *
 * algorithms
 * Easy (48.85%)
 * Total Accepted:    32.7K
 * Total Submissions: 66.2K
 * Testcase Example:  '[2,7,11,15]\n9'
 *
 * 给定一个已按照升序排列 的有序数组，找到两个数使得它们相加之和等于目标数。
 *
 * 函数应该返回这两个下标值 index1 和 index2，其中 index1 必须小于 index2。
 *
 * 说明:
 *
 *
 * 返回的下标值（index1 和 index2）不是从零开始的。
 * 你可以假设每个输入只对应唯一的答案，而且你不可以重复使用相同的元素。
 *
 *
 * 示例:
 *
 * 输入: numbers = [2, 7, 11, 15], target = 9
 * 输出: [1,2]
 * 解释: 2 与 7 之和等于目标数 9 。因此 index1 = 1, index2 = 2 。
 *
 */

// 使用左右指针
// 执行用时 :48 ms, 在所有 Swift 提交中击败了94.74%的用户
/* 原理:当左右指针对应的元素相加小于target, 说明左指针指向的元素偏小, 左指针向右移动一位
 当左右指针对应的元素相加大于target, 说明右指针指向的元素偏大, 右指针向左移动一位
 直到左右指针对应的元素相加等于target
 */
class Solution {
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        if numbers.count <= 1 {
            return []
        }
        var left = 0
        var right = numbers.count - 1
        while numbers[left] + numbers[right] != target {
            if numbers[left] + numbers[right] < target {
                // left右移
                left += 1
            } else {
                // right右移
                right -= 1
            }
            if left >= right {
                // 说明有序数组有误
                return []
            }
        }
        return [left + 1, right + 1]
    }
}

let so = Solution()
print(so.twoSum([2, 17, 11, 15], 9))
