//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//


/*
 * @lc app=leetcode.cn id=169 lang=swift
 *
 * [169] 求众数
 *
 * https://leetcode-cn.com/problems/majority-element/description/
 *
 * algorithms
 * Easy (59.60%)
 * Total Accepted:    56.1K
 * Total Submissions: 93.3K
 * Testcase Example:  '[3,2,3]'
 *
 * 给定一个大小为 n 的数组，找到其中的众数。众数是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。
 *
 * 你可以假设数组是非空的，并且给定的数组总是存在众数。
 *
 * 示例 1:
 *
 * 输入: [3,2,3]
 * 输出: 3
 *
 * 示例 2:
 *
 * 输入: [2,2,1,1,1,2,2]
 * 输出: 2
 *
 *
 */

// 方法一: 使用字典记录每个数字出现的次数, O(n)的时间复杂度, O(n)的空间复杂度
// 执行用时 :244 ms, 在所有 Swift 提交中击败了60.26%的用户
/*
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        // 数字作为key 出现的次数作为value
        var dict = [Int: Int]()
        for num in nums {
            if dict[num] == nil {
                // 说明次数为0, 设置次数为1
                dict[num] = 1
                continue
            }
            // 说明次数大于0, 在这基础上加一
            let value = dict[num]!
            dict[num] = 1 + value
            if value >= nums.count / 2 {
                // 根据题目, 最大次数大于 ⌊ n/2 ⌋ 的元素
                return num
            }
        }
        return nums.first!
    }
}
*/



// 方法二:摩尔投票法
/*
 即如果把 该众数记为 +1 ，把其他数记为 −1 ，将它们全部加起来，和是大于 0 的。
 
 所以可以这样操作：
 
 设置两个变量 candidate 和 count，candidate 用来保存数组中遍历到的某个数字，count 表示当前数字的出现次数，一开始 candidate 保存为数组中的第一个数字，count 为 1
 遍历整个数组
 如果数字与之前 candidate 保存的数字相同，则 count 加 1
 如果数字与之前 candidate 保存的数字不同，则 count 减 1
 如果出现次数 count 变为 0 ，candidate 进行变化，保存为当前遍历的那个数字，并且同时把 count 重置为 1
 遍历完数组中的所有数字即可得到结果
 */


// 执行用时 :192 ms, 在所有 Swift 提交中击败了93.38%的用户
class Solution {
    func majorityElement(_ nums: [Int]) -> Int {
        var count = 0, candidate = nums.first!
        for num in nums {
            if candidate == num {
                count += 1
            } else {
                count -= 1
                if count == 0 {
                    candidate = num
                    count = 1
                }
            }
        }
        return candidate
    }
}

let so = Solution()
print(so.majorityElement([2,2,1,1,1,2,2]))

