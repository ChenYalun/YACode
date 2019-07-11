//
//  main.swift
//  Le
//
//  Created by Chen,Yalun on 2019/3/20.
//  Copyright © 2019 Chen,Yalun. All rights reserved.
//


/*
 * @lc app=leetcode.cn id=3 lang=swift
 *
 * 3. 无重复字符的最长子串
 *
 * https://leetcode-cn.com/problems/longest-substring-without-repeating-characters/description/
 *
 * algorithms
 * Medium (29.93%)
 * Total Accepted:    152.5K
 * Total Submissions: 504.6K
 * Testcase Example:  '"abcabcbb"'
 *
 * 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。
 *
 * 示例 1:
 *
 * 输入: "abcabcbb"
 * 输出: 3
 * 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。
 *
 *
 * 示例 2:
 *
 * 输入: "bbbbb"
 * 输出: 1
 * 解释: 因为无重复字符的最长子串是 "b"，所以其长度为 1。
 *
 *
 * 示例 3:
 *
 * 输入: "pwwkew"
 * 输出: 3
 * 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
 * 请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 *
 *
 */



// 这种写法很容易理解, 但是效率不高, append操作、contains操作、remove操作会很容易超时
/*
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 不重复元素窗口
        var list = [Character]()
        // 不重复元素长度
        var length = 0
        let characters: [Character] = Array(s)
        for idx in 0..<s.count {
            let next = characters[idx]
            if list.contains(next) {
                // 窗口右边是重复元素, 将左边窗口滑动到重复元素第一次出现的位置
                let idx = list.firstIndex(of: next)!
                // "移除"前n个元素
                list.removeFirst(idx + 1)
            }
            list.append(next)
            length = max(length, list.count)
        }
        return length
    }
}
*/




/*
思路：初始化游标start，end开始及结束位，ans字符长度，cache Hash记录

如果没有重复字符出现： 循环 游标end开始步进如果没有遇到重复字符ans为 （end - start ），并用当前字符为Key记录当前 end 游标的index

有重复字符出现 1.如果碰到重复字符(从我们Hash记录中找到) 2.更新start游标移动至 重复字符的下标的后一位 3.取之前ans字符长度和现在字符长度最大值为新的无重复字符的最长子串
*/


// 关键词: 字典判重 左右指针
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // 不重复元素窗口
        var map: [Character: Int] = [:]
        // 转成数组, 用于快速访问元素
        let characters: [Character] = Array(s)
        // 左边指针 右边指针 不重复元素长度
        var left = 0, right = 0, length = 0
        for idx in 0..<s.count {
            let char = characters[idx]
            if let a = map[char] {
                // 遇到重复元素, 更新左指针
                left = max(left, a)
            }
            // 每次迭代, 右指针移动一位
            right += 1
            // 如果不是重复元素, 把这个元素存储到字典中
            // 如果是重复元素, 更新这个元素的索引为最新值(从1开始计数的)
            map[char] = right
            length = max(length, right - left)
        }
        return length
    }
}


var s = Solution()
print(s.lengthOfLongestSubstring("abcebacm"))





