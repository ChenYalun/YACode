//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=350 lang=swift
 *
 * [350] 两个数组的交集 II
 *
 * https://leetcode-cn.com/problems/intersection-of-two-arrays-ii/description/
 *
 * algorithms
 * Easy (42.11%)
 * Total Accepted:    44.5K
 * Total Submissions: 101.7K
 * Testcase Example:  '[1,2,2,1]\n[2,2]'
 *
 * 给定两个数组，编写一个函数来计算它们的交集。
 *
 * 示例 1:
 *
 * 输入: nums1 = [1,2,2,1], nums2 = [2,2]
 * 输出: [2,2]
 *
 *
 * 示例 2:
 *
 * 输入: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 * 输出: [4,9]
 *
 * 说明：
 *
 *
 * 输出结果中每个元素出现的次数，应与元素在两个数组中出现的次数一致。
 * 我们可以不考虑输出结果的顺序。
 *
 *
 * 进阶:
 *
 *
 * 如果给定的数组已经排好序呢？你将如何优化你的算法？
 * 如果 nums1 的大小比 nums2 小很多，哪种方法更优？
 * 如果 nums2 的元素存储在磁盘上，磁盘内存是有限的，并且你不能一次加载所有的元素到内存中，你该怎么办？
 *
 *
 */
// 两点: 1. 取交集 2.结果中的数字出现的次数取两个数组中该数字出现次数的较小值
// 执行用时 :44 ms, 在所有 Swift 提交中击败了80.00%的用户
class Solution {
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var aDict = [Int : Int]()
        var resList = [Int]()
        // nums1使用字典存储, key为数字, value为次数
        for ele in nums1 {
            (aDict[ele] != nil) ? (aDict[ele]! += 1) : (aDict[ele] = 1)
        }
        for ele in nums2 {
            if aDict[ele] != nil && aDict[ele]! != 0 {
                resList.append(ele)
                // 把次数减一
                aDict[ele]! -= 1
            }
        }
        return resList
    }
}


print(Solution().intersect([1,2,2,1], [2]))
print(Solution().intersect([1,2,2,1], []))
print(Solution().intersect([], []))
print(Solution().intersect([1,2,2,1], [2,2]))
print(Solution().intersect([4,9,5], [9,4,9,8,4]))
