//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//
/*
 * @lc app=leetcode.cn id=349 lang=swift
 *
 * [349] 两个数组的交集
 *
 * https://leetcode-cn.com/problems/intersection-of-two-arrays/description/
 *
 * algorithms
 * Easy (63.44%)
 * Total Accepted:    30.6K
 * Total Submissions: 46.8K
 * Testcase Example:  '[1,2,2,1]\n[2,2]'
 *
 * 给定两个数组，编写一个函数来计算它们的交集。
 *
 * 示例 1:
 *
 * 输入: nums1 = [1,2,2,1], nums2 = [2,2]
 * 输出: [2]
 *
 *
 * 示例 2:
 *
 * 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 * 输出: [9,4]
 *
 * 说明:
 *
 *
 * 输出结果中的每个元素一定是唯一的。
 * 我们可以不考虑输出结果的顺序。
 *
 *
 */

// 执行用时 :36 ms, 在所有 Swift 提交中击败了90.67%的用户
// 当然, 也可以使用系统的 return Array(Set(nums2).intersection(Set(nums1)))
class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var aDict = [Int : Int]()
        var resList = [Int]()
        // nums1使用字典存储
        for ele in nums1 {
            aDict[ele] = 1
        }
        let set = Set(nums2)
        // nums2使用set存储
        for ele in set {
            if aDict[ele] == 1 {
                resList.append(ele)
            }
        }
        return resList
    }
}

print(Solution().intersection([1,2,2,1], [2]))
print(Solution().intersection([1,2,2,1], []))
print(Solution().intersection([], []))
print(Solution().intersection([1,2,2,1], [2,2]))
print(Solution().intersection([4,9,5], [9,4,9,8,4]))
