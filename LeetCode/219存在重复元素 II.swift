//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=219 lang=swift
 *
 * [219] 存在重复元素 II
 *
 * https://leetcode-cn.com/problems/contains-duplicate-ii/description/
 *
 * algorithms
 * Easy (34.66%)
 * Total Accepted:    18.5K
 * Total Submissions: 52.1K
 * Testcase Example:  '[1,2,3,1]\n3'
 *
 * 给定一个整数数组和一个整数 k，判断数组中是否存在两个不同的索引 i 和 j，使得 nums [i] = nums [j]，并且 i 和 j
 * 的差的绝对值最大为 k。
 *
 * 示例 1:
 *
 * 输入: nums = [1,2,3,1], k = 3
 * 输出: true
 *
 * 示例 2:
 *
 * 输入: nums = [1,0,1,1], k = 1
 * 输出: true
 *
 * 示例 3:
 *
 * 输入: nums = [1,2,3,1,2,3], k = 2
 * 输出: false
 *
 */

// 超时
/*
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var left = 0
        var right = 1
        while left < nums.count {
            while right - left <= k && right < nums.count {
                if nums[left] == nums[right] {
                    return true
                }
                right += 1
            }
            left += 1
            right = left + 1
        }
        
        return false
    }
}
*/
/*
 
 设置查找表record，用来保存每次遍历时插入的元素，record 的最大长度为k
 遍历数组nums，每次遍历的时候在record 查找是否存在相同的元素，如果存在则返回true，遍历结束
 如果此次遍历在record 未查找到，则将该元素插入到record 中，而后查看record 的长度是否为k + 1
 如果此时record 的长度为k + 1，则删减record的元素，该元素的值为nums[i - k]
 如果遍历完整个数组nums未查找到则返回false

 */
// 执行用时 :152 ms, 在所有 Swift 提交中击败了94.44%的用户
class Solution {
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        // 最关键是:值作为key, 索引作为value
        var record = [Int: Int]()
        for idx in 0..<nums.count {
            if record[nums[idx]] != nil {
                return true
            }
            record[nums[idx]] = idx
            if record.count == k + 1 {
                // 移除nums[idx - k]
                record[nums[idx - k]] = nil
            }
        }
        return false
    }
}



let so = Solution()
assert(so.containsNearbyDuplicate([], 3) == false)
assert(so.containsNearbyDuplicate([99,99], 2))
assert(so.containsNearbyDuplicate([1,2,3,1], 3))
assert(so.containsNearbyDuplicate([1,0,1,1], 1))
assert(so.containsNearbyDuplicate([1,2,3,1,2,3], 2) == false)
assert(so.containsNearbyDuplicate([1,2,3,1,2,3], 3))
assert(so.containsNearbyDuplicate([1], 0) == false)
assert(so.containsNearbyDuplicate([], 1) == false)


