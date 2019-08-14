//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//

/*
 * @lc app=leetcode.cn id=239 lang=swift
 *
 * [239] 滑动窗口最大值
 *
 * https://leetcode-cn.com/problems/sliding-window-maximum/description/
 *
 * algorithms
 * Hard (41.52%)
 * Total Accepted:    11.6K
 * Total Submissions: 27.5K
 * Testcase Example:  '[1,3,-1,-3,5,3,6,7]\n3'
 *
 * 给定一个数组 nums，有一个大小为 k 的滑动窗口从数组的最左侧移动到数组的最右侧。你只可以看到在滑动窗口内的 k
 * 个数字。滑动窗口每次只向右移动一位。
 *
 * 返回滑动窗口中的最大值。
 *
 *
 *
 * 示例:
 *
 * 输入: nums = [1,3,-1,-3,5,3,6,7], 和 k = 3
 * 输出: [3,3,5,5,6,7]
 * 解释:
 *
 * ⁠ 滑动窗口的位置                最大值
 * ---------------               -----
 * [1  3  -1] -3  5  3  6  7       3
 * ⁠1 [3  -1  -3] 5  3  6  7       3
 * ⁠1  3 [-1  -3  5] 3  6  7       5
 * ⁠1  3  -1 [-3  5  3] 6  7       5
 * ⁠1  3  -1  -3 [5  3  6] 7       6
 * ⁠1  3  -1  -3  5 [3  6  7]      7
 *
 *
 *
 * 提示：
 *
 * 你可以假设 k 总是有效的，在输入数组不为空的情况下，1 ≤ k ≤ 输入数组的大小。
 *
 *
 *
 * 进阶：
 *
 * 你能在线性时间复杂度内解决此题吗？
 *
 */

// 普通方法:
// 执行用时 :448 ms, 在所有 Swift 提交中击败了38.89%的用户
/*
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 {
            return []
        }
        
        func max(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
            var max = nums[start]
            for idx in start...end {
                if max < nums[idx] {
                    max = nums[idx]
                }
            }
            return max
        }
        
        var results = [Int]()
        for idx in 0..<nums.count - k + 1 {
            results.append(max(nums, idx, idx + k - 1))
        }
        return results
    }
}
*/

// 用双向队列保存数字的下标，遍历整个数组
// 如果此时队列的首元素是 i-k 的话，表示此时窗口向右移了一步，则移除队首元素。
// 然后比较队尾元素和将要进来的值，如果小的话就都移除，然后此时我们把队首元素加入结果中即可，
// 执行用时 :252 ms, 在所有 Swift 提交中击败了72.22%的用户
/*
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        if nums.count == 0 {
            return []
        }
        
        var result = [Int]()
        var queue = [Int]()
        for idx in 0..<nums.count {
            // 1.首元素是 i-k,表示此时窗口向右移了一步，则移除队首元素
            if !queue.isEmpty && queue[0] == idx - k {
                queue.remove(at: 0)
            }
            // 2.保证新添加的元素要大于queue中的所有元素
            while !queue.isEmpty && nums[queue.last!] < nums[idx] {
                queue.remove(at: queue.count - 1)
            }
            queue.append(idx)
            // 3.添加最大元素
            if (idx >= k - 1) {
                result.append(nums[queue.first!])
            }
        }
        return result
    }
}
*/

// 模范解法:使用动态数组
class Solution {
    func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
        var ans: [Int] = [], queue: [Int] = Array(repeating: 0, count: k), head = 0, tail = 0
        for i in 0..<nums.count {
            while head != tail && i - queue[head] + 1 > k {
                head = (head + 1) % k
            }
            while tail != head && nums[queue[(tail - 1 + k) % k]] < nums[i] {
                tail = (tail - 1 + k) % k
            }
            queue[tail] = i
            tail = (tail + 1) % k
            if i + 1 >= k {
                ans.append(nums[queue[head]])
            }
        }
        return ans
    }
}

let so = Solution()
assert(so.maxSlidingWindow([], 3) == [])
assert(so.maxSlidingWindow([9, 11], 2) == [11])
assert(so.maxSlidingWindow([1,3,-1,-3,5,3,6,7], 3) == [3,3,5,5,6,7])



